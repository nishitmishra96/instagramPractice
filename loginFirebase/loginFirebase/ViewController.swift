import UIKit
import FirebaseAuth
class ViewController: UIViewController {
    
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBAction func buttonpressed(_ sender: UIButton) {
        
        Auth.auth().createUser(withEmail: email.text!,password: password.text!) { (result, error) in
                    print(result)
    }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}
