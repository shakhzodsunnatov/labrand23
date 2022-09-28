//
//  HomeConfigurator.swift
//  Labrand
//
//  Created by Shakhzod on 27/09/22.
//

import UIKit

class HomeConfigurator {
    
    static func configureModel() -> HomeViewController {
        
        // ViewController
        let viewController = HomeViewController()
        let view = HomeView()
        let routing = HomeRouter()
        let interactor = HomeInteractor(networkService: ApiService.shared)
        let presenter = HomePresenter()
        
        // HomeView TableView Cells
        let banner = BannerSectionHandler()
        
        // Home TableView register Cells
        let sectionHandler = [banner]
        let sectionContainer = SectionContainer(handlers: sectionHandler)
        viewController.sectionContainer = sectionContainer
        view.registerCellToTableView(sectionContainer: sectionContainer)
        
        // Configure
        viewController.superView = view
        viewController.interactor = interactor
        interactor.routing = routing
        interactor.presenter = presenter
        presenter.viewController = viewController
        routing.viewController = viewController
        
        return viewController
    }
}
