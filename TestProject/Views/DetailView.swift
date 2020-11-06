//
//  DetailView.swift
//  TestProject
//
//  Created by Aleksandr Svetilov on 05.11.2020.
//

import UIKit

class DetailView: UIView {
    
    let detailTableView = UITableView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(detailTableView)
        setupLayout()
        
        detailTableView.separatorStyle = .none
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setupLayout() {
        detailTableView.turnOffMaskTranslation()
        detailTableView.setTopAnchorEqualTo(self.topAnchor)
        detailTableView.setBottomAnchorEqualTo(self.bottomAnchor)
        detailTableView.setTrailingAnchorEqualTo(self.trailingAnchor)
        detailTableView.setLeadingAnchorEqualTo(self.leadingAnchor)
    }
}
