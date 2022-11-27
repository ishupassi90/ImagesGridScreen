//
//  ImageCell.swift
//  NASAGalleryApp
//
//  Created by Ishu Passi on 27/11/22.
//

import UIKit
import SDWebImage

class ImageCell: UICollectionViewCell {

    // MARK: - IBOutlets
    @IBOutlet weak var cellImageView: UIImageView!
    
    // MARK: - Variable
    var imageDataObject: ImagesModel?{
        didSet{
            cellImageView.sd_setImage(with: URL.init(string: imageDataObject?.hdurl ?? ""), placeholderImage: UIImage.init(named: "placeHolderImage"))
        }
    }
    
    // MARK: - Cell Methods
    override func awakeFromNib() {
        super.awakeFromNib()
    }

}
