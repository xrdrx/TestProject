//
//  DetailViewCell.swift
//  TestProject
//
//  Created by Aleksandr Svetilov on 05.11.2020.
//

import UIKit

class DetailsViewCell: UITableViewCell {
    
    let stateImage = UIImageView()
    let mainLabel = UILabel()
    let secondaryLabel = UILabel()
    let timeLabel = UILabel()
    let durationLabel = UILabel()
    let customBackground = UIView()
    
    override init(style: UITableViewCell.CellStyle,
         reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
        assembleViews()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    private func setupViews() {
        setupLabel(label: mainLabel, font: UIFont.systemFont(ofSize: 18, weight: .semibold), alignment: .left)
        setupLabel(label: secondaryLabel, font: UIFont.systemFont(ofSize: 16, weight: .regular), alignment: .left)
        setupLabel(label: timeLabel, font: UIFont.systemFont(ofSize: 14, weight: .regular), alignment: .right)
        setupLabel(label: durationLabel, font: UIFont.systemFont(ofSize: 14, weight: .regular), alignment: .right)
        
        customBackground.backgroundColor = .systemBackground
        customBackground.layer.cornerRadius = 8
        
        contentView.backgroundColor = .clear
        contentView.layer.masksToBounds = false
        contentView.layer.shadowOpacity = 0.25
        contentView.layer.shadowRadius = 4
        contentView.layer.shadowOffset = CGSize(width: 0, height: 0)
        contentView.layer.shadowColor = UIColor.black.cgColor

        selectionStyle = .none
    }
    
    private func setupLabel(label: UILabel, font: UIFont, alignment: NSTextAlignment) {
        label.font = font
        label.textAlignment = alignment
    }
    
    private func assembleViews() {
        customBackground.addSubview(stateImage)
        customBackground.addSubview(mainLabel)
        customBackground.addSubview(secondaryLabel)
        customBackground.addSubview(timeLabel)
        customBackground.addSubview(durationLabel)
        contentView.addSubview(customBackground)
    }
    
    private func setupLayout() {
        customBackground.turnOffMaskTranslation()
        customBackground.setTopAnchorEqualTo(contentView.topAnchor, 20)
        customBackground.setBottomAnchorEqualTo(contentView.bottomAnchor, -20)
        customBackground.setLeadingAnchorEqualTo(contentView.leadingAnchor, 20)
        customBackground.setTrailingAnchorEqualTo(contentView.trailingAnchor, -20)
        
        stateImage.turnOffMaskTranslation()
        stateImage.setWidth(40)
        stateImage.setHeight(40)
        stateImage.setTopAnchorEqualTo(customBackground.topAnchor, 20)
        stateImage.setLeadingAnchorEqualTo(customBackground.leadingAnchor, 20)
        
        mainLabel.turnOffMaskTranslation()
        mainLabel.setTopAnchorEqualTo(stateImage.topAnchor, 10)
        mainLabel.setLeadingAnchorEqualTo(stateImage.trailingAnchor, 20)
        mainLabel.setTrailingAnchorEqualTo(customBackground.trailingAnchor)
        
        secondaryLabel.turnOffMaskTranslation()
        secondaryLabel.setTopAnchorEqualTo(mainLabel.bottomAnchor, 10)
        secondaryLabel.setLeadingAnchorEqualTo(mainLabel.leadingAnchor)
        
        timeLabel.turnOffMaskTranslation()
        timeLabel.setTrailingAnchorEqualTo(customBackground.trailingAnchor, -20)
        timeLabel.setBottomAnchorEqualTo(customBackground.bottomAnchor, -20)
        
        durationLabel.turnOffMaskTranslation()
        durationLabel.centerXAnchor.constraint(equalTo: stateImage.centerXAnchor).isActive = true
        durationLabel.setTopAnchorEqualTo(stateImage.bottomAnchor, 20)
        durationLabel.setBottomAnchorEqualTo(customBackground.bottomAnchor, -20)
    }
}
