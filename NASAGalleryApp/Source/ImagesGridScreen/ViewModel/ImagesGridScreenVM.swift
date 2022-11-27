//
//  ImagesGridScreenVM.swift
//  NASAGalleryApp
//
//  Created by Ishu Passi on 27/11/22.
//

import Foundation
import UIKit
import Alamofire

// ImagesGridScreenVMDelegate
protocol ImagesGridScreenVMDelegate{
    func didSucess()
    func didError(withString:String?)
}

class ImagesGridScreenVM {
    // Variable
    var delgate:ImagesGridScreenVMDelegate?
    var imagesData = [ImagesModel]()
    
    // Method to call images api
    func getImage() {
        AF.request(AppStringConstant.mainURL, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil)
            .responseJSON(completionHandler: { response in
                switch response.result {
                case .success:
                    do {
                        let returnedData = try JSONDecoder().decode([ImagesModel].self, from: response.data!)
                        DispatchQueue.main.async {
                            self.imagesData = returnedData
                            self.delgate?.didSucess()
                        }
                    } catch {
                        self.delgate?.didError(withString: error.localizedDescription)
                    }
                case .failure(let error):
                    self.delgate?.didError(withString: error.localizedDescription)
                }
        })
    }
}
