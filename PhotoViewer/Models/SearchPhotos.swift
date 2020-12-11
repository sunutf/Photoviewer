//
//  SearchPhotos.swift
//  PhotoViewer
//
//  Created by admin on 2020/12/07.
//

import Foundation

struct SearchPhotos : Decodable {
    var total : Int
    var total_pages : Int
    var results : [Photo]
}
