//
//  BannerHeaderView.swift
//  Labrand
//
//  Created by Shakhzod on 29/09/22.
//

import UIKit

protocol BannerCheckButtonDelegate: AnyObject {
    func checkButtonPressed()
}

class BannerHeaderView: UIView {
    
    //MARK: - UIConstraints
    var imageViewHeight = NSLayoutConstraint()
    var imageViewBottom = NSLayoutConstraint()
    var containerViewHeight = NSLayoutConstraint()

    //MARK: - UI Properties
    private let containerView = UIView()
    
    private let bannerImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "banner")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.isUserInteractionEnabled = true
        
        return imageView
    }()
    private let bannerTitle: UILabel = {
        let label = UILabel()
        label.font = .boldFont(ofSize: 48)
        label.text = "Fashion sale"
        label.textColor = .white
        label.numberOfLines = 2
        
        return label
    }()
    private lazy var checkButton: Button = {
        let button = Button()
        button.titleColor = .white
        button.font = .regularFont(ofSize: 18)
        button.title = "Check"
        button.color = .appColor(.redPrimary)
        button.addTarget(self, action: #selector(pressedButton))
        
        return button
    }()
    weak var delegate: BannerCheckButtonDelegate?
    
    //MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupHierarchy()
        setupUI()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Private Setups
    private func setupHierarchy() {
        self.addSubview(containerView)
        self.containerView.addSubview(bannerImageView)
        bannerImageView.addSubview(bannerTitle)
        bannerImageView.addSubview(checkButton)
    }
    
    private func setupUI() { //TODO: - Its better if make All UI by snapKit
        //UIView Constraints
        NSLayoutConstraint.activate([
            self.widthAnchor.constraint(equalTo: containerView.widthAnchor),
            self.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            self.heightAnchor.constraint(equalTo: containerView.heightAnchor)
        ])
        
        // Container View Constraints
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
        containerView.widthAnchor.constraint(equalTo: bannerImageView.widthAnchor).isActive = true
        containerViewHeight = containerView.heightAnchor.constraint(equalTo: self.heightAnchor)
        containerViewHeight.isActive = true
        
        // ImageView Constraints
        bannerImageView.translatesAutoresizingMaskIntoConstraints = false
        imageViewBottom = bannerImageView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor)
        imageViewBottom.isActive = true
        imageViewHeight = bannerImageView.heightAnchor.constraint(equalTo: containerView.heightAnchor)
        imageViewHeight.isActive = true
        
//         Title & CheckButton
        checkButton.translatesAutoresizingMaskIntoConstraints = false
        bannerTitle.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            checkButton.widthAnchor.constraint(equalToConstant: 160),
            checkButton.heightAnchor.constraint(equalToConstant: 36.0),
            checkButton.bottomAnchor.constraint(equalTo: bannerImageView.bottomAnchor, constant: -32),
            checkButton.leftAnchor.constraint(equalTo: bannerImageView.leftAnchor, constant: 10),

            bannerTitle.heightAnchor.constraint(equalToConstant: 100),
            bannerTitle.widthAnchor.constraint(equalToConstant: SCREEN_WIDTH / 2),
            bannerTitle.leftAnchor.constraint(equalTo: bannerImageView.leftAnchor, constant: 15),
            bannerTitle.bottomAnchor.constraint(equalTo: checkButton.topAnchor, constant: -18)
        ])
    }
    
    //MARK: - Check Button Delegate
    @objc private func pressedButton() {
        delegate?.checkButtonPressed()
    }
    
    //MARK: - Public
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        containerViewHeight.constant = scrollView.contentInset.top
        let offsetY = -(scrollView.contentOffset.y + scrollView.contentInset.top)
        containerView.clipsToBounds = offsetY <= 0
        imageViewBottom.constant = offsetY >= 0 ? 0 : -offsetY / 2
        imageViewHeight.constant = max(offsetY + scrollView.contentInset.top, scrollView.contentInset.top)
    }
}
