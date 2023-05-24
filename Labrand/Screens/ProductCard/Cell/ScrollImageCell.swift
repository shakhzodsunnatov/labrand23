//
//  ScrollImageCell.swift
//  Labrand
//
//  Created by Shakhzod on 25/12/22.
//

import UIKit

class ScrollImageCell: TableViewCell {
    
    private var containerScrollView: UIScrollView!
    private var productImages: [UIImage]!

    //TODO: - Remove
    private lazy var mockImages = MockData.instance.productsForCard.map({ UIImage(named: $0.productImage)! })
    
    override func setupUI() {
        super.setupUI()

        containerScrollView = crateContainerScrollView()
        configureScroll(images: mockImages)
    }
}

//MARK: - Public
extension ScrollImageCell {
    
    func configureScroll(images: [UIImage]) {
        containerScrollView.contentSize = CGSize(width: SCREEN_WIDTH * Double(images.count),
                                                 height: 420)
        for (index, image) in images.enumerated() {
            let imageView = UIImageView(image: image)
            imageView.frame = CGRect(x: CGFloat(SCREEN_WIDTH) * CGFloat(index),
                                     y: 0,
                                     width: SCREEN_WIDTH,
                                     height: 420)
            containerScrollView.addSubview(imageView)
        }
        
    }
}

//MARK: - UI Create
extension ScrollImageCell {
    
    private func crateContainerScrollView() -> UIScrollView {
        let scrollView = UIScrollView()
        scrollView.isPagingEnabled = true
        self.contentView.addSubview(scrollView)
        
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.height.equalTo(420)
        }
        return scrollView
    }
}
