//
//  PhotoView.swift
//  PhotoViewer
//
//  Created by admin on 2020/12/07.
//

import SwiftUI

struct PhotoView: View {
    var urls : [String : String]
//    var photoList : [Photo]
    
    var body: some View {
        NavigationLink(
            destination: DetailView(urls: urls/*, photoList: photoList*/)
        ) {
            Text(urls["thumb"] ?? "")
            // TODO: show photo thumbnail for scrolling
            // Challenge: change view transition animation
        }
    }
}
