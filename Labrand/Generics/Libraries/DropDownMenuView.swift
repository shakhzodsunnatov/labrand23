//
//  DropDownMenuView.swift
//  SubMenuProject
//
//  Created by Shakhzod on 19/02/23.
//

import UIKit

protocol DropDownMenuViewDelegate: AnyObject {
    func selectedMenu(index: Int)
    func menuStateChanged(_ isActive: Bool)
}

final class DropDownMenuView: UIView {
    
    //MARK: - Public Properties
    
    var placeHolder: String? = "Place Holder"
    var menuSubTitles: [String] = []
    var textAlignment: NSTextAlignment = .center
    var rowHeight: CGFloat = 40
    var radius: CGFloat = 0.0
    var borderWidth: CGFloat = 0.0
    var borderColor: CGColor?
    var selectedItemColor: UIColor?
    var subMenusColor: UIColor = .black
    
    weak var delegate: DropDownMenuViewDelegate?
    var selectedMenu: (Int)->Void = {_ in}
    
    //MARK: - Private UI
    
    private var containerView: UIView!
    private var selectedLabel: UILabel!
    private var chevronIconView: UIImageView!
    private var constraintHeight = NSLayoutConstraint()
    
    private var subButtons: [UIButton] = []
    // Helpers
    private var isActive = false {
        didSet { chevronIconView.image = chevronIcon }
    }
    
    private var viewIsCreated = false
    
    private var chevronIcon: UIImage {
        return UIImage(systemName: "chevron.\(isActive ? "up" : "down")")!
    }
    
    //MARK: - init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupUI()
    }
    
    convenience init(menuSubTitles: [String]) {
        self.init(frame: .zero)
        self.menuSubTitles = menuSubTitles
        self.setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Layout
    
    override func layoutSubviews() {
        super.layoutSubviews()
        oneTimeCreateUIComponents()
        layoutUI()
    }
    
    
    //MARK: - Private Configurations
    
    private func setupUI() {
        
        containerView = createContainerView()
    }
    
    private func layoutUI() {
        // ContainerView
        self.layer.cornerRadius = radius
        self.layer.borderWidth = borderWidth
        self.layer.borderColor = borderColor
        self.backgroundColor = .white
        self.layer.zPosition = 999
        
        //Selected Label
        selectedLabel.textColor = selectedItemColor
        selectedLabel.layer.cornerRadius = radius
    }
    
    //MARK: - Tap Gesture
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        menuPressed()
    }
    
}



//MARK: - Public

extension DropDownMenuView {
    
    func hideMenu() {
        showHideMenu(true)
    }
    
}



//MARK: -  Actions

extension DropDownMenuView {
    
    @objc
    private func menuPressed() {
        guard !isActive else { return }
        showHideMenu(false)
    }
    
    @objc
    private func subMenuPressed(_ sender: UIButton) {
        updateSelectedItem(sender.tag)
        delegate?.selectedMenu(index: sender.tag)
        selectedMenu(sender.tag)
        guard isActive else { return }
        showHideMenu(true)
    }
    
}


//MARK: - Configurations

extension DropDownMenuView {
    
    private func showHideMenu(_ isHidden: Bool) {
        if !isHidden {
            self.showAnimation {
                let fullHeight = self.rowHeight * CGFloat(self.menuSubTitles.count+1)
                UIView.animate(withDuration: 0.3) {
                    self.frame.size.height = fullHeight
                    self.constraintHeight.constant = fullHeight
                    self.layoutIfNeeded()
                }
            }
            isActive = true
        } else {
            UIView.animate(withDuration: 0.3) {
                self.frame.size.height = self.rowHeight
                self.constraintHeight.constant = self.rowHeight
                self.layoutIfNeeded()
            }
            isActive = false
        }
        delegate?.menuStateChanged(isActive)
    }
    
    private func configurationSubButtons(_ titles: [String]) {
        for (index, title) in titles.enumerated() {
            
            let button = createButton(title)
            let originY = Int(rowHeight) * (index+1)
            let width = Int(self.frame.width)
            let height = Int(rowHeight)
            
            button.frame = CGRect(x: 12, y: originY, width: width-30, height: height)
            button.tag = index
            button.addTarget(self, action: #selector(subMenuPressed(_:)), for: .touchUpInside)
            subButtons.append(button)
            containerView.addSubview(button)
        }
    }
    
    private func oneTimeCreateUIComponents() {
        guard !viewIsCreated else { return }
        viewIsCreated = true
        
        constraintHeight = self.heightAnchor.constraint(equalToConstant: rowHeight)
        constraintHeight.isActive = true
        
        // Sub buttons
        configurationSubButtons(menuSubTitles)
    
        // SelectedLabel
        selectedLabel = createSelectedLabel()
        
        // Chevron Icon View
        chevronIconView = createChevronIconView()
        
    }
    
    private func updateSelectedItem(_ index: Int) {
        selectedLabel.text = menuSubTitles[index]
    }
}


//MARK: - Create UI

extension DropDownMenuView {
    
    private func createContainerView() -> UIView {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        
        self.addSubview(view)
        
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: self.topAnchor),
            view.rightAnchor.constraint(equalTo: self.rightAnchor),
            view.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            view.leftAnchor.constraint(equalTo: self.leftAnchor)
        ])
        return view
    }
    
    private func createSelectedLabel() -> UILabel {
        let label = UILabel()
        label.text = placeHolder
        label.font = .systemFont(ofSize: 14)
        label.textColor = selectedItemColor
        label.clipsToBounds = true
        label.textAlignment = textAlignment
        label.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(label)
        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: self.topAnchor),
            label.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 12),
            label.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -30),
            label.heightAnchor.constraint(equalToConstant: self.rowHeight)
        ])
        return label
    }
    
    private func createChevronIconView() -> UIImageView {
        let imageView = UIImageView()
        imageView.image = chevronIcon
        imageView.contentMode = .scaleAspectFill
        imageView.tintColor = selectedItemColor
        imageView.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(imageView)
        
        NSLayoutConstraint.activate([
            imageView.centerYAnchor.constraint(equalTo: self.selectedLabel.centerYAnchor),
            imageView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -12),
            imageView.widthAnchor.constraint(equalToConstant: 16),
            imageView.heightAnchor.constraint(equalToConstant: 16)
        ])
        
        return imageView
    }
    
    private func createButton(_ title: String) -> UIButton {
        
        var buttonAlignment: UIControl.ContentHorizontalAlignment {
            switch textAlignment {
            case .left: return .left
            case .center: return .center
            case .right: return .right
            default: return .center
            }
        }
        
        let button = UIButton()
        button.setTitle(title, for: .normal)
        button.setTitleColor(subMenusColor, for: .normal)
        button.setTitleColor(.gray.withAlphaComponent(0.4), for: .highlighted)
        button.contentHorizontalAlignment = buttonAlignment
        button.titleLabel?.font = .systemFont(ofSize: 14)
        
        return button
    }
    
}
