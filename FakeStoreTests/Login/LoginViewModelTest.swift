//
//  LoginViewModelTest.swift
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
class LoginViewModelTest: XCTestCase {

    var disposeBag: DisposeBag!
    var viewModel: LoginViewModel!
    var client: MockLoginService!
    var scheduler: ConcurrentDispatchQueueScheduler!
    var testScheduler: TestScheduler!

    override func setUp() {
        super.setUp()
        disposeBag = DisposeBag()
        client = MockLoginService(client: WebServices.shared)
        viewModel = LoginViewModel(withLogin: client)
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
    /// Check if the isvalid is true if all the fields are correct
    func testLoginViewModel_WhenInformationProvidedisInvalid_IsValidShouldBeFalse() {
        let isValid = viewModel.isValid.subscribe(on: scheduler)
        viewModel.username.accept("")
        viewModel.password.accept("")
        XCTAssertEqual(try isValid.toBlocking().first(), false)
    }
    func testLoginViewModel_WhenInformationProvidedisValid_IsValidShouldBeTrue() {
        let isValid = viewModel.isValid.subscribe(on: scheduler)
        viewModel.username.accept("ro")
        viewModel.password.accept("ro")
        XCTAssertEqual(try isValid.toBlocking().first(), true)
    }
    func testLoginService_WhenInformationProvidedisValid_LoginIsSuccess() {

        viewModel.username.accept("ro")
        viewModel.password.accept("ro")
        guard let url = URLBuilder()
                .setPath(paths: .login)
                .build() else { return }
        let request = RequestLoginModel(username: self.viewModel.username.value, password: self.viewModel.password.value)

        var resource = Resource<LoginModel>(url: url)
        resource.body =  request.toData()
        resource.httpMethod = .post
        let response = self.client.doLogin(resource: resource)
        _  = response.subscribe(onSuccess: { model in
            guard let token = model.token else {
                XCTFail("The token cannot be empty")
                return
            }
            XCTAssertTrue(!token.isEmpty)
        }, onFailure: { error in
            print(error)
        })
    }

    func testLoginService_WhenInformationProvidedisInValid_LoginIsFailure() {

        viewModel.username.accept("")
        viewModel.password.accept("")
        guard let url = URLBuilder()
                .setPath(paths: .login)
                .build() else { return }
        let request = RequestLoginModel(username: self.viewModel.username.value, password: self.viewModel.password.value)

        var resource = Resource<LoginModel>(url: url)
        resource.body =  request.toData()
        resource.httpMethod = .post
        let response = self.client.doLogin(resource: resource)
        _  = response.subscribe(onSuccess: { model in
            XCTFail("This should not be here")
        }, onFailure: { error in
            print(error)
            let error = error as? APIErrors
            switch error {
            case .seralizationError:
                XCTFail("This should not be here")
            case .apiError(let message):
                XCTAssertEqual(message, "Something went wrong")
            case .domainError(_):
                XCTFail("This should not be here")
            case .none:
                XCTFail("This should not be here")
            }
        })
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
