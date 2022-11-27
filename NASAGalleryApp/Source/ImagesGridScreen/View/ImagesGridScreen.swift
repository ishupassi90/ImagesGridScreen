//
//  ImagesGridScreen.swift
//  NASAGalleryApp
//
//  Created by Ishu Passi on 27/11/22.
//

import UIKit

class ImagesGridScreen: UIViewController {
    
    // MARK: - Variables
    lazy var viewModel:ImagesGridScreenVM = {
        let vm = ImagesGridScreenVM()
        vm.delgate = self
        return vm
    }()
    
    // MARK: - IBOutlets
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    @IBOutlet weak var mainCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainCollectionView.register(ImageCell.nib, forCellWithReuseIdentifier: ImageCell.identifier)
        
        // Calling Api
        self.loadingIndicator.startAnimating()
        self.viewModel.getImage()
    }
}

// MARK: - ImagesGridScreenVMDelegate Methods
extension ImagesGridScreen: ImagesGridScreenVMDelegate{
    func didSucess(){
        self.loadingIndicator.stopAnimating()
        self.mainCollectionView.reloadData()
    }
    
    func didError(withString:String?){
        self.loadingIndicator.stopAnimating()
        self.alert(message: withString ?? "")
    }
}

// MARK: - UICollectionViewDataSource, UICollectionViewDelegate
extension ImagesGridScreen: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.viewModel.imagesData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ImageCell.identifier, for: indexPath) as! ImageCell
        cell.imageDataObject = self.viewModel.imagesData[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "ImageDetailScreen") as? ImageDetailScreen
        vc?.imagesData = self.viewModel.imagesData
        vc?.withIndex = indexPath.row
        self.navigationController?.pushViewController(vc!, animated: true)
    }
}


// MARK: - UICollectionViewDelegateFlowLayout
extension ImagesGridScreen: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = (Int(collectionView.frame.size.width) / 2) - 10
        return CGSize(width: size, height: 110)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
