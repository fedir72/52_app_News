//
//  OneNewsController.swift
//  newsapi_App
//
//  Created by fedir on 10.06.2020.
//  Copyright © 2020 fedir. All rights reserved.
//

import UIKit

class OneNewsController: UIViewController {
    
    var article: Article!
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        titleLabel.text = article?.title
        descriptionLabel.text = article?.description
          //получение картинки
        DispatchQueue.main.async {
            if let url = URL(string: self.article.urlToImage!) {
                if let data = try? Data(contentsOf: url) { self.imageView.image = UIImage(data: data ) }
                 }
             }
        }
     
    @IBAction func pushOpenAction(_ sender: UIButton) {
     
    }
    

}
