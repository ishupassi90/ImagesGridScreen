//
//  ImageDetailCell.swift
//  NASAGalleryApp
//
//  Created by Ishu Passi on 27/11/22.
//

import UIKit

class ImageDetailCell: UICollectionViewCell {

    // MARK: - IBOutlets
    @IBOutlet weak var cellCopyrightLabel: UILabel!
    @IBOutlet weak var cellExplanationLabel: UILabel!
    @IBOutlet weak var cellDateLabel: UILabel!
    @IBOutlet weak var cellTitleLabel: UILabel!
    @IBOutlet weak var cellImageView: UIImageView!
    
    // MARK: - Variable
    var imageDataObject: ImagesModel?{
        didSet{
            cellImageView.sd_setImage(with: URL.init(string: imageDataObject?.hdurl ?? ""), placeholderImage: UIImage.init(named: "placeHolderImage"))
            cellCopyrightLabel.text = "@copyright " + (imageDataObject?.copyright ?? "")
            cellExplanationLabel.text = imageDataObject?.explanation ?? ""
            cellDateLabel.text = imageDataObject?.date ?? ""
            cellTitleLabel.text = imageDataObject?.title ?? ""
        }
    }
    
    // MARK: - Cell Methods
    override func awakeFromNib() {
        super.awakeFromNib()
    }

}
