//
//  ViewController.swift
//  CollectionVC
//
//  Created by steve on 2020/9/6.
//  Copyright © 2020 steve. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.setupCollectionVC()
    }

    private func setupCollectionVC() {
        let collectionVC = CollectionViewController()
        self.addChild(collectionVC)
        
        let collectionView = collectionVC.view!
        self.view.addSubview(collectionView)
        
        collectionVC.didMove(toParent: self)
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            collectionView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            collectionView.heightAnchor.constraint(equalTo: collectionView.widthAnchor)
        ])
    }
    

}

