//
//  HomeModel.swift
//  TestProject
//
//  Created by Aleksandr Svetilov on 05.11.2020.
//

import Foundation

protocol HomeModelDelegate: class{
    func didGetItem()
}

class HomeModel {
    
    var item: CallDetails?
    
    weak var delegate: HomeModelDelegate?
    
    func fetchData() {
        let url = URL(string: "https://5e3c202ef2cb300014391b5a.mockapi.io/testapi")!
        let session = URLSession.shared
        let task = session.dataTask(with: url) { (data, response, error) in
            if let data = data {
                if let result = try? JSONDecoder().decode(CallDetails.self, from: data) {
                    self.item = result
                    self.delegate?.didGetItem()
                }
            }
            if let e = error {
                print(e)
            }
        }
        task.resume()
    }
}
