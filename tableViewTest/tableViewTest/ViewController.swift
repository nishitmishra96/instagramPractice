//
//  ViewController.swift
//  tableViewTest
//
//  Created by Himanshu on 02/03/19.
//  Copyright © 2019 craterzone. All rights reserved.
//

import UIKit
import Alamofire
import  AlamofireImage


class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{
    
    var cellforreload = mycustomcell()
    var thumbnailurlforscreen : String = ""
    var start = 0
    var limit = 10

    var dataoftable : [[String: Any]] = [[String: Any]]()
    
    @IBOutlet weak var tableview: UITableView!
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
 //       print("called again",dataoftable.count)
        return dataoftable.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! mycustomcell
        print("The count is \(dataoftable.count)")
        
        if dataoftable.count == 0 {
            print("no data")
        }
        else
        {
            cell.lbl.text = dataoftable[indexPath.row]["title"] as! String

        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        performSegue(withIdentifier: "segue", sender: self)
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if(indexPath.row == dataoftable.count-1)
        {
            viewDidLoad()
        }
        
        
    }
    override func viewDidLoad()
    {
        super.viewDidLoad()
        tableview.delegate = self
        tableview.dataSource  = self
        tableview.register(UINib(nibName: "mycustomcell", bundle: nil),
        forCellReuseIdentifier: "cell")
        
        let url = "https://jsonplaceholder.typicode.com/photos?_start=\(start)&_limit=\(limit)"
        
        self.getRequestAPICall(url: url)
        start = start + limit

    }
    
    func getRequestAPICall(url: String)  {
        Alamofire.request(url, method: .get, encoding: JSONEncoding.default)
            .responseJSON { response in
                if let data = response.result.value as? [[String:Any]]{
                    //        your json converted into Dictonary
                    
                    self.dataoftable.append(contentsOf: data)
     //               print("the total number of items are \(data.count)")
                    self.tableview.reloadData()
                }
        }
    }
}

