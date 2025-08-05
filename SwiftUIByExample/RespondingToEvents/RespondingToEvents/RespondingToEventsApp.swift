//
//  RespondingToEventsApp.swift
//  RespondingToEvents
//
//  Created by Virgi Septian on 04/08/25.
//

import SwiftUI

@main
struct RespondingToEventsApp: App {
    
    /// SwiftUI apps launch using a custom struct that conforms to the App protocol, but sometimes you might want to get back the old UIApplicationDelegate functionality we used to have – perhaps to handle registration for push notifications, to respond to memory warnings, to detect time changes, and so on.
//    class AppDelegate: NSObject, UIApplicationDelegate {
//        func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
//            print("Your code here")
//            return true
//        }
//    }
//    
//    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    /// run code when the app launches
    init() {
        UserDefaults.standard.register(defaults: [
            "name": "Taylor Swift",
            "highScore": 10
        ])
    }
    
   
    
    var body: some Scene {
        WindowGroup {
//            DetectWhenYourAppMoves()
//            RespondToViewLifecycleEvents()
//            AddKeyboardShortcuts()
//            RunCodeWhenTheAppLaunches()
//            DetectDeviceRotation()
//            AddAToolbarToTheKeyboard()
//            RunAnAsynchronousTask()
//            LetTheUserPasteData()
//            LetUsersShareContent()
//            LetUsersFindAndReplaceText()
            SupportDragAndDrop()
        }
    }
}
