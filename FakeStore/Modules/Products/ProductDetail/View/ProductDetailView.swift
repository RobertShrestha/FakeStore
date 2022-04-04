//  
//  ProductDetailView.swift
//  FakeStore
//
//  Created by Robert Shrestha on 4/4/22.
//

import UIKit
import RxSwift
import RxCocoa
import Kingfisher
class ProductDetailView: UIViewController, Storyboarded{

    // OUTLETS HERE
    @IBOutlet var productTitleLabel: ProductTitleLabel!
    @IBOutlet var productImageView: UIImageView!

    @IBOutlet var bookmarkButton: OutlineButton!
    @IBOutlet var productRatingLabel: ProductRatingLabel!
    @IBOutlet var productDescriptionLabel: ProductRatingLabel!
    @IBOutlet var productCategoryLabel: ProductPriceLabel!
    @IBOutlet var productPriceLabel: ProductPriceLabel!
    // VARIABLES HERE
    var viewModel: ProductDetailViewModelProtocol?
    weak var coordinator: ProductCoordinator?
    var model: ProductModel?
    var disposeBag = DisposeBag()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupViewModel()
        binding()
    }
    func binding() {
        guard let viewModel = viewModel else {
            return
        }

        self.bookmarkButton
            .rx
            .tap
            .bind(to: viewModel.bookMarkedButtonTapped)
            .disposed(by: disposeBag)
        viewModel.isBookmarked.subscribe(onNext: {
            if $0 {
                self.bookmarkButton.titleLabel?.text = "Remove from bookmark"
            } else {
                self.bookmarkButton.titleLabel?.text = "Add to bookmark"
            }
        }).disposed(by: disposeBag)
        viewModel.productDetail.subscribe(onNext: { [weak self] model in
            guard let model = model, let self = self else {
                return
            }
            self.productTitleLabel.text = model.title
            self.productRatingLabel.text = "Rating: \(model.rating?.rate ?? 0.0) (\(model.rating?.count ?? 0))"
            self.productDescriptionLabel.text = model.productDescription
            self.productCategoryLabel.text = model.category?.rawValue
            self.productPriceLabel.text = "$\(model.price ?? 0.0)"
            guard let url = URL(string: model.image ?? "") else { return }
            self.productImageView.kf.setImage(with: url)

        }).disposed(by: disposeBag)

    }
    fileprivate func setupViewModel() {
        guard let model = model else {
            return
        }
        productTitleLabel.text = model.title
        productRatingLabel.text = "Rating: \(model.rating?.rate ?? 0.0) (\(model.rating?.count ?? 0))"
        productDescriptionLabel.text = model.productDescription
        productCategoryLabel.text = model.category?.rawValue
        productPriceLabel.text = "$\(model.price ?? 0.0)"
        guard let url = URL(string: model.image ?? "") else { return }
        productImageView.kf.setImage(with: url)
    }
}
extension ProductDetailView: ProductDetailViewProtocol {
}
