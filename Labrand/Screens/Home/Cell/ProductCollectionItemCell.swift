//
//  ProductCollectionItemCell.swift
//  Labrand
//
//  Created by Shakhzod on 03/10/22.
//

import UIKit
import SnapKit
import Cosmos

class ProductCollectionItemCell: UICollectionViewCell {
    
    //MARK: - Model
    
    var product: ProductModel = ProductModel()
    
    //MARK: - Properties UI
    
    var containerStack: UIStackView!
    var imageView: UIImageView!
    var markerLabel: UILabel!
    var favouriteButton: LikeButton!
    var rateView: CosmosView!
    var brandLabel: UILabel!
    var nameLabel: UILabel!
    var priceStack: UIStackView!
    var priceLabel: UILabel!
    var salePriceLabel: UILabel!
    
    //MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Public
    func configureBy(model: ProductModel) {
    
        product = model
        markerLabel.text = "-20%"
        imageView.image = UIImage(named: "product_img")
        favouriteButton.isSelected = product.isFavourite
        brandLabel.text = product.branName
        nameLabel.text = product.title
        rateView.rating = product.rateCount
        productIsHasSale(isSale: product.isHaveSale)
    }
    
}

//MARK: - Actions
extension ProductCollectionItemCell {
    @objc private func favouriteButtonPressed(sender: UIButton) {
        sender.isSelected = !sender.isSelected
    }
}

//MARK: - Private

extension ProductCollectionItemCell {
    
    private func setup() {
        self.setupInitialization()
        self.setupHierarchy()
        self.setupUI()
    }
    
    private func setupHierarchy() {
        contentView.addSubview(containerStack)
        containerStack.addArrangedSubviews(
            imageView,
            rateView,
            brandLabel,
            nameLabel,
            priceLabel
        )
        containerStack.addSubview(favouriteButton)
        imageView.addSubview(markerLabel)
    }
    
    private func setupInitialization() {
        
        self.containerStack = containerStackCreate()
        self.imageView = imageViewCreate()
        self.markerLabel = markerLabelCreate()
        self.favouriteButton = favouriteButtonCreate()
        self.rateView = rateViewCreate()
        self.brandLabel = brandLabelCreate()
        self.nameLabel = nameLabelCreate()
        self.priceLabel = priceLabelCreate()
        self.salePriceLabel = salePriceLabelCreate()
        self.priceStack = priceStackCreate()
        
    }
    
    private func setupUI() {
        imageView.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.height.equalTo(184)
        }

        markerLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(8)
            make.left.equalToSuperview().inset(9)
        }
        favouriteButton.snp.makeConstraints { make in
            make.size.equalTo(36)
            make.right.equalToSuperview()
            make.bottom.equalTo(imageView.snp.bottom).offset(18)
        }
    }
    
    private func productIsHasSale(isSale: Bool) {
        if false {
            let attributedString = NSMutableAttributedString.init(string: "Text on label")
            attributedString.addAttributes([NSAttributedString.Key.strikethroughStyle: NSUnderlineStyle.thick.rawValue], range: NSRange.init(location: 0, length: attributedString.length))
            priceLabel.attributedText = attributedString
            priceLabel.text = String(product.price ?? 0) + "$"
            salePriceLabel.text = String(product.salePrice ?? 0) + "$"
            salePriceLabel.isHidden = false
        } else {
            priceLabel.attributedText = nil
            priceLabel.text = String(product.price ?? 0) + "$"
            salePriceLabel.isHidden = true
        }
    }
}

//MARK: - UI
extension ProductCollectionItemCell {
    
    private func containerStackCreate() -> UIStackView {
        let stack = UIStackView()
        stack.alignment = .leading
        stack.axis = .vertical
        stack.distribution = .fill
        stack.spacing = 6
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        return stack
    }
    
    private func imageViewCreate() -> UIImageView {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 8
        
        return imageView
    }
    
    private func markerLabelCreate() -> PaddingLabel {
        let label = PaddingLabel()
        label.textColor = .white
        label.font = .semiBoldFont(ofSize: 11)

        return label
    }
    
    private func favouriteButtonCreate() -> LikeButton {
        let button = LikeButton()
        button.addTarget(self, action: #selector(favouriteButtonPressed))
        
        return button
    }
    
    private func rateViewCreate() -> CosmosView {
        let view = CosmosView()
         view.settings.totalStars = 5
         view.settings.starSize = 13
         view.settings.starMargin = 3
         view.settings.fillMode = .half

         view.isUserInteractionEnabled = false

         view.settings.filledImage = UIImage(systemName: "start.fill")?.withRenderingMode(.alwaysOriginal)
         view.settings.emptyImage  = UIImage(systemName: "start")?.withRenderingMode(.alwaysOriginal)

         view.rating = 0
         view.text = "(10)"
         view.settings.textColor = .gray

         return view
    }
    
    private func brandLabelCreate() -> UILabel {
        let label = UILabel()
        label.font = .lightFont(ofSize: 11)
        label.textColor = .gray
        label.sizeToFit()
        return label
    }
    
    private func nameLabelCreate() -> UILabel {
        let label = UILabel()
        label.font = UIFont.semiBoldFont(ofSize: 16)
        label.sizeToFit()
        label.numberOfLines = 2
        return label
    }
    
    private func priceStackCreate() -> UIStackView {
        let stack = UIStackView(arrangedSubviews: [priceLabel, salePriceLabel])
        stack.axis = .horizontal
        stack.distribution = .fill
        stack.spacing = 5
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }
    
    private func priceLabelCreate() -> UILabel {
        let label = UILabel()
        label.font = .mediumFont(ofSize: 14)

        return label
    }
    
    private func salePriceLabelCreate() -> UILabel {
        let label = UILabel()
        label.font = .mediumFont(ofSize: 14)
        label.textColor = .red
        return label
    }
}

