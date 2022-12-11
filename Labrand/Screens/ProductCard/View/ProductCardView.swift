//
//  
//  ProductCardView.swift
//  Labrand
//
//  Created by Shakhzod on 10/10/22.
//
//

import UIKit
import Cosmos

class ProductCardView: UIView {
    
    //MARK: - Properties
    
    private var mainScrollView: UIScrollView!
    private var imagesScrollView: UIScrollView!
    private var sizeButton: Button!
    private var colorButton: Button!
    private var likeButton: FavouriteButton!
    private var titleLabel: UILabel!
    private var subTitleLabel: UILabel!
    private var priceLabel: UILabel!
    private var starsView: CosmosView!
    private var descriptionLabel: UILabel!
    private var bottomView: UIView!
    private var addToCartButton: BaseLoadingButton!
    private var tableView: UITableView!
    
    //MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - UI Setup
extension ProductCardView {
    private func setupUI() {
        
        createUI()
        makeHierarchy()
        
    }
    
    private func makeHierarchy() {
        
    }
    
    private func createUI() {
        
        mainScrollView = createMainScrollView()
        imagesScrollView = createImagesScrollView()
        sizeButton = createSizeButton()
        colorButton = createColorButton()
        likeButton = createLikeButton()
        titleLabel = createTitleLabel()
        subTitleLabel = createSubTitleLabel()
        priceLabel = createPriceLabel()
        starsView = createStarsView()
        descriptionLabel = createDescriptionLabel()
        bottomView = createBottomView()
        addToCartButton = createAddToCartButton()
        tableView = createTableView()
    }
}





//MARK: - UI Create

extension ProductCardView {
    
    private func createMainScrollView() -> UIScrollView {
        let scrollView = UIScrollView()
        return scrollView
    }
    
    private func createImagesScrollView() -> UIScrollView {
        let scrollView = UIScrollView()
        return scrollView
    }
    
    private func createSizeButton() -> Button {
        let button = Button()
        return button
    }
    
    private func createColorButton() -> Button {
        let button = Button()
        return button
    }
    
    private func createLikeButton() -> FavouriteButton {
        let button = FavouriteButton()
        return button
    }
    
    private func createTitleLabel() -> UILabel {
        let label = UILabel()
        return label
    }
    
    private func createSubTitleLabel() -> UILabel {
        let label = UILabel()
        return label
    }
    
    private func createPriceLabel() -> UILabel {
        let label = UILabel()
        return label
    }
    
    private func createStarsView() -> CosmosView {
        let view = CosmosView()
        return view
    }
    
    private func createDescriptionLabel() -> UILabel {
        let label = UILabel()
        return label
    }
    
    private func createBottomView() -> UIView {
        let view = UIView()
        return view
    }
    
    private func createAddToCartButton() -> BaseLoadingButton {
        let button = BaseLoadingButton()
        return button
    }
    
    private func createTableView() -> UITableView {
        let tableView = UITableView()
        return tableView
    }
}
