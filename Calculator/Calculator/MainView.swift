import Foundation
import UIKit

class MainView: UIView{
    var labelResult: UILabel = {
        var label = UILabel()
        label.backgroundColor = UIColor.purple
        label.textColor = UIColor.white
        return label
    }()
    var textFieldFirstNumber: UITextField = {
        var textField = UITextField()
        setTextFieldProperties(textField: textField)
        textField.textColor = UIColor.black
        
        return textField
    }()
    var textFieldSecondNumber: UITextField = {
        var textField = UITextField()
        setTextFieldProperties(textField: textField)
        textField.textColor = UIColor.blue
        return textField
    }()
    var buttonAdd: UIButton = {
        var button = UIButton()
        button.setTitle("+", for: .normal)
        button.backgroundColor = UIColor.red
        return button
    }()
 
    var buttonSub: UIButton = {
        var button = UIButton()
        button.setTitle("-", for: .normal)
        button.backgroundColor = UIColor.brown
        return button
    }()
    
    var buttonDiv: UIButton = {
        var button = UIButton()
        button.setTitle("/", for: .normal)
        button.backgroundColor = UIColor.black
        return button
    }()
    
    var buttonMul: UIButton = {
        var button = UIButton()
        button.setTitle("*", for: .normal)
        button.backgroundColor = UIColor.blue
        return button
    }()
    override init(frame: CGRect){
        super.init(frame: frame)
        addSubview(labelResult)
        addSubview(textFieldSecondNumber)
        addSubview(textFieldFirstNumber)
        addSubview(buttonAdd)
        addSubview(buttonDiv)
        addSubview(buttonSub)
        addSubview(buttonMul)
    }
    
    override var frame: CGRect{
        didSet{
            textFieldFirstNumber.frame = CGRect(x: 20, y: 50, width: 250, height: 30)
            textFieldSecondNumber.frame = CGRect(x: 20, y: 100, width: 250, height: 30)
            buttonSub.frame = CGRect(x: 20, y: 150, width: 100, height: 30)
            buttonAdd.frame = CGRect(x: 140, y: 150, width: 100, height: 30)
            buttonMul.frame = CGRect(x: 20, y: 190, width: 100, height: 30)
            buttonDiv.frame = CGRect(x: 140, y: 190, width: 100, height: 30)
            labelResult.frame = CGRect(x: 20, y: 230, width: 290, height: 30)
    
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init has not been implemented")
    }
    
    private static func setTextFieldProperties(textField: UITextField){
        textField.borderStyle = UITextBorderStyle.roundedRect
        textField.textAlignment = NSTextAlignment.center
    }
}


