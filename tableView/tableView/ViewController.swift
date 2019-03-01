import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 12
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "INSCELL") as! myCell
        cell.myLabel.text = "\(indexPath.row)"
        cell.testText.text = "hey"
        cell.contentView.backgroundColor = UIColor.randomColor()
        return cell
    }
    

    @IBOutlet weak var nishitTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        nishitTableView.register(UINib(nibName: "myCell", bundle: nil), forCellReuseIdentifier: "INSCELL")
        nishitTableView.delegate = self
        nishitTableView.dataSource = self
    }
}
extension UIColor {
    
    class func randomColor(randomAlpha randomApha:Bool = false)->UIColor{
        
        let redValue = CGFloat(arc4random_uniform(255)) / 255.0;
        let greenValue = CGFloat(arc4random_uniform(255)) / 255.0;
        let blueValue = CGFloat(arc4random_uniform(255)) / 255.0;
        let alphaValue = randomApha ? CGFloat(arc4random_uniform(255)) / 255.0 : 1;
        
        return UIColor(red: redValue, green: greenValue, blue: blueValue, alpha: alphaValue)
        
    }
}
