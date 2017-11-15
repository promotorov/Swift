import Foundation
import UIKit

class UserInfoView: UIView {
    var labelFirstName: UILabel = {
        var label = UILabel()
        return label
    }()
    
    var labelSecondName: UILabel = {
        var label = UILabel()
        return label
    }()
    
    var labelAge: UILabel = {
        var label = UILabel()
        return label
    }()
    
    var imageViewUser: UIImageView = {
        var image = UIImageView()
        image.backgroundColor = UIColor.red
        return image
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(labelFirstName)
        addSubview(labelSecondName)
        addSubview(labelAge)
        addSubview(imageViewUser)
    }
    
    override var frame: CGRect {
        didSet {
            labelFirstName.frame = CGRect(x: 20, y: 100, width: 250, height: 30)
            labelSecondName.frame = CGRect(x: 20, y: 150, width: 250, height: 30)
            labelAge.frame = CGRect(x: 20, y: 200, width: 250, height: 30)
            imageViewUser.frame = CGRect(x: 20, y: 300, width: 100, height: 100)
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init has not been implemented")
    }
}
