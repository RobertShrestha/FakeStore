//
//  ProductViewModelTest.swift
//  FakeStoreTests
//
//  Created by Robert Shrestha on 4/4/22.
//
import XCTest
import RxTest
import RxBlocking
import RxSwift
import RxCocoa
@testable import FakeStore
class ProductViewModelTest: XCTestCase {
    var disposeBag: DisposeBag!
    var viewModel: ProductsViewModel!
    var client: MockProductsService!
    var scheduler: ConcurrentDispatchQueueScheduler!
    var testScheduler: TestScheduler!

    override func setUp() {
        super.setUp()
        disposeBag = DisposeBag()
        client = MockProductsService(client: WebServices.shared)
        viewModel = ProductsViewModel(withProducts: client)
        scheduler = ConcurrentDispatchQueueScheduler(qos: .default)
        testScheduler = TestScheduler(initialClock: 0)
    }
    override func tearDown() {
        disposeBag = nil
        viewModel = nil
        scheduler = nil
        testScheduler = nil
        super.tearDown()
    }

    func getAllProduct() -> [ProductModel] {
        let response =
"""
[
  {
    "id": 1,
    "title": "Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops",
    "price": 109.95,
    "description": "Your perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday",
    "category": "men's clothing",
    "image": "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg",
    "rating": {
      "rate": 3.9,
      "count": 120
    }
  },
  {
    "id": 20,
    "title": "DANVOUY Womens T Shirt Casual Cotton Short",
    "price": 12.99,
    "description": "95%Cotton,5%Spandex, Features: Casual, Short Sleeve, Letter Print,V-Neck,Fashion Tees, The fabric is soft and has some stretch., Occasion: Casual/Office/Beach/School/Home/Street. Season: Spring,Summer,Autumn,Winter.",
    "category": "women's clothing",
    "image": "https://fakestoreapi.com/img/61pHAEJ4NML._AC_UX679_.jpg",
    "rating": {
      "rate": 3.6,
      "count": 145
    }
  }
]
"""
        do {
        let jsonData = response.data(using: .utf8)
        guard let data = jsonData else { fatalError() }

        let value = try JSONDecoder().decode([ProductModel].self, from: data)
            return value
        } catch let error {
            print(error)
        }
        return []
    }

    func testProductService_WhenInformationProvidedisValid_AllProductAreFetched() {
        guard let url = URLBuilder()
                .setPath(paths: .products)
                .build() else { return }
        var resource = Resource<[ProductModel]>(url: url)
        resource.httpMethod = .get
        let response = self.client.getAllProducts(resource: resource)
        _  = response.subscribe(onSuccess: { model in
            XCTAssertEqual(model.count, 20)
        }, onFailure: { error in
            print(error)
        })
    }


    func testProductViewModel_WhenFilterIsSetToMensClothingInCategory_ReturnsOneProduct() {
        viewModel.originalProducts = getAllProduct()
        viewModel.products.accept(getAllProduct())
        viewModel.filters.accept(ProductFilters(minValue: 0.0, maxValue: 0.0, category: .menSClothing, rating: 0.0))
        XCTAssertEqual(viewModel.products.value.count, 1)
    }
    func testProductViewModel_WhenRatingIsSetToGreaterThanThree_ReturnsTwoProduct() {
        viewModel.originalProducts = getAllProduct()
        viewModel.products.accept(getAllProduct())
        viewModel.filters.accept(ProductFilters(minValue: 0.0, maxValue: 0.0, category: .none, rating: 3.0))
        XCTAssertEqual(viewModel.products.value.count, 2)
    }
    func testProductViewModel_WhenRightQueryIsSearch_ReturnsFilteredProduct() {
        viewModel.originalProducts = getAllProduct()
        viewModel.products.accept(getAllProduct())
        viewModel.query.accept("Fjallraven")
        XCTAssertEqual(viewModel.products.value.count, 1)
    }

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
