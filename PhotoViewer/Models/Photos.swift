//
//  Photos.swift
//  PhotoViewer
//
//  Created by admin on 2020/12/07.
//

import Foundation

let ACCESS_KEY = "mBES4ALxLNSVTaiB4xC1aVg8Q5k7QU-qHMeWuG6sI58"

class Photos : ObservableObject {
    @Published var photoList : [Photo] = []
    @Published var total : Int = -1
    var query : String = ""
    var currentPage : Int = 0
    var totalPage : Int = 0
    
    init() {
        getPhotos()
    }
    
    func getPhotos() {
        guard let url = URL(string:"https://api.unsplash.com/photos/?client_id=\(ACCESS_KEY)") else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let httpResponse = response as? HTTPURLResponse,
                  (200..<300).contains(httpResponse.statusCode),
                  let data = data
            else {
                return
            }
            
            guard let photoList = try? JSONDecoder().decode([Photo].self, from: data) else {
                return
            }
            
            DispatchQueue.main.async {
                self.photoList = photoList
            }
        }.resume()
    }
    
    func searchPhotos(text: String) {
        guard let query = text.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed) else { return }
        self.query = query
        
        guard let url = URL(string:"https://api.unsplash.com/search/photos?query=\(query)&client_id=\(ACCESS_KEY)") else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let httpResponse = response as? HTTPURLResponse,
                  (200..<300).contains(httpResponse.statusCode),
                  let data = data
            else {
                return
            }
            
            guard let searchPhotos = try? JSONDecoder().decode(SearchPhotos.self, from: data) else {
                return
            }
            
            DispatchQueue.main.async {
                self.total = searchPhotos.total
                self.totalPage = searchPhotos.total_pages
                self.currentPage = 1
                self.photoList = searchPhotos.results
            }
        }.resume()
    }
    
    // TODO: Fix it for implement infinite scrolling
    func searchMore() {
        if self.currentPage >= self.totalPage {
            return
        }
        
        self.currentPage += 1
        
        guard let url = URL(string:"https://api.unsplash.com/search/photos?page=\(self.currentPage)&query=\(self.query)&client_id=\(ACCESS_KEY)") else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let httpResponse = response as? HTTPURLResponse,
                  (200..<300).contains(httpResponse.statusCode),
                  let data = data
            else {
                return
            }
            
            guard let searchPhotos = try? JSONDecoder().decode(SearchPhotos.self, from: data) else {
                return
            }
            
            DispatchQueue.main.async {
                self.photoList += searchPhotos.results
            }
        }.resume()
    }
}
