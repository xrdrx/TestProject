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
    @IBOutlet weak var stacksBackground: UIView!
    
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
        
        self.stacksBackground.layer.cornerRadius = 8
        self.stacksBackground.layer.shadowPath = UIBezierPath(rect: self.stacksBackground.bounds).cgPath
        self.stacksBackground.layer.shadowRadius = 5
        self.stacksBackground.layer.shadowOffset = .zero
        self.stacksBackground.layer.shadowOpacity = 1
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
        stacksBackground.isHidden = true
        businessStack.isHidden = true
        infoStack.isHidden = true
        callStack.isHidden = true
    }
    
    private func showStacks() {
        stacksBackground.isHidden = false
        businessStack.isHidden = false
        infoStack.isHidden = false
        callStack.isHidden = false
    }
    
    @IBAction func swipeBusinessStack(_ sender: UISwipeGestureRecognizer) {
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations: {
            var stackFrame = self.stacksBackground.frame
            stackFrame.origin.y -= (stackFrame.size.height - 25)
            self.stacksBackground.frame = stackFrame
        })
    }
}


//MARK: - Home view model delegate

extension HomeViewController: HomeViewModelDelegate {
    
    func didPrepareItem() {
        updateUi()
    }
}
