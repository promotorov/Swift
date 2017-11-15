import Foundation
import UIKit

class UserInfoViewController: UIViewController {
    var firstName: String = ""
    var secondName: String = ""
    var age: Int = 0
    var imgUrl: String = ""
    
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
        print(age)
        userInfoView.labelAge.text = "\(age)"
        userInfoView.imageViewUser.image = UIImage(contentsOfFile: imgUrl)
    }
}
