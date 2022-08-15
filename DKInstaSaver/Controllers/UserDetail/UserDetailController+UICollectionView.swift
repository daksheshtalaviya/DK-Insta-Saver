//
//  UserDetailController+UICollectionView.swift
//  DKInstaSaver
//
//  Created by Dksh on 15/08/22.
//

import UIKit

extension UserDetailController {
    
    func configureCollection() {
        
        clMedia.registerNib(type: MediaGridCell.self, reuseIdentifier: MediaGridCell.identifier)
        clMedia.dataSource = self
        clMedia.delegate = self

        let rowCount: CGFloat = 3
        if let flowLayout = clMedia.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.scrollDirection = .vertical
            flowLayout.minimumInteritemSpacing = 5
            flowLayout.minimumLineSpacing = 5
            
            let horizontalPadding: CGFloat = 20
            let spaceBetweenItems = flowLayout.minimumInteritemSpacing * (rowCount - 1)
            let cellWidth: CGFloat = ((UIScreen.main.bounds.size.width - spaceBetweenItems - horizontalPadding) / rowCount) - 0.1
            flowLayout.itemSize = .init(width: cellWidth, height: cellWidth)
        }
    }
    
    func reloadData() {
        DispatchQueue.main.async {
            self.clMedia.reloadData()
        }
    }
    
    fileprivate func loadMoreData() {
        DSLog.log()
        
        switch selectedMediaSegmentType {
        case .images, .videos:
            let moreAvailable = viewModel.maxIds[selectedMediaSegmentType]?.values.first ?? false
            DSLog.log("moreAvailable: \(moreAvailable)")
            viewModel.loadMedias(loadMore: moreAvailable)
            break
        default: break
        }
    }
}

extension UserDetailController : UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.items[selectedMediaSegmentType]?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MediaGridCell.identifier, for: indexPath) as? MediaGridCell else { return UICollectionViewCell() }
        let model = viewModel.items[selectedMediaSegmentType]?[safe: indexPath.row]
        cell.model = model
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        
//        if indexPath.row == (viewModel.items[selectedMediaSegmentType]?.count ?? 0) - 1 && !waiting  {
//            waiting = true
//            loadMoreData()
//        }
    }
}

extension UserDetailController : UIScrollViewDelegate {
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        DSLog.log("contentOffset: \(scrollView.contentOffset.y)")
        
        // ScrollView only moves in one direction, y axis
        let currentOffset = scrollView.contentOffset.y
        let maximumOffset = scrollView.contentSize.height - scrollView.frame.size.height
        
        // Change 10.0 to adjust the distance from bottom
        if maximumOffset - currentOffset <= 10.0 {
            loadMoreData()
        }
    }
}

extension UserDetailController : UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        DSLog.log("indexPath: \(indexPath)")
        
        guard let model = viewModel.items[selectedMediaSegmentType]?[safe: indexPath.row],
        let media = model as? Media else { return }
        DSLog.log("media: \(media.id ?? "")")
        
    }
}
