import UIKit

protocol DismissKeyboardOnOutsideTap {
    var backgroundView: UIView! { get }
    func configureToDismissKeyboard()
    func hideKeyboard()
}

extension DismissKeyboardOnOutsideTap {
    func configureToDismissKeyboard() {
        if let this = self as? AnyObject {
            let tapGesture = UITapGestureRecognizer(target: this, action: Selector("hideKeyboard"))
            tapGesture.cancelsTouchesInView = false
            backgroundView.addGestureRecognizer(tapGesture)
        }
        
    }
    
    func hideKeyboard() {
        backgroundView.endEditing(true)
    }
}