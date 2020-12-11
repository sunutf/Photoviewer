//
//  PhotoViewerApp.swift
//  PhotoViewer
//
//  Created by admin on 2020/12/06.
//

import SwiftUI

@main
struct PhotoViewerApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(photos: Photos())
        }
    }
}
