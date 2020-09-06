//
//  CollectionViewController.swift
//  CollectionVC
//
//  Created by steve on 2020/9/6.
//  Copyright © 2020 steve. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class CollectionViewController: UICollectionViewController {
    
    private let values = [112.0, 116.0, 86.0, 95.0, 67.0, 76.0, 34.0, 43.0, 24.0, 35.0, 47.0, 66.0, 66.0, 57.0, 36.0, 64.0, 23.0, 22.0, 23.0, 22.0, 22.0, 22.0, 20.0, 23.0]
    private var relativeHeightCache: [IndexPath: CGFloat] = [:]
    private let itemSpace: CGFloat = 8
    private var itemWidth: CGFloat = 0
    private var countInOnePage: CGFloat = 12
    
    //MARK: -
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(scrollDirection: UICollectionView.ScrollDirection = .horizontal) {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = scrollDirection
        super.init(collectionViewLayout: layout)
        
        self.collectionView!.delegate = self
        self.collectionView!.dataSource = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.collectionView.backgroundColor = .white
        let padding: CGFloat = 8.0 * (self.countInOnePage - 1)
        let spaceLeft = UIScreen.main.bounds.width - padding
        self.itemWidth = spaceLeft / countInOnePage
        
        // Register cell classes
        self.collectionView!.register(CollectionViewCell.self, forCellWithReuseIdentifier: CollectionViewCell.reuseIdentifier)
    }
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()

    }
    // MARK: - UICollectionViewDataSource
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return self.values.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.reuseIdentifier, for: indexPath) as! CollectionViewCell

        //calculate height value

        var barHeight: CGFloat = 0.0
        if let cachedHeight = relativeHeightCache[indexPath] {
            // Cache Hit
            barHeight = cachedHeight
        } else {
            // Cache miss, set after cache population
            let availableHeight = 0.6 * collectionView.frame.height
            let Δvalue = values.max()! - values.min()!
            if Δvalue != 0 {
                let different = max(values[indexPath.row] - values.min()!, 0.0)
                let ratio = CGFloat(different / Δvalue)
                barHeight = ratio * availableHeight
            }
            relativeHeightCache[indexPath] = barHeight
        }
        cell.set(barHeight: barHeight, barIndex: indexPath.row, value: values[indexPath.row])
        return cell
    }
    
}


//MARK: - UICollectionViewDelegateFlowLayout

extension CollectionViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.itemWidth, height: collectionView.bounds.height - 1)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return self.itemSpace
    }
    
}
