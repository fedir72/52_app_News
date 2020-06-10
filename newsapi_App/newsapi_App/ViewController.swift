//
//  ViewController.swift
//  newsapi_App
//
//  Created by fedir on 09.06.2020.
//  Copyright © 2020 fedir. All rights reserved.
//

import UIKit
//a369977c717a42b1b25a2651946cd576


class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //загрузка новостей и перезагрузка тейблвью в комплишене
        loadNews {
            DispatchQueue.main.async {
           self.tableView.reloadData()
            }
        }
        tableView.dataSource = self
        tableView.delegate = self
       
    }


}

extension ViewController: UITableViewDataSource,UITableViewDelegate {
    
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return 1
//    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let article = articles[indexPath.row]
        cell.textLabel?.text = article.author
        cell.detailTextLabel?.text = article.publishedAt
         
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    //переход на выбранную новость по нажатию
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "goToOneNews", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToOneNews" {
            if let indexPath = tableView.indexPathForSelectedRow {
            //передача значения в артикл на дестинейшнконтроллер
        (segue.destination as? OneNewsController)?.article = articles[indexPath.row]
        //отмена фона выбранной ячейки
        tableView.deselectRow(at:indexPath, animated: true)

            }
        }
    }
    
}
