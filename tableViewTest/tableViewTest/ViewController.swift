import UIKit
import Alamofire
import  AlamofireImage


class SampleData {
    var albumId : Int
    var id : Int
    var title : String
    var url : String
    var thumbnailURL : String
    init(data:[String:Any] )
    {        id = data["id"] as? Int ?? -1
        albumId = data["albumId"] as? Int ?? -1
        title = data["title"] as? String ?? ""
        url = data["url"] as? String ?? ""
        thumbnailURL = data["thumbnailURL"] as? String ?? ""
        
    }
    
}

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{
    
    var dataClass = [SampleData]()
    
    var cellforreload = mycustomcell()
    var thumbnailurlforscreen : String = ""
    var start = 0
    var limit = 10
    
    var dataoftable : [[String: Any]] = [[String: Any]]()
    
    @IBOutlet weak var tableview: UITableView!
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataoftable.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! mycustomcell
        
        if dataoftable.count == 0 {
            print("no data")
        }
        else
        {
            cell.lbl.text = dataoftable[indexPath.row]["title"] as! String
            if let thumbnailUrl = dataoftable[indexPath.row]["thumbnailUrl"] as? String
            {
                Alamofire.request(thumbnailUrl).responseImage(completionHandler: { (response) in
                    print(response)
                    var thumbnailshape = response.result.value
                    thumbnailshape = thumbnailshape?.af_imageRoundedIntoCircle()
                    cell.img.image = thumbnailshape
                }
                )
            }
            
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      
        
        //    performSegue(withIdentifier: "segue", sender: self)
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "viewimageViewController") as? viewimageViewController
        self.navigationController?.pushViewController(vc!, animated: true)
        vc?.ttlv = dataoftable[indexPath.row]["title"] as! String
        
        vc?.idv = dataoftable[indexPath.row]["id"] as! Int
        
        vc?.albv = dataoftable[indexPath.row]["id"] as! Int
        
        if let url = dataoftable[indexPath.row]["url"] as? String
        {
            Alamofire.request(url).responseImage(completionHandler: { (response) in
                print(response)
                vc?.productimg.image = response.result.value
            }
            )
        }
        
        
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if(indexPath.row == dataoftable.count-1)
        {
            print(indexPath.row,"HEY THIS IS THE VALUE OF INDEX PATH")
            print(dataoftable.count,"HEY THIS IS THE VALUE OF dictionary count")
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

               //     print(response.value)
                    
                    for (index, keyValue) in self.dataoftable.enumerated() {
                        print("Dictionary key \(index) - Dictionary value \(keyValue)")
                    }
                
                    self.tableview.reloadData()
                }
        }
    }
}
