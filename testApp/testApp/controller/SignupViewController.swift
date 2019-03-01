import UIKit
import FirebaseAuth
class SignupViewController: UIViewController {

    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var middleName: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var alternateemail: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var phoneNumber: UITextField!
    @IBOutlet weak var confirmPassword: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var homeTown: UITextField!
    @IBOutlet weak var motherName: UITextField!
    @IBOutlet weak var fatherName: UITextField!
    @IBOutlet weak var country: UITextField!
    @IBOutlet weak var Gender: UITextField!
    @IBOutlet weak var dateOfBirth: UITextField!
    @IBOutlet weak var userName: UITextField!
    
    @IBAction func buttonPressed(_ sender: Any) {
//        Auth.auth().createUser(withEmail: "himanshusingh@hotmail.com", password: "himanshu") { (result, error) in
//            print(result)
//        }
//        Auth.auth().signIn(withEmail: "himanshdusingh@hotmail.com", password: "hsimanshu") { (result, error) in
//            print(result)
//        }
        print("ins a")
        print("ins b")
        delayed { (myNum) -> (Void) in
            print("ins c with my num",myNum)
        }
        print("ins d")
       
        print("ins xxx")
       
        
    }
    func delayed(handler: @escaping ( (Int)->(Void) )  ){
        DispatchQueue.main.async {
            
            handler(788)
        }
       
    }
}
