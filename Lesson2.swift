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
            if index==0 || index==1{
                number=1
            }
            else{
                let last = seq[index-1]
                let moreLast = seq[index-2]
                number = last + moreLast
            }
            seq.append(number)
        }
        return seq
    }
}

class EvenSequance: BaseSequence{
    override func createSequance(countElements: Int)  -> [Int]?{
        let range = 0..<countElements
        sequence=range.map{$0 * 2}
        return sequence
    }
}

class SequenceHandler{
    private(set) var sequance: BaseSequence?
    
    init(sequance: BaseSequence?){
        self.sequance=sequance
    }
    func printSequence(printType: PrintType){
        switch printType{
        case .simple:
            for number in (sequance?.sequence)!{
                print(number)
            }
        case .hard:
            for (index, number) in (sequance?.sequence?.enumerated())!{
                print("\(index): \(number)")
            }
        }
    }
}

func printSeq(sequence: [Int]?){
	guard (sequence?.count)! > 0 else{
		print("array is Empty")
		return
	}
	guard sequence != nil else{
		print("array is Null")
		return
	} 
	let joinedString = sequence?.map{String($0)}.joined(separator: ", ")
	print(joinedString!)
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