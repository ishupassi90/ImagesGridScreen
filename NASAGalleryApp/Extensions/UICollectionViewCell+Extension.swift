//
//  UICollectionViewCell+Extension.swift
//  NASAGalleryApp
//
//  Created by Ishu Passi on 27/11/22.
//

import Foundation
import UIKit

extension UICollectionViewCell {
    
    static var nib:UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    static var identifier: String {
        return String(describing: self)
    }
}
