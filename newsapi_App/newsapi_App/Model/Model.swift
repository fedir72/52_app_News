//
//  Model.swift
//  newsapi_App
//
//  Created by fedir on 09.06.2020.
//  Copyright © 2020 fedir. All rights reserved.
//

import Foundation

//http://newsapi.org/v2/top-headlines?country=ua&category=business&apiKey=a369977c717a42b1b25a2651946cd576

//путь к данным
var UrlToData: URL {
    let path = NSSearchPathForDirectoriesInDomains(.libraryDirectory, .userDomainMask, true)[0]+"/data.json"
    let urlPath = URL(fileURLWithPath: path)
    return urlPath
}


var articles: [Article] = []

func loadNews(completionHandler: (() -> Void)?) {
    let urlString = "http://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=a369977c717a42b1b25a2651946cd576"
    let url = URL(string: urlString)
    let sesion = URLSession(configuration: .default)
    sesion.downloadTask(with: url!) { (urlFile, responce, error) in
        if urlFile != nil {
                     try?   FileManager.default.copyItem(at: urlFile!, to: UrlToData )
            //MARK: - вызываем фуункцию парс
             print(UrlToData)
            parseNews()
            completionHandler?()
            print(articles.count)
           
            
            
        }
    }.resume()
}

func parseNews() {
  
    //данные и проверка
    guard let data = try? Data(contentsOf: UrlToData) else {return}
    
    let rootDictionaryAny  = try? JSONSerialization.jsonObject(with: data, options: .allowFragments)
    if rootDictionaryAny == nil {
        return
    }
    
    let rootDictionary = rootDictionaryAny as? [String:Any]
    if rootDictionary == nil {
        return
    }
    
    if let array = rootDictionary!["articles"] as? [[String:Any]] {
         var returnArray: [Article] = []
         for dict in array {
             
             let newArticle = Article(dictionary: dict)
             returnArray.append(newArticle)
         }
         articles = returnArray
    }
}
