import Foundation
enum PrintType{
    case simple
    case hard
}

protocol Sequence{
    func createSequance(countElements: Int) -> [Int]?
}

class BaseSequence: Sequence{
    private var count: Int;
    init(){
        count = 10;
    }
    init(count: Int){
        self.count = count
    }
    lazy var sequence: [Int]? = {
        return self.createSequance(countElements: self.count)
    }()
    func createSequance(countElements: Int) -> [Int]?{ return  nil}
}

class FibonacciSequance: BaseSequence{
    override func createSequance(countElements: Int) -> [Int]?{
        var seq: [Int] = []
        for index in 0..<countElements{
            var number: Int
            if index >= 2{
                let last = seq[index-1]
                let moreLast = seq[index-2]
                number = last + moreLast
            }
            else{
                number = 1
            }
            seq.append(number)
        }
        return seq
    }
}

class EvenSequance: BaseSequence{
    override func createSequance(countElements: Int)  -> [Int]?{
        return (0..<countElements).map{$0*2}
    }
}

class SequenceHandler{
    private(set) var sequance: BaseSequence?
    
    init(sequance: BaseSequence?){
        self.sequance=sequance
    }
    func printSequence(printType: PrintType){
		guard let sequence = sequance?.sequence else{
			print("array is Null")
			return
		} 
		guard sequence.count > 0 else{
			print("array is Empty")
			return
		}
        switch printType{
        case .simple:
            for number in sequence{
                print(number)
            }
        case .hard:
            for (index, number) in sequence.enumerated(){
                print("\(index): \(number)")
            }
        }
    }
}

func printSeq(sequence: [Int]?){
	guard let sequence = sequence else{
		print("array is Null")
		return
	} 
	guard sequence.count > 0 else{
		print("array is Empty")
		return
	}
	let joinedString = sequence.map{String($0)}.joined(separator: ", ")
	print(joinedString)
}

func createEvenInvertedSeq(sequence: [Int]?) -> [Int]?{
    return sequence?.filter{$0 % 2==0}.map{-$0}
}

var sequenceHandlerFinob = SequenceHandler(sequance: FibonacciSequance(count: 10))
var sequenceHandlerEven = SequenceHandler(sequance: EvenSequance(count: 10))
sequenceHandlerFinob.printSequence(printType: PrintType.hard)
sequenceHandlerEven.printSequence(printType: PrintType.hard)
var fibSequence = createEvenInvertedSeq(sequence: sequenceHandlerFinob.sequance?.sequence)
var evenSequence = createEvenInvertedSeq(sequence: sequenceHandlerEven.sequance?.sequence)
printSeq(sequence: fibSequence)
printSeq(sequence: evenSequence)

