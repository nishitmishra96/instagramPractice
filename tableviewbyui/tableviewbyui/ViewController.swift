

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    @IBOutlet weak var tbView: UITableView!
    let people = [("Nishit","Noida"),("Sachin","Bhuvneshwae"),("Vaibhav","Noida")]
    
    let videos = [("Shreya","36 videos"),("Siddharth","74 videos"),("chakshu","56 videos"),("Rahul","67 videos")]
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0
        {
        return people.count
        }
        else {
            return videos.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        cell.contentView.backgroundColor = UIColor.randomColor()
        if indexPath.section == 0
        {
            var (personName,_) = people[indexPath.row]
            cell.textLabel?.text = personName
        }
        else {
            var (singerName,_) = videos[indexPath.row]
            cell.textLabel?.text = singerName
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String?
    {
        if section == 0
        {
            return "people"
        }
        else
        {
            return "videos"
        }
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You tapped cell number \(indexPath.row).")
        tableView.backgroundColor = UIColor.randomColor()
        
        
        print(indexPath)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        tbView.delegate = self
        tbView.dataSource = self
        // Do any additional setup after loading the view, typically from a nib.
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
