//
//  HomeViewController.swift
//  TestProject
//
//  Created by Aleksandr Svetilov on 05.11.2020.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var number: UILabel!
    
    @IBOutlet weak var businessNumberName: UILabel!
    @IBOutlet weak var businessNumber: UILabel!
    
    @IBOutlet weak var callStateImage: UIImageView!
    @IBOutlet weak var callStateLabel: UILabel!
    
    @IBOutlet weak var businessStack: UIStackView!
    @IBOutlet weak var infoStack: UIStackView!
    @IBOutlet weak var callStack: UIStackView!
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    let viewModel: HomeViewModel
    
    required init?(coder: NSCoder) {
        self.viewModel = HomeViewModel()
        super.init(coder: coder)
        viewModel.delegate = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        hideStacks()
        activityIndicator.startAnimating()
        activityIndicator.hidesWhenStopped = true
        viewModel.fetchData()
    }

    private func updateUi() {
        DispatchQueue.main.async {
            self.name.text = self.viewModel.clientName
            self.number.text = self.viewModel.clientNumber
            
            self.businessNumberName.text = self.viewModel.clientBusinessNumberName
            self.businessNumber.text = self.viewModel.clientBusinessNumber
            
            self.activityIndicator.stopAnimating()
            self.showStacks()
        }
    }
    
    private func hideStacks() {
        businessStack.isHidden = true
        infoStack.isHidden = true
        callStack.isHidden = true
    }
    
    private func showStacks() {
        businessStack.isHidden = false
        infoStack.isHidden = false
        callStack.isHidden = false
    }
    
    @IBAction func swipeBusinessStack(_ sender: UISwipeGestureRecognizer) {
        businessStack.isHidden = true
    }
}

//MARK: - Home view model delegate

extension HomeViewController: HomeViewModelDelegate {
    
    func didPrepareItem() {
        updateUi()
    }
}
