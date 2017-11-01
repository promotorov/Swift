import  Foundation
import UIKit

class MainViewController: UIViewController{
    
    private let notNumberMessage = "Value in TextFields isn't a number"
    private let wrongOperationMessage = "An operation is wrong"
    
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
        mainView.buttonSub.addTarget(self, action: #selector(handleButtonSub), for: .touchUpInside)
        mainView.buttonMul.addTarget(self, action: #selector(handleButtonMul), for: .touchUpInside)
        mainView.buttonDiv.addTarget(self, action: #selector(handleButtonDiv), for: .touchUpInside)
    }
    @objc func handleButtonAdd(){
        checkNumbers(textFieldFirst: mainView.textFieldFirstNumber, textFieldSecond: mainView.textFieldSecondNumber, operations: Operations.add)
    }
    
    @objc func handleButtonSub(){
        checkNumbers(textFieldFirst: mainView.textFieldFirstNumber, textFieldSecond: mainView.textFieldSecondNumber, operations: Operations.sub)
    }
    
    @objc func handleButtonMul(){
        checkNumbers(textFieldFirst: mainView.textFieldFirstNumber, textFieldSecond: mainView.textFieldSecondNumber, operations: Operations.mul)
    }
    
    @objc func handleButtonDiv(){
        checkNumbers(textFieldFirst: mainView.textFieldFirstNumber, textFieldSecond: mainView.textFieldSecondNumber, operations: Operations.div)
    }
    
    private func checkNumbers(textFieldFirst: UITextField, textFieldSecond: UITextField, operations: Operations){
        guard let firstOperand = Double(mainView.textFieldFirstNumber.text!) else{
            mainView.labelResult.text = notNumberMessage
            return
        }
        guard let secondOperand = Double(mainView.textFieldSecondNumber.text!) else{
            mainView.labelResult.text = notNumberMessage
            return
        }
        changeViewsAfterCalculate(operation: operations, firstOperand: firstOperand, secondOperand: secondOperand)
    }
    
    private func changeViewsAfterCalculate(operation: Operations, firstOperand: Double, secondOperand: Double){
        var result: Double
        var action: String
        switch operation {
        case .add:
            result = firstOperand + secondOperand
        case .sub:
            result = firstOperand - secondOperand
        case .div:
            result = firstOperand / secondOperand
        case .mul:
            result = firstOperand * secondOperand
        default:
            mainView.labelResult.text = wrongOperationMessage
            return
        }
        action = operation.rawValue
        result = result.roundNumber(accuracy: 3)
        mainView.labelResult.text = "\(firstOperand) \(action) \(secondOperand) = \(result)"
        mainView.textFieldSecondNumber.text = ""
        mainView.textFieldFirstNumber.text = "\(result)"
    }
}

enum Operations: String{
    case sub = "-"
    case add = "+"
    case div = "/"
    case mul = "*"
}
