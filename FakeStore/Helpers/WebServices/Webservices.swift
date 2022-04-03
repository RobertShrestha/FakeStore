//
//  Webservices.swift
//  Ally-Energy-Audit
//
//  Created by Robert Shrestha on 3/4/20.
//  Copyright © 2020 esrtech. All rights reserved.
//
import Foundation
import UIKit
import RxAlamofire
import RxSwift
import Network
public enum APIErrors: Error {
    case seralizationError(error: Error)
    case apiError(message: String)
    case domainError(error: Error)
}
public struct HTTPMethod: RawRepresentable, Equatable, Hashable {
    /// `CONNECT` method.
    public static let connect = HTTPMethod(rawValue: "CONNECT")
    /// `DELETE` method.
    public static let delete = HTTPMethod(rawValue: "DELETE")
    /// `GET` method.
    public static let get = HTTPMethod(rawValue: "GET")
    /// `HEAD` method.
    public static let head = HTTPMethod(rawValue: "HEAD")
    /// `OPTIONS` method.
    public static let options = HTTPMethod(rawValue: "OPTIONS")
    /// `PATCH` method.
    public static let patch = HTTPMethod(rawValue: "PATCH")
    /// `POST` method.
    public static let post = HTTPMethod(rawValue: "POST")
    /// `PUT` method.
    public static let put = HTTPMethod(rawValue: "PUT")
    /// `TRACE` method.
    public static let trace = HTTPMethod(rawValue: "TRACE")
    public let rawValue: String
    public init(rawValue: String) {
        self.rawValue = rawValue
    }
}
struct Resource<T: Codable> {
    let url: URL
    var httpMethod: HTTPMethod = .get
    var body: Data?
}
extension Resource {
    init(url: URL) {
        self.url = url
    }
}
class WebServices {
    var disposeBag = DisposeBag()
    let decoder = JSONDecoder()
    static let shared = WebServices()
    // swiftlint:disable function_body_length
    func load<T>(resource: Resource<T>, withToken token: Bool) -> Single<T> {
        var request = URLRequest(url: resource.url)
        request.httpMethod = resource.httpMethod.rawValue
        request.httpBody = resource.body
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        if let body = request.httpBody {
            do {
                let jsonRequest = try JSONSerialization.jsonObject(with: body, options: [])
                let formattedMsg = """
                > \(request)
                The post parameters are
                📡 \(jsonRequest)
                """
                log.debug("Json:", context: formattedMsg)
            } catch let error {
                log.error(error)
            }
        }
        return Single.create(subscribe: { emitter in
            RxAlamofire.requestData(request)
                //.debug()
                .observe(on: MainScheduler.instance)
                .subscribe(onNext: { (response, data) in
                    do {
                        let datas = try self.decoder.decode(T.self, from: data)
                        let json = try JSONSerialization.jsonObject(with: data, options: [])
                        if let body = request.httpBody {
                            let jsonRequest = try JSONSerialization.jsonObject(with: body, options: [])
                            let formattedMsg = """
                            > \(request)
                            The post parameters are
                            📡 \(jsonRequest)
                            """
                            log.debug("Json:", context: formattedMsg)
                        }
                        let formattedMsg = """
                        > \(request)
                        📡 \(json)
                        """
                        log.debug("Json:", context: formattedMsg)
                        emitter(.success(datas))
                    } catch let error {
                        emitter(.failure(APIErrors.seralizationError(error: error)))
                        log.warning( """
                            Cannot serialize JSON
                            > \(request)
                            📡 \(error)
                            """)
                    }
                }, onError: { (error) in
                    log.error("Error: \(request)", context: error)
                    emitter(.failure(APIErrors.seralizationError(error: error)))
                }).disposed(by: self.disposeBag)
            return Disposables.create()
        })
    }
}
