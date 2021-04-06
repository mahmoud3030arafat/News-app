//
//  ApiService.swift
//  Rest API
//
//  Created by Niso on 4/29/20.
//  Copyright © 2020 Niso. All rights reserved.
//

import Foundation

class ApiService {
    
    private var dataTask:URLSessionDataTask?
    func getPopularNewsData (completion : @escaping(Result<NewsData,Error>)->Void){
        let popularNewsURL = "https://newsapi.org/v2/everything?q=bitcoin&from=2020-10-16&sortBy=publishedAt&apiKey=28f1864b61b647a2812608243a38b439"
        guard let  url = URL(string: popularNewsURL) else {return}
        dataTask=URLSession.shared.dataTask(with: url, completionHandler: { (data, response , error ) in
            // handel error
            if let error =  error {
                print(error.localizedDescription)
                return
            }
            // handel resonse
            guard let response = response  as? HTTPURLResponse else {
                return
            }
          
            
            // handel data
            guard let data = data else {
                return
            }
            do {
                let decoder =  JSONDecoder()
                let jsonData = try decoder.decode(NewsData.self, from: data)
             
                DispatchQueue.main.async {
                    completion(.success(jsonData))
                }
                
            }catch let error {
                print(error.localizedDescription)
                
            }
            
        })
        dataTask?.resume()
          
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
//    func getPopularNewsData(completion: @escaping (Result<NewsData, Error>) -> Void) {
//
//        let  = "https://newsapi.org/v2/everything?q=bitcoin&from=2020-10-11&sortBy=publishedAt&apiKey=fffdc0544da64bbc8d3ed37cb652fc85"
//
//        guard let url = URL(string: popularNewsURL) else {return}
//        print(url)
//        // Create URL Session - work on the background
//        dataTask = URLSession.shared.dataTask(with: url) { (data, response, error) in
//
//            // Handle Error
//            if let error = error {
//                completion(.failure(error))
//                print("DataTask error: \(error.localizedDescription)")
//                return
//            }
//
//            guard let response = response as? HTTPURLResponse else {
//                // Handle Empty Response
//                print("Empty Response")
//                return
//            }
//            print("Response status code: \(response.statusCode)")
//
//            guard let data = data else {
//                // Handle Empty Data
//                print("Empty Data")
//                return
//            }
//
//            do {
//                // Parse the data
//                let decoder = JSONDecoder()
//                let jsonData = try decoder.decode(NewsData.self, from: data)
////                print("@@@@@@@@@@@##############")
////                print(jsonData.status)
////                print(jsonData.news[0])
//                // Back to the main thread
//                DispatchQueue.main.async {
//                    completion(.success(jsonData))
//
//                }
//            } catch let error {
//                completion(.failure(error))
//            }
//
//        }
//        dataTask?.resume()
//    }
}
