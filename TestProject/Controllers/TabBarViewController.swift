//
//  TabBarViewController.swift
//  TestProject
//
//  Created by Aleksandr Svetilov on 05.11.2020.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        delegate = self
        
        let detailsViewController = DetailsViewController()
        let detailsItem = UITabBarItem(title: "Details", image: nil, selectedImage: nil)
        detailsViewController.tabBarItem = detailsItem
        self.viewControllers?.append(detailsViewController)
    }
}

extension TabBarViewController: UITabBarControllerDelegate {
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        if viewController is DetailsViewController {
            let nav = UINavigationController()
            let vc = DetailsViewController()
            vc.title = "Details"
            vc.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: .done, target: self, action: #selector(closeDetails))
            nav.addChild(vc)
            vc.didMove(toParent: nav)
            nav.modalPresentationStyle = .overFullScreen
            self.present(nav, animated: true)
            return false
        }
        return true
    }
    
    @objc func closeDetails() {
        dismiss(animated: true, completion: nil)
    }
}
