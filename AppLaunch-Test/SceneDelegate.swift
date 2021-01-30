//
//  SceneDelegate.swift
//  AppLaunch-Test
//
//  Created by Vijay's Mac on 30/01/21.
//  Copyright © 2021 Vijay's Mac. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    let tabbarController = TabBarViewController()

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene)
            else { return }
        let window = UIWindow(windowScene: windowScene)
        setUpTabbarController()
        window.rootViewController = tabbarController
        self.window = window
        self.window?.makeKeyAndVisible()
       
    }

    //MARK:- set up all the viewControllers of TabBar
    private func setUpTabbarController(){
        
        let homepageController = HomePageViewController()
        let homePageWithNavBarController = UINavigationController(rootViewController: homepageController)
        homePageWithNavBarController.title = "Home"
        homePageWithNavBarController.tabBarItem.image = UIImage(systemName: "house")
        
        let searchViewController = UIViewController()
        let searchNavBarController = UINavigationController(rootViewController: searchViewController)
        searchNavBarController.title = "Search"
        searchNavBarController.tabBarItem.image = UIImage(systemName: "magnifyingglass")
        
        let musicViewController = UIViewController()
        let musicNavBarController = UINavigationController(rootViewController: musicViewController)
        musicNavBarController.title = "My Music"
        musicNavBarController.tabBarItem.image = UIImage(systemName: "music.note.list")
        
        
        let alexaViewController = UIViewController()
        let alexaNavBarController = UINavigationController(rootViewController: alexaViewController)
        alexaNavBarController.title = "Alexa"
        alexaNavBarController.tabBarItem.image = UIImage(systemName: "mic.circle")
        
        tabbarController.viewControllers = [homePageWithNavBarController,searchNavBarController,musicNavBarController,alexaNavBarController]
        
        
    }

}

