import Foundation
import UIKit

class UserInfoViewController: UIViewController {
    var firstName = ""
    var secondName = ""
    var age = 0
    var imgUrl = ""
    
    var userInfoView: UserInfoView{
        get{
            return view as! UserInfoView
        }
    }
    
    override func loadView() {
        view = UserInfoView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "UserInfo"
        userInfoView.labelFirstName.text = firstName
        userInfoView.labelSecondName.text = secondName
        userInfoView.labelAge.text = "\(age)"
        userInfoView.imageViewUser.image = UIImage(contentsOfFile: imgUrl)
    }
}
