//
//  SceneDelegate.swift
//  EthSampleApp
//
//  Created by Hamza Khan on 07/02/2020.
//  Copyright © 2020 Hamza Khan. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    private var navController : BaseNavigationViewController = BaseNavigationViewController()
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let windowScene = (scene as? UIWindowScene) else { return }
        self.window = UIWindow(windowScene: windowScene)
        self.createRoute()
    }
    private func createRoute() {
        let vc : SetupViewController =  SetupBuilder.build()
        vc.viewModel = SetupViewModel(Controllers.setup.getNavigationBarTitle())
        self.navController.viewControllers = [vc]
        self.window?.rootViewController = navController
        self.window?.makeKeyAndVisible()
    }
}

