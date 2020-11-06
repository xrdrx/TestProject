//
//  CallDetails.swift
//  TestProject
//
//  Created by Aleksandr Svetilov on 05.11.2020.
//

import Foundation

struct CallDetails: Codable {
    let id: String
    let state: String
    let client: Client
    let type: String
    let created: String
    let businessNumber: BusinessNumber
    let origin: String
    let favorite: Bool
    let duration: String
}

struct Client: Codable {
    let address: String
    let name: String
    
    enum CodingKeys: String, CodingKey {
        case address
        case name = "Name"
    }
}

struct BusinessNumber: Codable {
    let number: String
    let label: String
}
