//  
//  ProductsView.swift
//  FakeStore
//
//  Created by Robert Shrestha on 4/3/22.
//

import UIKit
import RxSwift
import RxCocoa
class ProductsView: UIViewController, Storyboarded, ProductsViewProtocol{

    // OUTLETS HERE
    @IBOutlet var searchBar: UISearchBar!
    @IBOutlet var tableView: UITableView!

    // VARIABLES HERE
    weak var coordinator: ProductCoordinator?
    var viewModel: ProductsViewModelProtocol?
    var disposeBag = DisposeBag()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Products"
        self.setupViewModel()
        tableView.registerReusableCell(ProductCellTableViewCell.self)
        addFilterItem()
        
    }
    func addFilterItem() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Filter", style: .plain, target: self, action: #selector(filterTapped))
    }
    @objc func filterTapped() {
        let storyboard = UIStoryboard(name: "ProductsView", bundle: nil)
        guard let viewController = storyboard.instantiateViewController(withIdentifier: "ProductFilterViewController") as? ProductFilterViewController else { return }
        viewController.filters.subscribe(onNext: {
            self.viewModel?.filters.accept($0)
        }).disposed(by: disposeBag)
        self.present(viewController, animated: true, completion: nil)

    }
    fileprivate func setupViewModel() {
        guard let viewModel = viewModel else {
            return
        }

        self.searchBar
            .rx
            .text
            .orEmpty
            .changed
            .throttle(.milliseconds(300), scheduler: MainScheduler.instance)
            .bind(to: viewModel.query)
            .disposed(by: disposeBag)
        viewModel.products
            .asObservable()
            .bind(to: self.tableView
                    .rx
                    .items(cellIdentifier: String(describing: ProductCellTableViewCell.self), cellType: ProductCellTableViewCell.self)) { _, model, cell in
                cell.setupCell(withProductModel: model)
            }.disposed(by: disposeBag)
        viewModel.products
            .asObservable()
            .bind(onNext: {
                if $0.count < 1 {
                    self.tableView.setEmptySearchViewContactView(title: TableErrorMessages.NoProducts.title.rawValue,
                                                message: TableErrorMessages.NoProducts.message.rawValue)
                } else {
                    self.tableView.restore()
                }
            }).disposed(by: disposeBag)
    }
}
