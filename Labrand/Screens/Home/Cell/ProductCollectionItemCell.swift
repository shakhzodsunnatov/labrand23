////
////  ProductCollectionItemCell.swift
////  Labrand
////
////  Created by Shakhzod on 03/10/22.
////
//
//import UIKit
//import SnapKit
//import Cosmos
//
//class ProductCollectionView: View {
//
//    required init?(coder: NSCoder) {
//        super.init(coder: coder)
//    }
//
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        setup()
//    }
//
//    var product: ProductObject! {
//        didSet {
//            guard let product = product else { return }
//
//            markerLabel.text = "-20%"
//            imageView.image = UIImage(named: "product_img")
//            favouriteButton.isFavourite = product.isFavourite
//            brandLabel.text = product.branName
//            nameLabel.text = product.title
//
//
//            rateView.rating = product.rateCount
//
//            let attributedString = NSMutableAttributedString.init(string: "Text on label")
//
//            if product.isHaveSale {
//
//                attributedString.addAttributes([NSAttributedString.Key.strikethroughStyle: NSUnderlineStyle.thick.rawValue], range: NSRange.init(location: 0, length: attributedString.length))
//                priceLabel.attributedText = attributedString
//
//                priceLabel.text = String(product.price ?? 0) + "$"
//                salePriceLabel.text = String(product.salePrice ?? 0) + "$"
//                salePriceLabel.isHidden = false
//
//            } else {
//                priceLabel.attributedText = nil
//                priceLabel.text = String(product.price ?? 0) + "$"
//                salePriceLabel.isHidden = true
//            }
//
//            relayout()
//        }
//    }
//
//    var containerStack: UIStackView = {
//        let stack = UIStackView()
//        stack.alignment = .leading
//        stack.axis = .vertical
//        stack.distribution = .fill
//        stack.spacing = 6
//        stack.translatesAutoresizingMaskIntoConstraints = false
//        return stack
//    }()
//
//    lazy var imageView: UIImageView = {
//        let imageView = UIImageView()
//        imageView.contentMode = .scaleToFill
//        imageView.clipsToBounds = true
//        imageView.layer.cornerRadius = 8
//        return imageView
//    }()
//
//    var markerLabel: PaddingLabel = {
//        let label = PaddingLabel()
//        label.textColor = .white
//        label.font = .semiBoldFont(ofSize: 11)
//
//        return label
//    }()
//
//
//    lazy var favouriteButton: FavouriteButton = {
//        let button = FavouriteButton()
//
//        button.actionClosure = {
//            self.product.isFavourite.toggle()
//        }
//
//        return button
//    }()
//
//    lazy var rateView: CosmosView = {
//       let view = CosmosView()
//        view.settings.totalStars = 5
//        view.settings.starSize = 13
//        view.settings.starMargin = 3
//        view.settings.fillMode = .half
//
//        view.isUserInteractionEnabled = false
//
//        view.settings.filledImage = UIImage(systemName: "start.fill")?.withRenderingMode(.alwaysOriginal)
//        view.settings.emptyImage  = UIImage(systemName: "start")?.withRenderingMode(.alwaysOriginal)
//
//        view.rating = 0
//        view.text = "(10)"
//        view.settings.textColor = .gray
//
//
//        return view
//    }()
//
//    var brandLabel: UILabel = {
//        let label = UILabel()
//        label.font = .lightFont(ofSize: 11)
//        label.textColor = .gray
//        label.sizeToFit()
//        return label
//    }()
//
//    var nameLabel: UILabel = {
//        let label = UILabel()
//        label.font = UIFont.semiBoldFont(ofSize: 16)
//        label.sizeToFit()
//        label.numberOfLines = 2
//        return label
//    }()
//
//    lazy var priceStack: UIStackView = {
//        let stack = UIStackView(arrangedSubviews: [priceLabel, salePriceLabel])
//        stack.axis = .horizontal
//        stack.distribution = .fill
//        stack.spacing = 5
//        stack.translatesAutoresizingMaskIntoConstraints = false
//        return stack
//    }()
//
//    var priceLabel: UILabel = {
//        let label = UILabel()
//        label.font = .mediumFont(ofSize: 14)
//
//        return label
//    }()
//
//    var salePriceLabel: UILabel = {
//        let label = UILabel()
//        label.font = .mediumFont(ofSize: 14)
//        label.textColor = .red
//        return label
//    }()
//
//    private func setup() {
//        addSubview(containerStack)
//
//        containerStack.addArrangedSubviews(
//            imageView,
//            rateView,
//            brandLabel,
//            nameLabel,
//            priceStack
//        )
//
//        containerStack.addSubview(favouriteButton)
//
//        imageView.addSubview(markerLabel)
//    }
//
//
//    override func layoutSubviews() {
//        super.layoutSubviews()
//
//        if product != nil {
//
//            containerStack.snp.makeConstraints { make in
//                make.edges.equalToSuperview()
//            }
//
//            imageView.snp.makeConstraints { make in
//                make.width.equalToSuperview()
//            }
//
//            markerLabel.snp.makeConstraints { make in
//                make.top.equalToSuperview().inset(8)
//                make.left.equalToSuperview().inset(9)
//            }
//
//            favouriteButton.snp.makeConstraints { make in
//                make.size.equalTo(36)
//                make.right.equalToSuperview()
//                make.bottom.equalTo(imageView.snp.bottom).offset(18)
//            }
//
//        }
//
//    }
//
//}
