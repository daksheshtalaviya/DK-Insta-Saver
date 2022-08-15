//
//  UserDetailController+UICollectionView.swift
//  DKInstaSaver
//
//  Created by Dksh on 15/08/22.
//

import UIKit

extension UserDetailController {
    
    func configureCollection() {
        
        clMedia.dataSource = self
        clMedia.delegate = self
    }
    
    func refreshData() {
        
    }
}

extension UserDetailController : UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }
    
    
}

extension UserDetailController : UICollectionViewDelegate {
    
}
