//
//  MockLoginViewService.swift
//  FakeStoreTests
//
//  Created by Robert Shrestha on 4/4/22.
//
import Foundation
import RxTest
import RxSwift
import RxCocoa
import RxBlocking
@testable import FakeStore
class MockLoginService: LoginServiceProtocol {
    var client: WebServices

    init(client: WebServices) {
        self.client = client
    }
    let response = [
        "token": "123123123"
    ] as [String : Any]
    func doLogin<T: Codable>(resource: Resource<T>) -> Single<T> {
        return Single.create(subscribe: { emitter in

            do {
                let credential = try JSONDecoder().decode(RequestLoginModel.self, from: resource.body!)
                if !credential.username.isEmpty && !credential.password.isEmpty {
                    let value = try JSONDecoder().decode(T.self, withJSONObject: self.response)
                    print(value)
                    emitter(.success(value))
                } else {
                    emitter(.failure(APIErrors.apiError(message: "Something went wrong")))
                }

            }catch(let error) {
                emitter(.failure(APIErrors.seralizationError(error: error.localizedDescription as! Error)))
            }
            return Disposables.create()
        })

    }


}
