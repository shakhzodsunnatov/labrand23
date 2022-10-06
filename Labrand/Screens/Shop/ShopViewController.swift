//
//  
//  ShopViewController.swift
//  Labrand
//
//  Created by Shakhzod on 04/10/22.
//
//

import UIKit

class ShopViewController: BaseViewController {

    //MARK: - Properties
    var superView: ShopView?
    var interactor: ShopInteractor?
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationTraditionalTopBar()
    }
    
}

//MARK: - ShopPresenterOutput
extension ShopViewController: ShopPresenterOutput {
    
}

//MARK: - Actions
extension ShopViewController {
    override func goBack() {
        self.tabBarController?.selectedIndex = 0
    }
}

//MARK: - UITableViewDelegate
extension ShopViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        cell?.showAnimation { [weak self] in
////            let vc = self?.addChildViewController(withChildViewController: HomeConfigurator.configureModule())
//            self?.cycleFromViewController(oldViewController: TestViewController(), toViewController: HomeConfigurator.configureModule())
        }
    }
}

//MARK: - UITableViewDataSource
extension ShopViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: SaleTabeCell.description(), for: indexPath) as! SaleTabeCell
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: CategoryTableCell.description(), for: indexPath) as! CategoryTableCell
            cell.configure(index: indexPath.row)
            return cell
        }
    }
}

//MARK: - SetupUI
extension ShopViewController {
    private func setupUI() {
        self.view = superView
        self.superView?.tableView.delegate = self
        self.superView?.tableView.dataSource = self
        self.title = "Categories"
    }

//    func cycleFromViewController(oldViewController: UIViewController, toViewController newViewController: UIViewController) {
//        oldViewController.willMove(toParent: nil)
//        newViewController.view.translatesAutoresizingMaskIntoConstraints = false
//
//        self.addChild(newViewController)
//        self.addSubview(subView: newViewController.view, toView: self.view)
//
////        newViewController.view.alpha = 0
////        newViewController.view.layoutIfNeeded()
//
//        UIView.animate(withDuration: 0.5, delay: 0.1, options: .transitionFlipFromLeft, animations: {
////            newViewController.view.alpha = 1
////            oldViewController.view.alpha = 0
//        }) { (finished) in
//            oldViewController.view.removeFromSuperview()
//            oldViewController.removeFromParent()
//            newViewController.didMove(toParent: self)
//        }
//    }
//
//    private func addSubview(subView:UIView, toView parentView:UIView) {
//           self.view.layoutIfNeeded()
//           parentView.addSubview(subView)
//
//           subView.leadingAnchor.constraint(equalTo: parentView.leadingAnchor).isActive = true
//           subView.topAnchor.constraint(equalTo: parentView.topAnchor).isActive = true
//           subView.bottomAnchor.constraint(equalTo: parentView.bottomAnchor).isActive = true
//           subView.trailingAnchor.constraint(equalTo: parentView.trailingAnchor).isActive  = true
//       }
//
//    func addChildViewController(withChildViewController childViewController: UIViewController) -> UIViewController {
//        // Add Child View Controller
//        addChild(childViewController)
//        childViewController.beginAppearanceTransition(true, animated: true)
//        // Add Child View as Subview
//        view.addSubview(childViewController.view)
//        // Configure Child View
//        childViewController.view.frame = view.bounds
//        childViewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
//        // Notify Child View Controller
//        childViewController.didMove(toParent: self)
//        return childViewController
//    }
}
