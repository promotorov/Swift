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
        guard let firstOperand = Double(mainView.textFieldFirstNumber.text!) else{
            mainView.labelResult.text = notNumberMessage
            return
        }
        guard let secondOperand = Double(mainView.textFieldSecondNumber.text!) else{
            mainView.labelResult.text = notNumberMessage
            return
        }
        changeViewsAfterCalculate(operation: "+", firstOperand: firstOperand, secondOperand: secondOperand)
    }
    
    @objc func handleButtonSub(){
        guard let firstOperand = Double(mainView.textFieldFirstNumber.text!) else{
            mainView.labelResult.text = notNumberMessage
            return
        }
        guard let secondOperand = Double(mainView.textFieldSecondNumber.text!) else{
            mainView.labelResult.text = notNumberMessage
            return
        }
        changeViewsAfterCalculate(operation: "-", firstOperand: firstOperand, secondOperand: secondOperand)
    }
    
    @objc func handleButtonMul(){
        guard let firstOperand = Double(mainView.textFieldFirstNumber.text!) else{
            mainView.labelResult.text = notNumberMessage
            return
        }
        guard let secondOperand = Double(mainView.textFieldSecondNumber.text!) else{
            mainView.labelResult.text = notNumberMessage
            return
        }
        changeViewsAfterCalculate(operation: "*", firstOperand: firstOperand, secondOperand: secondOperand)
    }
    
    @objc func handleButtonDiv(){
        guard let firstOperand = Double(mainView.textFieldFirstNumber.text!) else{
            mainView.labelResult.text = notNumberMessage
            return
        }
        guard let secondOperand = Double(mainView.textFieldSecondNumber.text!) else{
            mainView.labelResult.text = notNumberMessage
            return
        }
        changeViewsAfterCalculate(operation: "/", firstOperand: firstOperand, secondOperand: secondOperand)
    }
    private func changeViewsAfterCalculate(operation: String, firstOperand: Double, secondOperand: Double){
        var result: Double = 0
        switch operation {
        case "+":
            result = firstOperand + secondOperand
        case "-":
            result = firstOperand - secondOperand
        case "/":
            result = firstOperand / secondOperand
        case "*":
            result = firstOperand * secondOperand
        default:
            mainView.labelResult.text = wrongOperationMessage
            return
        }
        result = round(result * 1000) / 1000
        mainView.labelResult.text = "\(firstOperand) \(operation) \(secondOperand) = \(result)"
        mainView.textFieldSecondNumber.text = ""
        mainView.textFieldFirstNumber.text = "\(result)"
    }
}
