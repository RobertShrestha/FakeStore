//  
//  ProfileServiceProtocol.swift
//  FakeStore
//
//  Created by Robert Shrestha on 4/3/22.
//

import Foundation

protocol ProfileServiceProtocol {

    /// SAMPLE FUNCTION -* Please rename this function to your real function
    ///
    /// - Parameters:
    ///   - success: -- success closure response, add your Model on this closure.
    ///                 example: success(_ data: YourModelName) -> ()
    ///   - failure: -- failure closure response, add your Model on this closure.  
    ///                 example: success(_ data: APIError) -> ()
    func removeThisFuncName(success: @escaping(_ data: ProfileModel) -> Void,
                            failure: @escaping() -> Void)

}
