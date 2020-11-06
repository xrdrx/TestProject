//
//  DetailViewModel.swift
//  TestProject
//
//  Created by Aleksandr Svetilov on 06.11.2020.
//

import Foundation
import UIKit

class DetailViewModel {
    
    let model: DetailModel
    
    init() {
        self.model = DetailModel()
    }
    
    func getNumberOfRows() -> Int {
        return model.getNumberOfRows()
    }
    
    func configureCell(_ cell: DetailsViewCell, forRowAt indexPath: IndexPath) {
        let item = model.getItem(forRow: indexPath.row)
        DispatchQueue.main.async {
            cell.stateImage.image = item.image
            cell.mainLabel.text = item.mainLabel
            cell.timeLabel.text = item.time
            cell.durationLabel.text = item.duration
            cell.secondaryLabel.text = "Secondary label"
        }
    }
    
    func configureCellShadow(_ cell: DetailsViewCell) {
        cell.customBackground.layer.masksToBounds = true
        let radius = cell.customBackground.layer.cornerRadius
        cell.contentView.layer.shadowPath = UIBezierPath(roundedRect: cell.bounds, cornerRadius: radius).cgPath
    }
}
