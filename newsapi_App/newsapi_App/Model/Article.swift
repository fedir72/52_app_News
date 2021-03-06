//
//  Article.swift
//  newsapi_App
//
//  Created by fedir on 09.06.2020.
//  Copyright © 2020 fedir. All rights reserved.
//

import Foundation



    
//    "id": "bbc-news",
//    "name": "BBC News"
//
//    "author": "BBC News",
//    "title": "'This has to be a fundamental rethinking' of police tactics",
//    "description": "Governor Cuomo says that little has changed since Rodney King was a victim of police brutality in 1991.",
//    "url": "http://www.bbc.co.uk/news/world-us-canada-52984989",
//    "urlToImage": "https://ichef.bbci.co.uk/news/1024/branded_news/158E3/production/_112819288_p08gh937.jpg",
//    "publishedAt": "2020-06-09T17:59:29Z",
//    "content": null

struct Article {
    
    var author: String?
    var title: String?
    var description: String?
    var url: String?
    var urlToImage: String?
    var publishedAt: String?
    var sourceName: String?
    
    init(dictionary: [String:Any]) {
        author = dictionary["author"] as? String ?? ""
        title = dictionary["title"] as? String ?? ""
        description = dictionary["description"]  as? String ?? ""
        url = dictionary["url"] as? String ?? ""
        urlToImage = dictionary["urlToImage"] as? String ?? ""
        //print(urlToImage)
        publishedAt = dictionary["publishedAt"] as? String ?? ""
        
        sourceName = (dictionary["source"] as? [String:Any] ?? ["":""])["name"] as? String ?? ""
    }
}
