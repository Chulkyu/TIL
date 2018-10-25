import UIKit

class ListViewController: UITableViewController {
    // 테이블 뷰에 연결될 데이터를 저장하는 배열
    var list = [String]()
   
    @IBAction func add(_ sender: Any) {
    // 1. 알림창 객체의 인스턴스를 생성한다.
        let alert = UIAlertController(title: "목록 입력", message: "추가될 글을 작성해주세요", preferredStyle: .alert)
    
    // 2. 알림창에 입력폼을 추가한다.
        alert.addTextField() { (tf) in
            tf.placeholder = "내용을 입력하세요"
        }
        // 3. OK 버튼 객체를 생성한다 : 아직 알림창 객체에 버튼이 등록되지 않은 상태
        let ok = UIAlertAction(title: "OK", style: .default) { (_) in
        // 4. 알림창의 0번째 입력필드에 값이 있다면
            if let title = alert.textFields?[0].text {
        // 5. 배열에 입력된 값을 추가하고 테이블을 갱신
                self.list.append(title)
                self.tableView.reloadData()
            }
        }
        
        // 취소 버튼 객체를 생성한다 : 아직 알림창 객체에 버튼이 등록되지 않은 상태
        let cancel = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        
        // 6. 알림창 객체에 버튼 객체를 등록한다.
        alert.addAction(ok)
        alert.addAction(cancel)
        
        // 7. 알림창을 띄운다.
        self.present(alert, animated: false)
    
    }
    
    
}
