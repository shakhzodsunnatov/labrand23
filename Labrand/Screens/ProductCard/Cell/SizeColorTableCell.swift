//
//  SizeColorTableCell.swift
//  Labrand
//
//  Created by Shakhzod on 22/01/23.
//

import UIKit
import SnapKit

protocol SizeColorTableDelegate: AnyObject {
    func sizeSelected(_ index: Int)
    func colorSelected(_ index: Int)
    func likeButtonPressed()
}

class SizeColorTableCell: TableViewCell {

    //MARK: - PROPERTIES
    
    private var sizeDropMenu: DropDownMenuView!
    private var colorDropMenu: DropDownMenuView!
    private var likeButton: LikeButton!
    
    weak var delegate: SizeColorTableDelegate?
    
    //MARK: - SetupUI
    override func setupUI() {
        super.setupUI()
        
        sizeDropMenu = createSizeDownMenu()
        likeButton = createLikeButton()
        colorDropMenu = createColorDownMenu()
        setupTargets()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        self.frame.size.height = 74
    }
    
    private func setupTargets() {
        sizeDropMenu.selectedMenu = { [weak self] index in
            self?.delegate?.sizeSelected(index)
        }
        
        colorDropMenu.selectedMenu = { [weak self] index in
            self?.delegate?.colorSelected(index)
        }
    }
    
    //MARK: - Configuration Cell
    func configurationCell(sizes: [String], colorsName: [String]) {
        sizeDropMenu.menuSubTitles = sizes
        colorDropMenu.menuSubTitles = colorsName
    }

    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        // check if the point is inside the bounds of the drop-down menus
        if let view = sizeDropMenu.hitTest(convert(point, to: sizeDropMenu), with: event) {
            return view
        }
        if let view = colorDropMenu.hitTest(convert(point, to: colorDropMenu), with: event) {
            return view
        }
        // fallback to the default implementation if the point is not inside any drop-down menu
        return super.hitTest(point, with: event)
    }
    
}


//MARK: - Actions

extension SizeColorTableCell {
    
    @objc func likeButtonPressed() {
        
    }
    
}


//MARK: - Delegate

//extension SizeColorTableCell: DropDownMenuViewDelegate {
//
//    func selectedMenu(index: Int) {
//
//    }
//
//    func menuStateChanged(_ isActive: Bool) {
//        self.frame.size.height += 200
//
//        let sizeFrame = sizeDropMenu.frame
//        let colorFrame = colorDropMenu.frame
//        sizeDropMenu.frame.origin = convert(sizeFrame.origin, to: superview)
//        colorDropMenu.frame.origin = convert(colorFrame.origin, to: superview)
//
//        layoutIfNeeded()
//    }
//}


//MARK: - UI Create

extension SizeColorTableCell {
    
    private func createSizeDownMenu() -> DropDownMenuView {
        let menu = createDropDownMenu()
        menu.placeHolder = "Size"
        
        contentView.addSubview(menu)
        
        menu.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(12)
            make.left.equalTo(16)
            make.width.equalTo((SCREEN_WIDTH-100)/2)
        }
        
        return menu
    }
    
    private func createColorDownMenu() -> DropDownMenuView {
        let menu = createDropDownMenu()
        menu.placeHolder = "Color"
        
        contentView.addSubview(menu)
        
        menu.snp.makeConstraints { make in
            make.width.equalTo((SCREEN_WIDTH-100)/2)
            make.right.equalTo(likeButton.snp.left).offset(-16)
            make.top.equalToSuperview().inset(12)
        }
        
        return menu
    }
    
    private func createLikeButton() -> LikeButton {
        let button = LikeButton()
        button.backgroundColor = .heartBg
        
        button.addTarget(self, action: #selector(likeButtonPressed))
       
        contentView.addSubview(button)
        
        button.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(12)
            make.height.equalTo(36)
            make.right.equalTo(-16)
        }
        
        return button
    }
    
    private func createDropDownMenu() -> DropDownMenuView {
        
        let menuView = DropDownMenuView(menuSubTitles: [])
        menuView.placeHolder = "Pls Select Color"
        menuView.radius = 8
        menuView.borderColor = UIColor.gray.cgColor
        menuView.borderWidth = 1.0
        menuView.rowHeight = 50
        menuView.selectedItemColor = .black0
        menuView.textAlignment = .left
        menuView.subMenusColor = .black0
        
        return menuView
    }
    
}

