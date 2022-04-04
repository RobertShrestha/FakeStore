//  
//  BookmarkView.swift
//  FakeStore
//
//  Created by Robert Shrestha on 4/4/22.
//

import UIKit
import RxSwift
import RxCocoa
class BookmarkView: UIViewController, Storyboarded {

    // OUTLETS HERE
    @IBOutlet var tableView: UITableView!
    
    // VARIABLES HERE
    var viewModel: BookmarkViewModelProtocol?
    weak var coordinator: BookmarkCoordinator?
    var disposeBag = DisposeBag()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupViewModel()
        tableView.registerReusableCell(ProductCellTableViewCell.self)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.viewModel?.serviceCall()
        self.title = "Bookmarks"
    }
    fileprivate func setupViewModel() {
        guard let viewModel = viewModel else {
            return
        }
        viewModel.bookmarkedProduct
            .asObservable()
            .bind(to: self.tableView
                    .rx
                    .items(cellIdentifier: String(describing: ProductCellTableViewCell.self), cellType: ProductCellTableViewCell.self)) { _, model, cell in
                cell.setupCell(withProductModel: model)
            }.disposed(by: disposeBag)
        viewModel.bookmarkedProduct
            .asObservable()
            .bind(onNext: {
                if $0.count < 1 {
                    self.tableView.setEmptySearchViewContactView(title: TableErrorMessages.NoProducts.title.rawValue,
                                                                 message: TableErrorMessages.NoProducts.message.rawValue)
                } else {
                    self.tableView.restore()
                }
            }).disposed(by: disposeBag)
        self.tableView
            .rx
            .itemSelected
            .asObservable()
            .subscribe(onNext: { indexPath in
                guard let productModel = self.viewModel?.bookmarkedProduct.value[safe: indexPath.row] else { return }
                self.coordinator?.goToProductDetail(productModel: productModel)
            })
            .disposed(by: disposeBag)
    }
}
extension BookmarkView: BookmarkViewProtocol {
}
