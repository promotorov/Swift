import Foundation

extension Double{
    /**
     Округление числа
     accuracy - число знаков после запятой
     */
    func roundNumber(accuracy: Double) -> Double{
        let num = pow(10, accuracy)
        return (self * num).rounded() / num
    }
}








