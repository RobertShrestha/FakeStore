//
//  ProductDetailViewModelTest.swift
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

class ProductDetailViewModelTest: XCTestCase {
    var disposeBag: DisposeBag!
    var viewModel: ProductDetailViewModel!
    var client: MockProductDetailService!
    var storageClient: StorageClient!
    var scheduler: ConcurrentDispatchQueueScheduler!
    var testScheduler: TestScheduler!
    var productModel: ProductModel!

    override func setUp() {
        super.setUp()
        disposeBag = DisposeBag()
        let storage = MockStorage(products: [])
        storageClient = StorageClient(storage: storage)
        client = MockProductDetailService(client: WebServices.shared,storageClient: storageClient)
        let rating = Rating(rate: 100.0, count: 100)
        let productModel = ProductModel(id: 1,
                                        title: "Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops",
                                        price: 109.95,
                                        productDescription: "Your perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday",
                                        category: .menSClothing,
                                        image: "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg",
                                        rating: rating)
        self.productModel = productModel
        viewModel = ProductDetailViewModel(withProductDetail: client, productModel: productModel)
        scheduler = ConcurrentDispatchQueueScheduler(qos: .default)
        testScheduler = TestScheduler(initialClock: 0)
    }
    override func tearDown() {
        disposeBag = nil
        viewModel = nil
        scheduler = nil
        testScheduler = nil
        client.removeProduct(model: productModel)
        super.tearDown()
    }

    func testProductDetailService_WhenInformationProvidedisValid_AllProductAreFetched() {
        let id = 1
        guard let url = URLBuilder()
                .setPath(paths: .products)
                .setIdPath(id: "\(id)")
                .build() else { return }
        var resource = Resource<ProductModel>(url: url)
        resource.httpMethod = .get
        let response = self.client.getProductDetail(resource: resource)
        _  = response.subscribe(onSuccess: { model in
            XCTAssertEqual(model.id, 1)
        }, onFailure: { error in
            print(error)
        })
    }
    func testProductDetailService_WhenProductisBookedMarked_ProductIsSaved() {
        self.client.addProduct(model: self.productModel)
        let isBookmarked = self.client.getProductBookmark(model: productModel)
        XCTAssertTrue(isBookmarked)
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
