//
//  ImagesModel.swift
//  NASAGalleryApp
//
//  Created by Ishu Passi on 27/11/22.
//

import Foundation

struct ImagesModel: Codable {
    let copyright: String?
    let date, explanation: String?
    let hdurl: String?
    let mediaType: MediaType?
    let serviceVersion: ServiceVersion?
    let title: String?
    let url: String?

    enum CodingKeys: String, CodingKey {
        case copyright, date, explanation, hdurl
        case mediaType = "media_type"
        case serviceVersion = "service_version"
        case title, url
    }
}

enum MediaType: String, Codable {
    case image = "image"
}

enum ServiceVersion: String, Codable {
    case v1 = "v1"
}
