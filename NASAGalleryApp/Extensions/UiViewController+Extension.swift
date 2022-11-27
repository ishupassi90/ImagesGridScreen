//
//  UiViewController+Extension.swift
//  NASAGalleryApp
//
//  Created by Ishu Passi on 27/11/22.
//

import Foundation
import UIKit

extension UIViewController {
  func alert(message: String, title: String = "") {
    let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
      let OKAction = UIAlertAction(title: AppStringConstant.okString, style: .default, handler: nil)
    alertController.addAction(OKAction)
    self.present(alertController, animated: true, completion: nil)
  }
}
