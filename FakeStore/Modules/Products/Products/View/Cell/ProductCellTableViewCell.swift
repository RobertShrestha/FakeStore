//
//  ProductCellTableViewCell.swift
//  FakeStore
//
//  Created by Robert Shrestha on 4/3/22.
//

import UIKit
import Kingfisher
class ProductCellTableViewCell: UITableViewCell, Reusable {

    @IBOutlet var productCategory: ProductRatingLabel!
    @IBOutlet var productRating: ProductRatingLabel!
    @IBOutlet var productPricingLabel: ProductPriceLabel!
    @IBOutlet var productTitleLabel: ProductTitleLabel!
    @IBOutlet var productImageView: UIImageView!
    @IBOutlet var containerView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func setupCell(withProductModel model: ProductModel) {
        self.productCategory.text = model.category?.rawValue
        self.productTitleLabel.text = model.title
        self.productPricingLabel.text = "$\(model.price ?? 0)"
        self.productRating.text = "Rating:\(model.rating?.rate ?? 0.0) (\(model.rating?.count ?? 0))"
        guard let url = URL(string: model.image ?? "") else { return }
        productImageView.kf.setImage(with: url)
    }
}
