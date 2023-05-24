//
//  
//  ProductCardViewController.swift
//  Labrand
//
//  Created by Shakhzod on 10/10/22.
//
//

import UIKit

class ProductCardViewController: BaseViewController {

    //MARK: - Properties
    var superView: ProductCardView?
    var interactor: ProductCardInteractable?
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
 
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let navTitle = interactor?.getModel().title
        self.rootNavigation?.setTitleText(navTitle ?? "***")
        self.addRightButton(
            image: UIImage(systemName: "square.and.arrow.up")!,
            selector: #selector(shareButtonPressed)
        )
        self.addBackButton()
        self.rootNavigation?.makeNavigationBarRegular()
        self.rootNavigation?.addShadowToNavigation()
    }
    
}


//MARK: - Private
extension ProductCardViewController {
    
    @objc
    private func shareButtonPressed() {
//        interactor.shareButtonPressed()
    }
}


//MARK: - ProductCardPresenterOutput
extension ProductCardViewController: ProductCardPresenterOutput {
    
}

//MARK: - UITableViewDelegate
extension ProductCardViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

//MARK: -
extension ProductCardViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return interactor?.getTableCells().count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let productCell = interactor?.getTableCellTypeBy(indexPath: indexPath) //TODO: - do All staff inside interactor
        let cellType = productCell?.tableCellType ?? UITableViewCell.self
        let cell = tableView.dequeueCell(cellType, indexPath: indexPath)

        switch productCell {
            
        case .scrollImage:
            
            print("scrollView")
            
        case .sizeColor:
            
            let sizeName = Array(0...5).map({ "\($0) Size" })
            let colorName = Array(0...3).map({ "\($0) Color" })
            
            (cell as? SizeColorTableCell)?.configurationCell(sizes: sizeName, colorsName: colorName)
            
        case .none:
            let cell = UITableViewCell()
            cell.backgroundColor = .red
            
        }
        return cell
    }
    
    
}

//MARK: - SetupUI
extension ProductCardViewController {
    private func setupUI() {
        self.view = superView
        superView?.tableView.delegate = self
        superView?.tableView.dataSource = self
    }
}
