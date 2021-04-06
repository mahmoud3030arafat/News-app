//
//  MovieViewModel.swift
//  Rest API
//
//  Created by Niso on 4/29/20.
//  Copyright © 2020 Niso. All rights reserved.
//

import Foundation

class NewsViewModel {
    // create an object  from ApiService class
    private var apiService = ApiService()
    private var popularNews = [articles]()
    func fetchPopularNewsData(completion:@escaping()->()){
        
        apiService.getPopularNewsData {[weak self] (result) in
            switch result{
            case .success(let listOf):
                self?.popularNews = listOf.news
                completion()
                
            case .failure(let error ) :
                print(error.localizedDescription)
                
                
            }
            
        }
        
    }
    func numberOfRowsInSection (section : Int )->Int{
        if popularNews.count != 0 {
            return popularNews.count
        }
        return 0
    }
    func cellForRowAt (indexPath:IndexPath)->articles{
        return  popularNews[indexPath.row]
    }
    
//    private var apiService = ApiService()
//    private var popularNews = [articles]()
//
//
//    func fetchPopularNewsData(completion: @escaping () -> ()) {
//
//        // weak self - prevent retain cycles
//        apiService.getPopularNewsData { [weak self] (result) in
//            switch result {
//            case .success(let listOf):
//                self?.popularNews = listOf.news
//                completion()
//            case .failure(let error):
//                // Something is wrong with the JSON file or the model
//                print("Error processing json data: \(error)")
//            }
//        }
//    }
//
//    func numberOfRowsInSection(section: Int) -> Int {
//        if popularNews.count != 0 {
//            return popularNews.count
//        }
//        return 0
//    }
//
//    func cellForRowAt (indexPath: IndexPath) -> articles {
//        return popularNews[indexPath.row]
//    }
}
