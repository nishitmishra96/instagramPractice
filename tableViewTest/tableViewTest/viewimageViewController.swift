import UIKit

class viewimageViewController: UIViewController {

    @IBOutlet weak var productimg: UIImageView!
    @IBOutlet weak var albumIdkey: UILabel!
    @IBOutlet weak var idKey: UILabel!
    @IBOutlet weak var titleKey: UILabel!
    @IBOutlet weak var albumIdValue: UILabel!
    @IBOutlet weak var idValue: UILabel!
    @IBOutlet weak var titleValue: UILabel!
    
    var viewController = ViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    func loaddata(indexPath: IndexPath) -> Void
    {
                albumIdkey.text = viewController.dataoftable[indexPath.row]["title"] as? String
    }
}
