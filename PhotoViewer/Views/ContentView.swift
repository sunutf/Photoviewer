//
//  ContentView.swift
//  PhotoViewer
//
//  Created by admin on 2020/12/06.
//

// https://www.youtube.com/watch?v=QscQNGVy1Kc
import SwiftUI

struct ContentView: View {
    @ObservedObject var photos : Photos
    @State var searchText = ""
    @State var showText = "Welcome"
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                HStack {
                    Spacer(minLength: 3)
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.gray)
                    TextField("Search", text: self.$searchText)
                }
                Button("Find") {
                    self.showText = self.searchText
                    photos.searchPhotos(text: searchText)
                }.disabled(searchText.isEmpty)
                Spacer()
            }
            Text(showText)
            if photos.total >= 0 {
                Text("\(photos.total) result\(photos.total > 1 ? "s" : "")")
            }
            NavigationView {
                List {
                    ForEach(self.photos.photoList) { photo in
                        PhotoView(urls: photo.urls/*, photoList: self.photos.photoList*/)
                        // TODO: show images using by URL
                        // maybe you need to use library 'SDWebImage' or 'Kingfisher'
                        
                        // TODO: implement infinite scrolling (auto-loading when you reach the end of current photos)
                        // see searchMore() in Photos.swift
                        // https://www.donnywals.com/implementing-an-infinite-scrolling-list-with-swiftui-and-combine
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(photos: Photos())
    }
}
