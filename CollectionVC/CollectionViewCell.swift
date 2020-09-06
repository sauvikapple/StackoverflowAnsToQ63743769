//
//  CollectionViewCell.swift
//  CollectionVC
//
//  Created by Sauvik Dolui on 06/09/20.
//  Copyright © 2020 steve. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    static let reuseIdentifier: String = "CollectionViewCell"
    
    lazy var timeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 13)
        
        return label
    }()
    lazy var valueView:  UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemBlue
        return view
    }()
    lazy var valueLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 12)
        
        return label
    }()
    private var viewViewHeightConst: NSLayoutConstraint?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUpView()
    }
    
    private func setUpView() {
        contentView.addSubview(timeLabel)
        NSLayoutConstraint.activate([
            timeLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -4),
            timeLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor)
        ])
        contentView.addSubview(valueView)
        viewViewHeightConst = valueView.heightAnchor.constraint(equalToConstant: 0.0)
        NSLayoutConstraint.activate([
            valueView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            valueView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            valueView.bottomAnchor.constraint(equalTo: timeLabel.topAnchor, constant: -4),
            viewViewHeightConst!
        ])
        
        contentView.addSubview(valueLabel)
        NSLayoutConstraint.activate([
            valueLabel.bottomAnchor.constraint(equalTo: valueView.topAnchor, constant: -4),
            valueLabel.centerXAnchor.constraint(equalTo: valueView.centerXAnchor)
        ])
    }
    
    func set(barHeight: CGFloat, barIndex: Int, value: Double) {
        viewViewHeightConst?.constant = barHeight
        valueLabel.text = "\(value)"
        timeLabel.text = "\(barIndex)"
    }
}
