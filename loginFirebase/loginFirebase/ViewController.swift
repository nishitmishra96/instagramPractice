import UIKit
import FirebaseAuth
class ViewController: UIViewController {

    @IBOutlet weak var password: UIStackView!
    @IBOutlet weak var username: UIStackView!

    @IBAction func buttonpressed(_ sender: UIButton) {

        Auth.auth().createUser(withEmail: "nsHtmishra13@hotmail.com",password: "jsjsjs") { (result, error) in
            print(result)
    }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("ajhsdkjsdvjsahkdvbcxnzkxcvjhnzjcvxhjxkjlchbsnakdjhigbcanljdohfighvbckaljdohuwfeibkscnljdahfoekbdacsljdhfkbsdcnljdshakbcnzmsldjhakbcnsldkhbvcnsldhvbj cnlshabcjvxzc xlhsvdjbkcjsldahuifgyhbcksoihusdibcksahDISGCBHK")
        
    }
}
