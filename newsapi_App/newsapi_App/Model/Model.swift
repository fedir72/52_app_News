//
//  Model.swift
//  newsapi_App
//
//  Created by fedir on 09.06.2020.
//  Copyright © 2020 fedir. All rights reserved.
//

import Foundation

//http://newsapi.org/v2/top-headlines?country=ua&category=business&apiKey=a369977c717a42b1b25a2651946cd576



var articles: [Article] = []

func loadNews() {
    let urlString = "http://newsapi.org/v2/top-headlines?country=ua&category=business&apiKey=a369977c717a42b1b25a2651946cd576"
    let url = URL(string: urlString)
    let sesion = URLSession(configuration: .default)
    sesion.downloadTask(with: url!) { (urlFile, responce, error) in
        if urlFile != nil {
            
          let path =  NSSearchPathForDirectoriesInDomains(.libraryDirectory, .userDomainMask, true)[0]+"/data.json"
        let urlPath = URL(fileURLWithPath: path)
         try?   FileManager.default.copyItem(at: urlFile!, to: urlPath )
            //MARK: - вызываем фуункцию парс
             print(urlPath)
            parseNews()
            print(articles.count)
           
            
            
        }
    }.resume()
}

func parseNews() {
    
    let path = NSSearchPathForDirectoriesInDomains(.libraryDirectory, .userDomainMask, true)[0]+"/data.json"
    let urlPath = URL(fileURLWithPath: path)
    
    let data = try? Data(contentsOf: urlPath)
    let rootDictionary  = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? [String:Any]
    
    let array = rootDictionary!["articles"] as! [[String:Any]]
    var returnArray: [Article] = []
    for dict in array {
        
        let newArticle = Article(dictionary: dict)
        returnArray.append(newArticle)
    }
    articles = returnArray
}
