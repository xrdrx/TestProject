//
//  HomeViewModel.swift
//  TestProject
//
//  Created by Aleksandr Svetilov on 05.11.2020.
//

import Foundation

protocol HomeViewModelDelegate: class {
    func didPrepareItem()
}

class HomeViewModel: HomeModelDelegate {
    
    let model: HomeModel
    
    weak var delegate: HomeViewModelDelegate?
    
    var clientName = ""
    var clientNumber = ""
    var clientBusinessNumberName = ""
    var clientBusinessNumber = ""
    
    init() {
        self.model = HomeModel()
        model.delegate = self
    }
    
    func fetchData() {
        model.fetchData()
    }
    
    func didGetItem() {
        if let item = model.item {
            clientName = item.client.name
            clientNumber = formatNumberForDisplay(item.client.address)
            
            clientBusinessNumberName = item.businessNumber.label
            clientBusinessNumber = formatNumberForDisplay(item.businessNumber.number)
        }
        delegate?.didPrepareItem()
    }
    
    private func formatNumberForDisplay(_ number: String) -> String {
        // format
        return number
    }
}
