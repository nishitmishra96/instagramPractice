
import UIKit

class INTextfield: UITextField {
    override var placeholder: String?{
        didSet{
            self.attributedPlaceholder = NSAttributedString(string: placeholder ?? "", attributes: [NSAttributedString.Key.foregroundColor : UIColor.white])
        }
    }
}
