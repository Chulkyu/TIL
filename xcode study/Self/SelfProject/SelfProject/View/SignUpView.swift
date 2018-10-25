
import UIKit

protocol SignUpViewDelegate {
    func confirm(_ userData: SignUpView)
    func search(_ userData: SignUpView)
}

class SignUpView: UIView {
    
    var delegate: SignUpViewDelegate?
    
    // ========= Textfield ==========
    @IBOutlet weak var signUpViewLabel: UILabel!
    
    @IBOutlet weak var signUpViewID: UITextField!
    
    @IBOutlet weak var signUpViewPassword: UITextField!
    
    @IBOutlet weak var signUpViewCheckPassword: UITextField!
    
    @IBOutlet weak var signUpViewName: UITextField!
    
    @IBOutlet weak var signUpViewBirth: UITextField!
    
    @IBOutlet weak var signUpViewAddress: UITextField!
    // ====================================
    
    // ==========  Button ==============
    
    // Save UserData to SQLite
    @IBAction func signUpViewConfirm(_ sender: UIButton) {
      self.delegate?.confirm(self)
        
    }
    
    // Load UserData from SQLite
    @IBAction func SignUpViewSearch(_ sender: UIButton) {
        self.delegate?.search(self)
    }
    
    
}
