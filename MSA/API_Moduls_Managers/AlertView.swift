import Foundation
import UIKit

class AlertDialog {
    
    class func showAlert(_ title: String, message: String, viewController: UIViewController, dismissed: (() -> Void)? = nil) {
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let dismissAction = UIAlertAction(title: "Ok", style: .cancel) { (action) in
            dismissed?()
        }
        alertController.addAction(dismissAction)
        
        viewController.present(alertController, animated: true, completion: nil)
        
    }
    
}
