//
//  LibsManager.swift
//  Ally-Energy-Audit
//
//  Created by Robert Shrestha on 3/2/20.
//  Copyright © 2020 esrtech. All rights reserved.
//

import Foundation
import UIKit
import IQKeyboardManagerSwift
import SwiftyBeaver
import UserNotifications
class LibsManager: NSObject, UNUserNotificationCenterDelegate {

//    static let shared = LibsManager()

    var window: UIWindow?
    var application: UIApplication?

    init(window: UIWindow? = nil, application: UIApplication? = nil ) {
        self.window = window
        self.application = application
    }
    func setupLibs() {
        self.setupKeyboardManager()
        self.setupLogger()
       // self.setUpNavigation()
        //self.setupGoogleMaps()
       // self.registerForNotification()
    }
    private func setupKeyboardManager() {
        IQKeyboardManager.shared.enable = true
    }
    /*
    private func setupGoogleMaps() {
        let apiKey = Environment.googleAPIKey
        GMSServices.provideAPIKey(apiKey)
        GMSPlacesClient.provideAPIKey(apiKey)
    }
    */

    private func registerForNotification() {
        //setup push notification
        // Register for remote notifications. This shows a permission dialog on first run, to
        // show the dialog at a more appropriate time move this registration accordingly.
        // [START register_for_notifications]
        if #available(iOS 10.0, *) {
            // For iOS 10 display notification (sent via APNS)
            UNUserNotificationCenter.current().delegate = self

            let authOptions: UNAuthorizationOptions = [.alert, .badge, .sound]
            UNUserNotificationCenter.current().requestAuthorization(
                options: authOptions,
                completionHandler: { status, error in
                    print(status, error as Any)
            })
        } else {
            let settings: UIUserNotificationSettings =
                UIUserNotificationSettings(types: [.alert, .badge, .sound], categories: nil)
            application?.registerUserNotificationSettings(settings)
        }

        application?.registerForRemoteNotifications()
    }

    /*
    private func setUpNavigation() {
         // swiftlint:disable line_length
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white, NSAttributedString.Key.font: FontConstants.setOpensansFont(withFont: .semiBold, withSize: .medium)]
        UINavigationBar.appearance().barTintColor = ColorConstants.primaryBlue
        UINavigationBar.appearance().tintColor = .white
        UINavigationBar.appearance().isTranslucent = false
        // swiftlint:disable line_length
        //UIBarButtonItem.appearance(whenContainedInInstancesOf: [UINavigationBar.self]).setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.clear], for: .normal)
        UINavigationBar.appearance().frame = CGRect(x: 0, y: 0, width: self.window?.frame.size.width ?? 10, height: 80.0)
    }
    */

    private func setupLogger() {
        // add log destinations. at least one is needed!
        let console = ConsoleDestination()  // log to Xcode Console

        console.levelString.verbose = "🐷 VERBOSE"
        console.levelString.debug = "🛠️ DEBUG"
        console.levelString.info = "ℹ️ INFO"
        console.levelString.warning = "⚠️ WARNING"
        console.levelString.error = "💥 ERROR"

        // swiftlint:disable line_length
        //let file = FileDestination()  // log to default swiftybeaver.log file
        //let cloud = SBPlatformDestination(appID: "r7xOv6", appSecret: "b6un6lnoy9qoxXPC2bawksiKXtcj6cvo", encryptionKey: "h8cmrbHBbvinln8pktgshlz1xsy41kdp") // to cloud
        // use custom format and set console output to short time, log level & message
       // console.format = "$DHH:mm:ss$d $L $M"

        console.format = "$L: $M $X Function:$F line:$l"
        // or use this for JSON output: console.format = "$J"

        // add the destinations to SwiftyBeaver
        log.addDestination(console)
        //log.addDestination(file)
        #if DEBUG
            // log.addDestination(cloud)
        #endif

//        // Now let’s log!
//        log.verbose("not so important")  // prio 1, VERBOSE in silver
//        log.debug("something to debug")  // prio 2, DEBUG in green
//        log.info("a nice information")   // prio 3, INFO in blue
//        log.warning("oh no, that won’t be good")  // prio 4, WARNING in yellow
//        log.error("ouch, an error did occur!")  // prio 5, ERROR in red
//
//        // log anything!
//        log.verbose(123)
//        log.info(-123.45678)
//        log.warning(Date())
//        log.error(["I", "like", "logs!"])
//        log.error(["name": "Mr Beaver", "address": "7 Beaver Lodge"])
//
//        // optionally add context to a log message
//
//        log.debug("age", "123")  // "DEBUG: age 123"
//        log.info("my data", context: [1, "a", 2]) // "INFO: my data [1, \"a\", 2]"

    }

}
