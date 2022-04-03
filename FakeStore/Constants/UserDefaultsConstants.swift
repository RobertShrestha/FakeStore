//
//  UserDefaultsConstants.swift
//  TingTing
//
//  Created by Aximpro Innovations GmbH on 12/29/20.
//

import Foundation
@propertyWrapper
struct UserDefault<T> {
    let key: String
    var defaultValue: T

    init(_ key: String, defaultValue: T) {
        self.key = key
        self.defaultValue = defaultValue
    }

    var wrappedValue: T {
        get {
            return UserDefaults.standard.object(forKey: key) as? T ?? defaultValue
        }
        set {
            UserDefaults.standard.set(newValue, forKey: key)
        }
    }
}
struct UserDefaultsConstants {
//    @UserDefault(Constants.UserDefaults.firstTime.value, defaultValue: true)
//        static var firstTime: Bool
//    @UserDefault(Constants.UserDefaults.accessToken.value, defaultValue: nil)
//        static var accessToken: String?
    @UserDefault(Constants.UserDefaults.idToken.value, defaultValue: nil)
        static var idToken: String?
//    @UserDefault(Constants.UserDefaults.deviceTokenData.value, defaultValue: Data())
//        static var deviceTokenData: Data?
//    @UserDefault(Constants.UserDefaults.refreshToken.value, defaultValue: nil)
//        static var refreshToken: String?
//    @UserDefault(Constants.UserDefaults.isAuthorizationRequired.value, defaultValue: false)
//        static var isAuthorizationRequired: Bool?
//    @UserDefault(Constants.UserDefaults.isDeleteUserAuthorization.value, defaultValue: false)
//        static var isDeleteUserAuthorization: Bool?
//    @UserDefault(Constants.UserDefaults.isSetupComplete.value, defaultValue: false)
//        static var isSetupComplete: Bool
//    @UserDefault(Constants.UserDefaults.defaultDailingCode.value, defaultValue: "+49")
//        static var defaultDialingCode: String
//    @UserDefault(Constants.UserDefaults.countryCode.value, defaultValue: "DE")
//        static var countryCode: String
//    @UserDefault(Constants.UserDefaults.countryCallingCodes.value, defaultValue: [])
//        static var countryCallingCodes: [String]
//    @UserDefault(Constants.UserDefaults.isContactSync.value, defaultValue: false)
//        static var isContactSync: Bool
//    @UserDefault(Constants.UserDefaults.ownNumber.value, defaultValue: "")
//        static var ownNumber: String
//    @UserDefault(Constants.UserDefaults.userId.value, defaultValue: "")
//        static var userId: String
//    @UserDefault(Constants.UserDefaults.userName.value, defaultValue: "")
//        static var userName: String
//    @UserDefault(Constants.UserDefaults.deviceToken.value, defaultValue: "")
//        static var deviceToken: String
//    @UserDefault(Constants.UserDefaults.voipToken.value, defaultValue: "")
//        static var voipToken: String
//    @UserDefault(Constants.UserDefaults.tokenSent.value, defaultValue: false)
//        static var tokenSent: Bool
//    @UserDefault(Constants.UserDefaults.answerInThisDevice.value, defaultValue: false)
//        static var answerInThisDevice: Bool
//    @UserDefault(Constants.UserDefaults.isInCall.value, defaultValue: false)
//        static var isInCall: Bool
//    @UserDefault(Constants.UserDefaults.isInProgress.value, defaultValue: false)
//        static var isInProgress: Bool
//    // To handle outcoming call in didactivate call otherwise outcall will not work
//    @UserDefault(Constants.UserDefaults.isOutgoing.value, defaultValue: false)
//    static var isOutGoingCall: Bool
//    @UserDefault(Constants.UserDefaults.timeStamp.value, defaultValue: 0)
//    static var timeStamp: Int
//    // Handle contact first time load
//    @UserDefault(Constants.UserDefaults.hasContactLoaded.value, defaultValue: false)
//    static var hasContactLoaded: Bool
//    @UserDefault(Constants.UserDefaults.isInCompleteCall.value, defaultValue: false)
//    static var isInCompleteCall: Bool
//    @UserDefault(Constants.UserDefaults.callInProgress.value, defaultValue: false)
//    static var callInProgress: Bool
//    @UserDefault(Constants.UserDefaults.currentMeetingId.value, defaultValue: "")
//    static var currentMeetingId: String
//    @UserDefault(Constants.UserDefaults.isCallQualityRatingViewShowing.value, defaultValue: false)
//    static var isCallQualityFeedbackViewShowing: Bool
//    @UserDefault(Constants.UserDefaults.appRatingCancelledDate.value, defaultValue: 0.0)
//    static var appRatingCancelledDate: Double
//    @UserDefault(Constants.UserDefaults.isFirstTimeInDashboard.value, defaultValue: false)
//    static var isFirstTimeInDashboard: Bool
//    @UserDefault(Constants.UserDefaults.isAppRatingSubmitted.value, defaultValue: false)
//    static var isAppRatingSubmitted: Bool
//    @UserDefault(Constants.UserDefaults.isAppRatingCancelled.value, defaultValue: false)
//    static var isAppRatingCancelled: Bool
//    @UserDefault(Constants.UserDefaults.hasNewContactJoined.value, defaultValue: false)
//    static var hasNewContactJoined: Bool
//    @UserDefault(Constants.UserDefaults.hasNewContactAdded.value, defaultValue: false)
//    static var hasNewContactAdded: Bool
//    @UserDefault(Constants.UserDefaults.fromSetupScreen.value, defaultValue: false)
//    static var fromSetupScreen: Bool
//    @UserDefault(Constants.UserDefaults.pinpointProfileUpdated.value, defaultValue: false)
//    static var pinpointProfileUpdated: Bool
//    @UserDefault(Constants.UserDefaults.isVideoFeatureEnabled.value, defaultValue: false)
//    static var isVideoFeatureEnabled: Bool
//    @UserDefault(Constants.UserDefaults.hasUserLoggedIn.value, defaultValue: false)
//    static var hasUserLoggedIn: Bool
//    @UserDefault(Constants.UserDefaults.guestId.value, defaultValue: "")
//    static var guestId: String
//    @UserDefault(Constants.UserDefaults.isGuestIdRequired.value, defaultValue: false)
//    static var isGuestIdRequired: Bool
//    @UserDefault(Constants.UserDefaults.homeShareVisibility.value, defaultValue: false)
//    static var homeShareVisibility: Bool
//    @UserDefault(Constants.UserDefaults.previewShareVisibility.value, defaultValue: false)
//    static var previewShareVisibility: Bool
//    @UserDefault(Constants.UserDefaults.playlistShareVisibility.value, defaultValue: false)
//    static var playlistShareVisibility: Bool
}
