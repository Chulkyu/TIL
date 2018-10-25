
import UIKit

extension Notification.Name {
    static let sendNotification = Notification.Name(rawValue: "SEND_NOTIFICATION")
}

class SecondViewController: UIViewController {
    
    @IBAction func notiButton(_ sender: Any) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(didReceiveNotification(_:)), name: Notification.Name.sendNotification, object: nil)
    }
    
    @objc func didReceiveNotification(_ sender: Notification) {
        
    }
    
}
