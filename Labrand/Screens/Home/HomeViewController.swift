//
//  HomeViewController.swift
//  Labrand
//
//  Created by Shakhzod on 27/09/22.
//

import UIKit

class HomeViewController: BaseViewController {

    //MARK: - Properties
    var superView: HomeView?
    var interactor: HomeInteractable?
    
    var sectionContainer: SectionContainer!
    var sectionHandlers: [SectionHandler] { sectionContainer.sectionHandlers }
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        rootNavigation?.hideNavigationBar()
    }
}

//MARK: - HomePresenterOutput
extension HomeViewController: HomePresenterOutput {
    
}

//MARK: - Banner Check Button
extension HomeViewController: BannerCheckButtonDelegate {
    func checkButtonPressed() {
        
    }
}

//MARK: - UITableViewDelegate
extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}

//MARK: - UITableViewDataSource
extension HomeViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sectionHandlers.count
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return sectionHandlers[indexPath.row].cellHeight
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return sectionContainer.tableView(tableView, cellForRowAt: indexPath)
    }
}

//MARK: -
extension HomeViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        superView?.headerBannerView.scrollViewDidScroll(scrollView)
    }
}

//MARK: - SetupUI
extension HomeViewController {
    private func setupUI() {
        self.view = superView
        superView?.tableView.delegate = self
        superView?.tableView.dataSource = self
        superView?.headerBannerView.delegate = self
    }
}
