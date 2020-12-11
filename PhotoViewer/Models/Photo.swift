//
//  Photo.swift
//  PhotoViewer
//
//  Created by admin on 2020/12/06.
//

import Foundation

struct Photo : Decodable, Identifiable {
    var id : String
    var urls : [String : String]
}
