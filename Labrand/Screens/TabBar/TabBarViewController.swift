//
//  TabBarViewController.swift
//  laBrand
//
//  Created by Shakhzod

import UIKit

class TabBarViewController: UITabBarController {
    
    // MARK: - Properties
    fileprivate var previousController: UIViewController?
    var interactor: TabBarInteractable?
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        delegate = self
        setupControllers()
//        notificationSetup()
    }
//
//    deinit {
//        NotificationManager.shared.removeObservers(self)
//    }
//
    // MARK: - Private
    private func setupControllers() {
        let homeCtr = getControllerAt(type: .home)
        let shopCtr = getControllerAt(type: .shop)
        let bagCtr = getControllerAt(type: .bag)
        let favoritesCtr = getControllerAt(type: .favorites)
        let profileCtr = getControllerAt(type: .profile)
        
        setViewControllers([homeCtr, shopCtr, bagCtr, favoritesCtr, profileCtr], animated: false)
        
        tabBar.layer.masksToBounds = true
        tabBar.isTranslucent = true
        tabBar.barTintColor = .appColor(.redPrimary)
        tabBar.barStyle = .default
        tabBar.layer.cornerRadius = 12
        tabBar.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        tabBar.tintColor = .appColor(.redPrimary)
        
        UITabBar.appearance().shadowImage = UIImage()
        UITabBar.appearance().backgroundImage = UIImage()
        self.tabBar.clipsToBounds = false
        tabBar.layer.shadowOffset = CGSize(width: 0, height: 0)
        tabBar.layer.shadowRadius = 20
        tabBar.layer.shadowColor = UIColor.black.cgColor
        tabBar.layer.shadowOpacity = 0.2
        tabBar.backgroundColor = .appColor(.viewBackground)
        
        APP_DELEGATE.tabBarController = self
    }
    
    private func getControllerAt(type: TabBarItemType) -> UIViewController {
        switch type {
        case .home:
            let home = HomeConfigurator.configureModule()
            let homeNC = BaseNavigationController(rootViewController: home)
            homeNC.tabBarItem = getTabBarItem(type: .home, title: "Home", "home_inactive", "home_activated")
            
            return homeNC
            
        case .shop:
            let home = ShopConfigurator.configureModule()
            let homeNC = BaseNavigationController(rootViewController: home)
            homeNC.tabBarItem = getTabBarItem(type: .home, title: "Shop", "shop_inactive", "shop_activated")
            
            return homeNC
            
        case .bag:
            let home = CatalogConfigurator.configureModule()
            let homeNC = BaseNavigationController(rootViewController: home)
            homeNC.tabBarItem = getTabBarItem(type: .home, title: "Bag", "bag_inactive", "bag_activated")
            
            return homeNC
            
        case .favorites:
            let home = HomeConfigurator.configureModule()
            let homeNC = BaseNavigationController(rootViewController: home)
            homeNC.tabBarItem = getTabBarItem(type: .home, title: "Favorites", "heart_inactive", "heart_activated")
            
            return homeNC
            
        case .profile:
            let home = HomeConfigurator.configureModule()
            let homeNC = BaseNavigationController(rootViewController: home)
            homeNC.tabBarItem = getTabBarItem(type: .home, title: "Profile", "profile_inactive", "profile_activated")
            
            return homeNC
            
        case .unknown:
            return UIViewController()
        }
    }
    
    private func getTabBarItem(type: TabBarItemType, title: String, _ imageName: String, _ selectedImageName: String) -> TabBarItem {
        let customTab = TabBarItem(title: title, image: UIImage(named: imageName)?.withRenderingMode(.alwaysOriginal), selectedImage: UIImage(named: selectedImageName)?.withRenderingMode(.alwaysOriginal))
        customTab.tabItemType = type
        customTab.setTitleTextAttributes([NSAttributedString.Key.font: UIFont.regularFont(ofSize: 10)], for: .normal)
        
        return customTab
    }
    
    @objc private func languageDidChange() {
        if let customTabBar = tabBarItem as? TabBarItem {
            switch customTabBar.tabItemType {
            case .home:
                customTabBar.title = "Home"//.locolize
            case .shop:
                customTabBar.title = "Shop"
            case .bag:
                customTabBar.title = "Bag"
            case .favorites:
                customTabBar.title = "Favorites"
            case .profile:
                customTabBar.title = "Profile"
            default: break
            }
        }
    }
    
//    private func notificationSetup() {
//        NotificationManager.shared.addObserver(self, selector: #selector(addedActiveOrder), forName: .updateActiveOrder)
//        NotificationManager.shared.addObserver(self, selector: #selector(logout), forName: .logout)
//        NotificationCenter.default.addObserver(self, selector: #selector(languageDidChange), name: NSNotification.Name(rawValue: LCLLanguageChangeNotification), object: nil)
//    }
    
//    @objc private func addedActiveOrder() {
//        selectedIndex = TabBarItemType.orders.rawValue
//        if let active = viewControllers?[selectedIndex] {
//            checkOrderViewController(active)
//        }
//    }
    
//    @objc private func logout() {
//        DatabaseManager.shared.deleteAllObjects()
//        UserDefaults.standard.removeObject(forKey: hasOrder)
//        UserDefaults.standard.removeObject(forKey: GroupBasketId)
//        UserDefaults.standard.removeObject(forKey: GroupBasketGuestId)
//        UserDefaults.standard.removeObject(forKey: GroupBasketForGuest)
//        UserDefaults.standard.removeObject(forKey: "NewOrderDidSave")
//        UserDefaults.standard.removeObject(forKey: "OrderIdSaved")
//        UserDefaults.standard.removeObject(forKey: "IsEnabledCashBack")
//
//        selectedIndex = TabBarItemType.home.rawValue
//        tabBar.setBadge(value: nil, at: TabBarItemType.orders.rawValue)
//
//        if let topController = UIApplication.getTopViewController(),
//           let ctrl = topController as? HomeViewController {
//            //            ctrl.reloadCollectionIndexPathsForVisibleItems()
//        }
//    }
}

// MARK: - TabBarPresenterOutput
extension TabBarViewController: TabBarPresenterOutput {
    
}

// MARK: - UITabBarControllerDelegate
extension TabBarViewController: UITabBarControllerDelegate {
//    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
//
//        if let customTabBar = tabBarController.tabBar.selectedItem as? TabBarItem,
//           customTabBar.tabItemType == .orders || customTabBar.tabItemType == .profile {
//            if DatabaseManager.isTokenAvailable() {
//                if let vc = UIApplication.getTopViewController(), !vc.isKind(of: OrdersViewController.self) {
//                    NotificationManager.shared.post(name: .updateOrderHistory)
//                }
//                return true
//
//            } else {
//                let login = SignInRouter.createModule(tabBar: self)
//                let nc = UINavigationController(rootViewController: login)
//                nc.modalPresentationStyle = .fullScreen
//
//                tabBarController.present(nc, animated: false, completion: { [weak self] in
//                    tabBarController.selectedIndex = customTabBar.tabItemType.rawValue
//                })
//
//                return false
//            }
//        } else {
//            return true
//        }
//    }
//
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {

        if let customTabBar = tabBarController.tabBar.selectedItem as? TabBarItem {
            if previousController == viewController {
                if tabBarController.selectedIndex == TabBarItemType.home.rawValue {
                    if viewController is UINavigationController {
                        let navigationController: UINavigationController = viewController as! UINavigationController

                        if let rootViewController = navigationController.viewControllers.first, let vc = rootViewController as? HomeViewController {
                            vc.superView?.tableView.setContentOffset(CGPoint.zero, animated: true)
                        }
                    }
                }
            } else {
                // Not same tabBar
            }

//            switch customTabBar.tabItemType {
//            case .search:
//                AnalyticsManager.firebaseLog(.click_search_button)
//            case .orders:
//                checkOrderViewController(viewController)
//            default: break
//            }

            previousController = viewController
        }
    }
    
//    fileprivate func checkOrderViewController(_ viewController: UIViewController) {
//        if viewController is UINavigationController {
//            let navigationController: UINavigationController = viewController as! UINavigationController
//
//            if let rootViewController = navigationController.viewControllers.first, rootViewController is OrdersViewController {
//                if let vc = rootViewController as? OrdersViewController {
//                    vc.selectFirstController()
//                }
//            }
//        }
//    }
}
