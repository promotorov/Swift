import Foundation
import UIKit

class MainView: UIView{
    var labelResult: UILabel = UILabel()
    var textFieldFirstNumber: UITextField = UITextField()
    var textFieldSecondNumber: UITextField = UITextField()
    var buttonAdd: UIButton = UIButton()
    var buttonSub: UIButton = UIButton()
    var buttonDiv: UIButton = UIButton()
    var buttonMul: UIButton = UIButton()
    
    override init(frame: CGRect){
        super.init(frame: frame)
        
        initTextFields()
        initButtons()
        initLabels()
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
    
    private func initTextFields(){
        textFieldFirstNumber.borderStyle = UITextBorderStyle.roundedRect
        textFieldFirstNumber.textColor = UIColor.black
        textFieldFirstNumber.textAlignment = NSTextAlignment.center
        
        textFieldSecondNumber.borderStyle = UITextBorderStyle.roundedRect
        textFieldSecondNumber.textAlignment = NSTextAlignment.center
        textFieldSecondNumber.textColor = UIColor.blue
        
        addSubview(textFieldFirstNumber)
        addSubview(textFieldSecondNumber)
    }
    
    private func initButtons(){
        buttonAdd.setTitle("+", for: .normal)
        buttonAdd.backgroundColor = UIColor.red
        
        buttonSub.setTitle("-", for: .normal)
        buttonSub.backgroundColor = UIColor.blue
        
        buttonDiv.setTitle("/", for: .normal)
        buttonDiv.backgroundColor = UIColor.black
        
        buttonMul.setTitle("*", for: .normal)
        buttonDiv.backgroundColor = UIColor.brown
        
        addSubview(buttonAdd)
        addSubview(buttonDiv)
        addSubview(buttonMul)
        addSubview(buttonSub)
    }
    
    private func initLabels(){
        labelResult.backgroundColor = UIColor.purple
        labelResult.textColor = UIColor.white
        
        addSubview(labelResult)
    }
}


