//
//  DetailModel.swift
//  TestProject
//
//  Created by Aleksandr Svetilov on 06.11.2020.
//

import Foundation
import UIKit

class DetailModel {
    
    let testArray = [MockDetails(image: UIImage(systemName: "phone.fill.arrow.down.left")!, mainLabel: "+1234127349", duration: "15:25", time: "18:28"),
                     MockDetails(image: UIImage(systemName: "phone.fill.arrow.down.left")!, mainLabel: "+1234127349", duration: "15:25", time: "18:28"),
                     MockDetails(image: UIImage(systemName: "phone.fill.arrow.down.left")!, mainLabel: "+1234127349", duration: "15:25", time: "18:28"),
                     MockDetails(image: UIImage(systemName: "phone.fill.arrow.down.left")!, mainLabel: "+1234127349", duration: "15:25", time: "18:28"),
                     MockDetails(image: UIImage(systemName: "phone.fill.arrow.down.left")!, mainLabel: "+1234127349", duration: "15:25", time: "18:28"),
                     MockDetails(image: UIImage(systemName: "phone.fill.arrow.down.left")!, mainLabel: "+1234127349", duration: "15:25", time: "18:28"),
                     MockDetails(image: UIImage(systemName: "phone.fill.arrow.down.left")!, mainLabel: "+1234127349", duration: "15:25", time: "18:28"),
                     MockDetails(image: UIImage(systemName: "phone.fill.arrow.down.left")!, mainLabel: "+1234127349", duration: "15:25", time: "18:28"),
                     MockDetails(image: UIImage(systemName: "phone.fill.arrow.down.left")!, mainLabel: "+1234127349", duration: "15:25", time: "18:28"),
                     MockDetails(image: UIImage(systemName: "phone.fill.arrow.down.left")!, mainLabel: "+1234127349", duration: "15:25", time: "18:28"),
                     MockDetails(image: UIImage(systemName: "phone.fill.arrow.down.left")!, mainLabel: "+1234127349", duration: "15:25", time: "18:28"),
                     MockDetails(image: UIImage(systemName: "phone.fill.arrow.down.left")!, mainLabel: "+1234127349", duration: "15:25", time: "18:28"),
                     MockDetails(image: UIImage(systemName: "phone.fill.arrow.down.left")!, mainLabel: "+1234127349", duration: "15:25", time: "18:28"),
                     MockDetails(image: UIImage(systemName: "phone.fill.arrow.down.left")!, mainLabel: "+1234127349", duration: "15:25", time: "18:28"),
                     MockDetails(image: UIImage(systemName: "phone.fill.arrow.down.left")!, mainLabel: "+1234127349", duration: "15:25", time: "18:28"),
                     MockDetails(image: UIImage(systemName: "phone.fill.arrow.down.left")!, mainLabel: "+1234127349", duration: "15:25", time: "18:28")]
    
    func getNumberOfRows() -> Int {
        return testArray.count
    }
    
    func getItem(forRow row: Int) -> MockDetails {
        return testArray[row]
    }
}
