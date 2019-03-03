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
    
    func throwError() throws{
        throw NSError(domain: "himanshu", code: 1, userInfo: nil)
    }
    @IBOutlet weak var nishitTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        do{
            try throwError()
        }catch let sachinkaerror{
            let er = NishitKaError(error: sachinkaerror)
            print(er.NMlocalizedDescription)
        }
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
class NishitKaError:NSError{
   var NMlocalizedDescription:String{
        get{
          return "carterzone " + self.localizedDescription
        }
    }
    override init(domain: String, code: Int, userInfo: [String:Any]?) {
         print("HEY i'm initializer from initializer containing domain")
        super.init(domain: domain, code: code, userInfo: userInfo)
    }
    convenience init(error:Error) {
        let error1 = error as NSError
        print("HEY i'm a initializer from init Error")
        self.init(domain: error1.domain, code: error1.code, userInfo: error1.userInfo)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
