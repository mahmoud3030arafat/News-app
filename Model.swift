//
//  Model.swift
//  Rest API
//
//  Created by Niso on 4/29/20.
//  Copyright © 2020 Niso. All rights reserved.
//

import Foundation

struct NewsData: Decodable {
   // let news : [articles]
    let news: [articles]
    let status :String?


    private enum CodingKeys: String, CodingKey {
        case news = "articles"
        case status = "status"


    }
}

struct  articles : Decodable {
    let description : String?
    let  author : String?
    let poster :String?
  

    private enum CodingKeys: String, CodingKey {
        case description = "description"
            case author = "author"
        case poster  = "urlToImage"

}
}
