//
//  AppDelegate.swift
//  FoodApp-ios
//
//  Created by Paul Kahohi on 1/8/18.
//  Copyright © 2018 Paul Kahohi. Andela.
//

import UIKit
import GoogleSignIn
import Firebase


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, GIDSignInDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.

        // Use Firebase library to configure APIs
        FirebaseApp.configure()

        //Intialize the sign in
        guard let FirApp = FirebaseApp.app() else { return false }

        GIDSignIn.sharedInstance().clientID = FirApp.options.clientID
        return true
    }

    func application(_ app: UIApplication,
                     open url: URL,
                     options: [UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool {

        return GIDSignIn.sharedInstance().handle(url,
                                                 sourceApplication: options[UIApplicationOpenURLOptionsKey.sourceApplication] as? String,
                                                 annotation: options[UIApplicationOpenURLOptionsKey.annotation])
    }

    func sign(_ signIn: GIDSignIn!,
              didSignInFor user: GIDGoogleUser!,
              withError error: Error!) {

        if error == nil {

            let userId = user.userID
            let idToken = user.authentication.idToken
            let fullName = user.profile.name
            let givenName = user.profile.givenName
            let familyName = user.profile.familyName
            let email = user.profile.email

        } else {

            print ("\(error.localizedDescription)")
        }
    }

    func sign(_ signIn: GIDSignIn!,
              didDisconnectWith user: GIDGoogleUser!,
              withError error: Error!) {
        // Any code to be perfomed  when the user disconnects from the app
    }

}

