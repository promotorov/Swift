import Foundation
import UIKit

class MainView: UIView {
    var textFieldFirstName: UITextField = {
        var textField = UITextField()
        setTextFieldProperties(textField: textField)
        textField.textColor = UIColor.black
        textField.placeholder = "First Name"
        return textField
    }()
    
    var textFieldSecondName: UITextField = {
        var textField = UITextField()
        setTextFieldProperties(textField: textField)
        textField.textColor = UIColor.black
        textField.placeholder = "Second Name"
        return textField
    }()
    
    var textFieldDateOfBirth: CustomDateField = {
        var textField = CustomDateField()
        setTextFieldProperties(textField: textField)
        textField.textColor = UIColor.black
        textField.placeholder = "Date of Birthday"
        return textField
    }()
    
    var buttonAdd: UIButton = {
        var button = UIButton()
        button.setTitle("Add", for: .normal)
        button.backgroundColor = UIColor.brown
        return button
    }()
    
    var image: UIImageView = {
        var image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.backgroundColor = UIColor.red;
        return image
    }()
    
    var tableViewPersons = UITableView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(textFieldFirstName)
        addSubview(textFieldSecondName)
        addSubview(textFieldDateOfBirth)
        addSubview(buttonAdd)
        addSubview(tableViewPersons)
        addSubview(image)
    }
    
    override var frame: CGRect {
        didSet {
            textFieldFirstName.frame = CGRect(x: 20, y: 100, width: 150, height: 30)
            textFieldSecondName.frame = CGRect(x: 20, y: 150, width: 150, height: 30)
            textFieldDateOfBirth.frame = CGRect(x: 20, y: 200, width: 150, height: 30)
            buttonAdd.frame = CGRect(x: 20, y: 250, width: 100, height: 50)
            tableViewPersons.frame = CGRect(x: 20, y: 320, width: 300, height: 300)
            image.frame = CGRect(x:200, y: 100, width: 50, height: 50)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init has not been implemented")
    }
    
    private static func setTextFieldProperties(textField: UITextField) {
        textField.borderStyle = UITextBorderStyle.roundedRect
        textField.textAlignment = NSTextAlignment.center
    }
}
