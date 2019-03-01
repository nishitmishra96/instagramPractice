import UIKit
import FirebaseAuth
class LoginViewController: UIViewController{

    @IBOutlet weak var userNameTXT: INTextfield!
    @IBOutlet weak var passWordTXT: INTextfield!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var label: UILabel!
    override func viewDidLoad() {
        userNameTXT.placeholder = "Username"
        passWordTXT.placeholder = "Password"
        loginButton.layer.borderWidth = 1
        loginButton.layer.borderColor = UIColor.white.cgColor
        loginButton.layer.cornerRadius = 5
        loginButton.setTitle("Login", for: .normal)
        loginButton.alpha = 0.2
        label.font = UIFont(name: label.font.fontName, size: 12)
    }
    
    @IBAction func bottonPressed(_ sender: UIButton) {
//        Auth.auth().createUser(withEmail: "nstmishra13@hotmail.com",password: "jsjsjs") { (result, error) in
//        print(result)
//
        var user =  userNameTXT.text!
        print("Hey this is the username \(user)")
      
        Auth.auth().signIn(withEmail: userNameTXT.text!, password: passWordTXT.text!) { (result, error) in
            print(result)

}
}
}


