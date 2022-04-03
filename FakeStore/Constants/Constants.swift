//
//  Constants.swift
//  TingTing
//
//  Created by Aximpro Innovations GmbH on 12/29/20.
//

import Foundation
import Kingfisher
// swiftlint:disable line_length file_length


// Validation Error enum
enum ValidationRegistrationSetupError {
    case username
    case password
}


struct Constants {
    enum UserDefaults: String {
        case firstTime
        case accessToken
        case deviceTokenData
        case idToken
        case refreshToken
        case isAuthorizationRequired
        case isDeleteUserAuthorization
        case isSetupComplete
        case defaultDailingCode
        case countryCode
        case countryCallingCodes
        case isContactSync
        case ownNumber
        case userName
        case userId
        case deviceToken
        case voipToken
        case tokenSent
        case answerInThisDevice
        case isInCall
        case isInProgress
        case isOutgoing
        case timeStamp
        case hasContactLoaded
        case isInCompleteCall
        case currentMeetingId
        case callInProgress
        case isCallQualityRatingViewShowing
        case appRatingCancelledDate
        case isFirstTimeInDashboard
        case isAppRatingSubmitted
        case isAppRatingCancelled
        case hasNewContactJoined
        case hasNewContactAdded
        case fromSetupScreen
        case pinpointProfileUpdated
        case isVideoFeatureEnabled
        case hasUserLoggedIn
        case guestId
        case isGuestIdRequired
        case homeShareVisibility
        case previewShareVisibility
        case playlistShareVisibility
        var value: String {
            return self.rawValue
        }
    }
    enum StartViewLabels: String {
        case hotAndFresh = "Hot & Fresh"
        case moods = "Moods"
        case occasions = "Occasions"
        case songsForYou = "Songs for you"
        case popular = "Popular"
        case chooseAContact = "Choose a Contact"
        var localize: String {
            self.rawValue.localized()
        }
    }
    enum RegistrationLabelText: String {
        case phoneNumber = "Enter your phone number."
        case getStarted = "Get Started"
        case creatingAccount = "By creating an account you agree to our"
        case andLabel = "and"
        case termsOfServices = "Terms of Service"
        case privacyPolicy = "Privacy Policy."
        case enterMobileNumber = "Enter your mobile number"
        var localize: String {
            self.rawValue.localized()
        }
    }
    enum MobileVerificationLabelText: String {
        case verify = "Verify"
        case putInVerificationCode = "Put in your verification code."
        case weSendYouCode = "We send a code to"
        case didNotRecieveCode = "Didn't receive a code?"
        case resendCodeButton = "RESEND CODE NOW"
        case resendCodeSuccess = "Your verification code has been successfully resent."
        var localize: String {
            self.rawValue.localized()
        }
    }
    enum ChimeRealTimeDataMessageTopic: String {
        case video = "isMinimized"
        var value: String {
            self.rawValue
        }
    }
    enum SettingMenuLabelText: String {
        case editProfile = "Edit Profile"
        case account = "Account"
        case help = "Help"
        case giveFeedback = "Give Feedback"
        case inviteYourFriends = "Invite Your Friends"
        case thankyou = "Thank you for using the TingTing \n version"
        case feelFree = "Feel free to \nsend us your feedback & suggestions."
        case updateProfile = "Update your profile information."
        case dataProtection = "Data Protection"
        case security = "Security"
        case deleteAccount = "Delete Account"
        case support = "Support"
        case contact = "Contact"
        case tandC = "Terms and Conditions"
        case dataPrivacy = "Data Privacy"
        case privacyPolicy = "Privacy Policy"
        case successfullyUpdated = "User profile updated successfully."
        case reallyWantDelete = "Do you really want to delete your TingTing account?"
        case yesDelete = "Yes, delete"
        var localize: String {
            self.rawValue.localized()
        }
    }
    enum TabItemTitle: String {
        case start = "Start"
        case contacts = "Contacts"
        case history = "History"
        case favorites = "Favorites"
        case settings = "Settings"
        var localize: String {
            self.rawValue.localized()
        }
    }
    enum SongDetailView: String {
        case chooseContact = "CHOOSE A CONTACT"
        case shareSnippet = "SHARE SNIPPET"
        var localize: String {
            self.rawValue.localized()
        }
    }
    enum RegistrationSetup: String {
        case setup = "Setup"
        case helpUs = "Help us deliver \n the best experience."
        case placeholderFullName =  "Full Name"
        case placeholderDateOfBirth = "Date of Birth"
        case placeholderGender = "Gender"
        var localize: String {
            self.rawValue.localized()
        }
    }
    enum StartView: String {
        case searchFor = "Search for songs or artists…"
        case addToFavorites = "added to favorites."
        case removeFromFavorites = "removed from favorites."
        case noTrack = "No tracks available"
        var localize: String {
            self.rawValue.localized()
        }
    }
    enum SearchView: String {
        case backToStart = "BACK TO START"
        var localize: String {
            self.rawValue.localized()
        }
    }
    enum ContactsListing: String {
        case contacts = "Contacts"
        case chooseASong = "Choose a Song"
        case songSelect = "SONG SELECT"
        case invite = "Invite Friends"
        case successfullyInvite = "Successfully invited."
        var localize: String {
            self.rawValue.localized()
        }
    }
    enum HistoryView: String {
        case incoming = "Incoming"
        case outgoing = "Outgoing"
        case all = "All"
        case theContactisNot = "The contact is not in your contact list."
        var localize: String {
            self.rawValue.localized()
        }
    }
    enum CallScreenView: String {
        case callEnded = "Call ended."
        case callDeclined = "Call declined."
        case callNotReachable = "Not Reachable"
        case userBusy = "User Busy."
        var localize: String {
            self.rawValue.localized()
        }
    }
    enum ContactStartCall: String {
        case startCall = "Start Call"
        case btnStartCall = "START CALL"
        case tingtingAudio = "TINGTING AUDIO"
        case tingtingVideo = "TINGTING VIDEO"
        case btnStartVideoCall = "START VIDEO CALL"
        var localize: String {
            self.rawValue.localized()
        }
    }
    enum DashboardTabTitles: String {
        case contacts = "Contacts"
        case start = "Start"
        case history = "History"
        case favorites = "Favorites"
        case setting = "Settings"
        var localize: String {
            self.rawValue.localized()
        }
    }
    static let labelOk = "OK".localized()
    static let noInternetConnection = "No network connection. Please connect to the internet.".localized()
    static let parsingError = "Something went wrong when parsing the data.".localized()
    static let cancel = "Cancel".localized()
    static let labelSkip = "Skip for now"
    static let back = "Back"
    static let edit = "Edit"
    static let create = "CREATE"
    static let createLabel = "Create"
    static let saveLabel = "SAVE".localized()
    static let saveChanges = "SAVE CHANGES"
    static let contactInvited = "Contact Invited".localized()
    static let invite = "Invite".localized()
    static let invited = "Invited".localized()
    static let reinvited = "Re-Invite".localized()
    static let inviting = "Inviting..".localized()
    static let continueLabel = "CONTINUE".localized()
    static let savecontinue = "Save and Continue"
    static let getStarted = "GET STARTED".localized()
    static let next = "NEXT".localized()
    static let searchFor = "Search for...".localized()
    static let newToTingTing = "#NewtoTingTing".localized()
    static let deleteMesasge = "Are you sure you want to delete ?"
    static let noTracksFound = "This playlist has no tracks.".localized()
    static let somethingWentWrong = "Something went wrong. Please try again.".localized()
    static let invalidInput = "Invalid input. Please check again.".localized()
    static let restoringInternet = "Restoring internet connection.".localized()
    static let couldnotPlaySong = "Sorry, we can’t play the track you selected. Please use a different track.".localized()
    static let play = "PLAY".localized()
    static let pause = "PAUSE".localized()
    static let smsMessage = "Hey, I’m using TingTing now. With it we can call each other with our favorite songs from now on. You can download it here for free:".localized()
    static let appLinksInSMS = " Android : https://a.tingting.app iOS: https://i.tingting.app"
    static let smsMessageInGerman = "Hey, ich nutze jetzt TingTing. Damit können wir uns ab sofort mit unseren Lieblingsliedern anrufen. Hier kannst du sie kostenlos downloaden: Android : https://a.tingting.app iOS: https://i.tingting.app".localized()
    static let authenticationSessionExpire = "Authentication session expired. Try again.".localized()
    static let noVideoAvailable = "No video available.".localized()
    static let cameraIsOff = "'s camera is off".localized()
    static let isText = "Is".localized()
    static let correctNumber = "a correct mobile phone number?".localized()
    static let sendSMS = "We will send SMS to this number.".localized()
    static let sorryMessageForInvite = "Sorry, TingTing is not yet available in this country. Please try another time.".localized()
    static let inviteContactToTingTing = "Invite Contacts to TingTing".localized()
    static let callRatingText = "How do you rate the quality of call?".localized()
    static let thankYouText = "Thank you for the feedback.".localized()
    static let enjoyTingTing = "Enjoying TingTing".localized()
    static let tapAStar = "Tap a star to rate TingTing".localized()
    static let cancelLabel = "Cancel".localized()
    static let submitLabel = "Submit".localized()
    static let inviteFriends = "Invite Friends".localized()
    static let noMicPermissionNotification = "Allow access to your microphone to accept this call.".localized()
    static let noVideoPermissionNotification = "Allow access to your camera to accept this call.".localized()
    static let tingtingTrending = "TingTing Trending".localized()
    static let addContactHistoryMessage = "This number is not in your list of contacts. Would you like to add it?".localized()
    static let oopsText = "Oops!".localized()
    static let inviteLabel = "Invite".localized()
    static let contactLabel = "Contact".localized()
    static let contactsLabel = "Contacts".localized()
    static let selectAllLabel = "Select All".localized()
    static let deSelectAllLabel = "Deselect All".localized()
    static let cannotProceedCamera = "Cannot proceed forward until you give permission to the camera".localized()
    static let cannotProceedMic = "Cannot proceed forward until you give permission to the microphone".localized()
    static let settingMicPermission = "Please allow TingTing to access your microphone for audio and video calls. These can be configured in Settings.".localized()
    static let settingVideoPermission = "Please allow TingTing to access your camera for video calls. These can be configured in Settings.".localized()
    static let shareSong = "SHARE SNIPPET".localized()
    static let orLabel = "Or".localized()
    static let didNotFindSomeone = "Didn’t find someone you looking for ?".localized()
    static let registerToTingTing = "Experience the magic of TingTing and share with your friends and families. Get access to all features & save your moments for forever.".localized()
    static let registerLabel = "Register".localized()
    static let register = "REGISTER NOW".localized()
    static let registerNow = "Register now to Start TingTing".localized()
    static let pleaseRegister = "Please Register".localized()
    static let addToFavorites = "ADD TO FAVORITES".localized()
    static let removeFromFavorites = "REMOVE FROM FAVORITES".localized()
    static let trackNotFound = "There was some problem fetching track details. Please try again later.".localized()
    static let playlistNotFound = "There was some problem fetching playlist details. Please try again later.".localized()
    static let contactInvitedSuccessfully = "Contacts invited successfully.".localized()
    static let tingtingLabelForShare = "TingTing - SoundChat of your life".localized()
    // camera constants
    static let takePhoto = "Take photo"
    static let cameraRoll = "Camera roll"
    static let photoLibrary = "Photo library"
//    static let introScreenArray = [
//        IntroScreenModel(
//            message: "Instantly amplify emotions \n using the power of music.".localized(),
//            title: "Express yourself".localized(),
//            imageView: #imageLiteral(resourceName: "OnboardingPersonIcon")),
//        IntroScreenModel(message: "Call friends and family with the song \n that perfectly fits this moment.".localized(),
//                         title: "Create memorable moments".localized(),
//                         imageView: #imageLiteral(resourceName: "OnboardingMomentIcon")),
//        IntroScreenModel(
//            message: "Voice your opinion and help us with your \n feedback to make TingTing better.".localized(),
//            title: "Step to the mic".localized(),
//            imageView: #imageLiteral(resourceName: "OnboardingMicIcon")),
//        IntroScreenModel(
//            message: "Invite your friends so you can share \n the TingTing experience.".localized(),
//            title: "Share the magic".localized(),
//            imageView: #imageLiteral(resourceName: "OnboardingLoveIcon"))
//    ]

    // MARK: - Pagination
    static let perPage = 20
}

struct TableErrorMessages {
    enum NoProducts: String {
        case title = "No Products Found"
        case message = "Please try again later"
        var value: String {
            return self.rawValue.localized()
        }
    }
}
