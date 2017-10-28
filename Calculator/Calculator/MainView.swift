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
        textFieldFirstNumber.borderStyle = UITextBorderStyle.roundedRect
        textFieldSecondNumber.borderStyle = UITextBorderStyle.roundedRect
        textFieldFirstNumber.textColor = UIColor.black
        textFieldFirstNumber.textAlignment = NSTextAlignment.center
        textFieldSecondNumber.textAlignment = NSTextAlignment.center
        textFieldSecondNumber.textColor = UIColor.blue
        buttonAdd.setTitle("+", for: .normal)
        buttonSub.setTitle("-", for: .normal)
        buttonDiv.setTitle("/", for: .normal)
        buttonMul.setTitle("*", for: .normal)
        buttonAdd.backgroundColor = UIColor.red
        buttonSub.backgroundColor = UIColor.blue
        buttonDiv.backgroundColor = UIColor.black
        buttonMul.backgroundColor = UIColor.brown
        labelResult.backgroundColor = UIColor.purple
        labelResult.textColor = UIColor.white
        addSubview(textFieldFirstNumber)
        addSubview(textFieldSecondNumber)
        addSubview(buttonAdd)
        addSubview(buttonDiv)
        addSubview(buttonMul)
        addSubview(buttonSub)
        addSubview(labelResult)
    }
    
    override var frame: CGRect{
        didSet{
            textFieldFirstNumber.frame = CGRect(x: 20, y: 50, width: 250, height: 30)
            textFieldSecondNumber.frame = CGRect(x: 20, y: 100, width: 250, height: 30)
            buttonSub.frame = CGRect(x: 20, y: 150, width: 100, height: 30)
            buttonAdd.frame = CGRect(x: 140, y: 150, width: 100, height: 30)
            buttonMul.frame = CGRect(x: 20, y: 190, width: 100, height: 30)
            buttonDiv.frame = CGRect(x: 140, y: 190, width: 100, height: 30)
            labelResult.frame = CGRect(x: 20, y: 230, width: 250, height: 30)
    
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init has not been implemented")
    }
}

class MainViewController: UIViewController{
    
    var mainView: MainView{
        get{
            return view as! MainView
        }
    }
    
    override func loadView() {
        view = MainView()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.green
        mainView.labelResult.text = "nothing yet"
        mainView.buttonAdd.addTarget(self, action: #selector(handleButtonAdd), for: .touchUpInside)
    }
    @objc func handleButtonAdd(){
        guard let firstOperand = Int(mainView.textFieldFirstNumber.text!) else{
            mainView.labelResult.text = "Value in textFields isn't a number"
            return
        }
        guard let secondOperand = Int(mainView.textFieldSecondNumber.text!) else{
            mainView.labelResult.text = "Value in textFields isn't a number"
            return
        }
        let result = firstOperand + secondOperand
        mainView.labelResult.text = "\(firstOperand) + \(secondOperand) = \(result)"
        mainView.textFieldSecondNumber.text = ""
        mainView.textFieldFirstNumber.text = "\(result)"
    }
    
    
}
