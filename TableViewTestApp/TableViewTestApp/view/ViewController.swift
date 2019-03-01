import UIKit

struct CellData
{
    let image : UIImage?
    let message : String?
}
class TableViewController: UITableViewController {

    var data = [CellData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        data = [CellData.init(image : UIImage(imageLiteralResourceName: "images"), message: "iOS 12 is image is shown above"),CellData.init(image : UIImage(imageLiteralResourceName: "images"), message: "iOS 12 is image is shown above"),CellData.init(image : UIImage(imageLiteralResourceName: "images"), message: "iOS 12 is image is shown above"),CellData.init(image : UIImage(imageLiteralResourceName: "images"), message: "iOS 12 is image is shown above"),CellData.init(image : UIImage(imageLiteralResourceName: "images"), message: "iOS 12 is image is shown above")]
        self.tableView.register(CustomCell.self, forCellReuseIdentifier: "custom")
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = self.tableView.dequeueReusableCell(withIdentifier : "custom") as! CustomCell
        cell.mainImage = data[indexPath.row].image
        cell.message = data[indexPath.row].message
        
        return cell
        
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
}
