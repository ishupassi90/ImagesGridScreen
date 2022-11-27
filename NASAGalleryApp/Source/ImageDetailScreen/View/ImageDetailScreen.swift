//
//  ImageDetailScreen.swift
//  NASAGalleryApp
//
//  Created by Ishu Passi on 27/11/22.
//

import UIKit

class ImageDetailScreen: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var detailCollectionView: UICollectionView!
    
    // MARK: - Variables
    var imagesData = [ImagesModel]()
    var withIndex = 0
        
    override func viewDidLoad() {
        super.viewDidLoad()
        self.detailCollectionView.register(ImageDetailCell.nib, forCellWithReuseIdentifier: ImageDetailCell.identifier)
        self.detailCollectionView.reloadData()
        DispatchQueue.main.async {
            self.detailCollectionView.scrollToItem(at:IndexPath(item: self.withIndex, section: 0), at: .centeredHorizontally, animated: false)
        }
    }
}

// MARK: - UICollectionViewDataSource, UICollectionViewDelegate
extension ImageDetailScreen: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.imagesData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ImageDetailCell.identifier, for: indexPath) as! ImageDetailCell
        cell.imageDataObject = self.imagesData[indexPath.row]
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension ImageDetailScreen: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width, height: collectionView.frame.size.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
