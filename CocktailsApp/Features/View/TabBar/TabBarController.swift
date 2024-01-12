//
//  TabBarViewController.swift
//  CocktailsApp
//
//  Created by Gorkem Saka on 1/10/24.
//

import UIKit
class TabBarController: UITabBarController {
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    //MARK: - Functions
    private func configure(){
        setupTabs()
        self.tabBar.tintColor = .black
        self.tabBar.backgroundColor = .white
    }
    private func setupTabs(){
        let homeView = self.createNav(title: "Home", image: UIImage(systemName: "house"), vc: HomeViewController())
        let searchView = self.createNav(title: "Search", image: UIImage(systemName: "magnifyingglass"), vc: SearchViewController())
        
        self.setViewControllers([homeView,searchView], animated: true)
    }
}
//MARK: - Create new Navigation for ViewController
extension TabBarController {
    private func createNav(title: String, image: UIImage?, vc: UIViewController) -> UINavigationController {
        let nav = UINavigationController(rootViewController: vc)
        nav.tabBarItem.title = title
        nav.tabBarItem.image = image
//        nav.viewControllers.first?.navigationItem.title = title + "Page"
//        nav.viewControllers.first?.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "TestButton", style: .plain, target: nil, action: nil)
        return nav
    }
}
