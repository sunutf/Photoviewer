//
//  DetailView.swift
//  PhotoViewer
//
//  Created by admin on 2020/12/07.
//

import SwiftUI

struct DetailView: View {
    var urls : [String : String]
//    var photoList : [Photo]
    
    var body: some View {
        Text(urls["regular"] ?? "")
        // TODO: show single photo
        // Optional1: implement swipe left/right (see a previous/next photo)
        // Optional2: remember last viewed photo (show last viewed photo when you return to ContentView)
        // Challenge: implement pinch gesture (zoom in/out current photo)
        // Challenge: implement additional loading when you see the last photo
    }
}
