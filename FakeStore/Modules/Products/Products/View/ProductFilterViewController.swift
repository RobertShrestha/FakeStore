//
//  ProductFilterViewController.swift
//  FakeStore
//
//  Created by Robert Shrestha on 4/3/22.
//

import UIKit
import RxSwift
import RxCocoa
class ProductFilterViewController: UIViewController {
    @IBOutlet weak var cancelButton: NormalButton!
    @IBOutlet weak var saveButton: NormalButton!

    @IBOutlet var ratingLabel: ProductPriceLabel!
    @IBOutlet var rating: UIStepper!
    @IBOutlet var categoryTextField: InputTextField!
    @IBOutlet var maxPriceTextField: InputTextField!
    @IBOutlet var minPriceTextField: InputTextField!
    var disposeBag = DisposeBag()
    let categoryPicker = UIPickerView()
    var categories = BehaviorRelay<[String]>(value: [])
    var filters = PublishSubject<ProductFilters>()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.maxPriceTextField.delegate = self
        self.minPriceTextField.delegate = self 
        // Do any additional setup after loading the view.
        setupBinding()
        self.categoryTextField.inputView = categoryPicker
        categories.accept(Category.allCases.map({$0.rawValue}))
    }
    func setupBinding() {
        self.categories
            .bind(to: categoryPicker.rx.itemTitles) { (_, element) in
                return element
            }.disposed(by: disposeBag)
        self.categoryPicker
            .rx
            .modelSelected(String.self)
            .observe(on: MainScheduler.instance)
            .map {$0[0]}
            .subscribe(onNext: {
                self.categoryTextField.text = $0
            })
            .disposed(by: disposeBag)
        self.cancelButton
            .rx
            .tap
            .subscribe( onNext: {
                var filter = ProductFilters()
                filter.maxValue = 0.0
                filter.minValue = 0.0
                filter.category = .none
                filter.rating = 0.0
                self.filters.onNext(filter)
                self.dismiss(animated: true, completion: nil)
            }).disposed(by: disposeBag)
        self.saveButton
            .rx
            .tap
            .subscribe( onNext: { [self] in
                var minValue = 0.0
                var maxValue = 0.0
                if let minString = minPriceTextField.text, let minInt = Double(minString) {
                    minValue = minInt
                }
                if let maxString = maxPriceTextField.text, let maxInt = Double(maxString) {
                    maxValue = maxInt
                }
                if checkValidationOfPrice(minValue: minValue, maxValue: maxValue) {
                    print("valid")
                    var filter = ProductFilters()
                    filter.maxValue = maxValue
                    filter.minValue = minValue
                    filter.category = Category(rawValue: self.categoryTextField.text ?? "none") ?? .none
                    filter.rating = self.rating.value
                    self.filters.onNext(filter)
                    self.dismiss(animated: true, completion: nil)
                } else {
                    self.alert(message: "The minimum price should be less than the maxmium price and vice versa")
                }
                print(checkValidationOfPrice(minValue: minValue, maxValue: maxValue))
            }).disposed(by: disposeBag)
        self.rating
            .rx
            .value
            .asObservable()
            .subscribe(onNext: { rating in
                self.ratingLabel.text = "\(rating)"
            }).disposed(by: disposeBag)
    }

    func checkValidationOfPrice(minValue: Double, maxValue: Double) -> Bool {
        if minValue > maxValue {
            return false
        }
        return true
    }


    /*
     // MARK: - Navigation

     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */

}
extension ProductFilterViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == minPriceTextField || textField == maxPriceTextField {
            guard CharacterSet(charactersIn: "0123456789").isSuperset(of: CharacterSet(charactersIn: string)) else {
                return false
            }
            return true
        } else {
            return true
        }
    }
}
