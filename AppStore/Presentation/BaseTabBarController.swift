//
//  BaseTabBarController.swift
//  AppStore
//
//  Created by Yevhenii Korsun on 02.10.2022.
//

import Foundation
import UIKit

enum TabBarItem: CaseIterable {
    case today
    case apps
    case search
    
    var title: String {
        switch self {
        case .today: return "Today"
        case .apps: return "Apps"
        case .search: return "Search"
        }
    }
    
    var iconName: String {
        switch self {
        case .today: return "today_icon"
        case .apps: return "apps"
        case .search: return "search"
        }
    }
    
    var controller: UIViewController {
        switch self {
        case .today: return UIViewController()
        case .apps: return AppsViewController()
        case .search: return AppsSearchController(vm: ResultListViewModel(networkService: NetworkService()))
        }
    }
}

class BaseTabBarController: UITabBarController {
    
    // MARK: - Properties
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    // MARK: - Selectors
    
    // MARK: - API
    
    // MARK: - Helper Functions
    
    private func configureUI() {
        viewControllers = makeViewControllers()
        tabBar.backgroundColor = .lightGray.withAlphaComponent(0.2)
        tabBar.tintColor = .blue
        tabBar.unselectedItemTintColor = .lightGray
    }
    
    private func makeViewControllers() -> [UIViewController] {
        var controllers = [UIViewController]()
        
        TabBarItem.allCases.forEach { item in
            let controller = item.controller
            let navigationController = UINavigationController(rootViewController: controller)
            controller.navigationItem.title = item.title
            navigationController.tabBarItem.title = item.title
            navigationController.tabBarItem.image = UIImage(named: item.iconName)
            navigationController.navigationBar.prefersLargeTitles = true
            controllers.append(navigationController)
        }
        
       return controllers
    }
}

