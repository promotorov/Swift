import Foundation

enum TypeOfCookies: Int{
	case cheap = 20
	case expensive = 30
}

enum TypeOfLeaks{
	case changeGasket
	case changeTrumpet
}

protocol Manager{
	func payBill(amount: Int)
	func eliminateLeak()
	func cleanOffice()
	func buyCookies(count: Int)
	func readForeignLetters()
	func terroristAttack()
}

protocol Plumber{
	func eliminateLeak(leak: Leak)
} 

protocol Cleaner{
	func clean()
}

protocol Translator{
	func translate()	
}

class Leak{
	var type: TypeOfLeaks
	var isActive = true
	
	init(type: TypeOfLeaks){
		self.type = type
	}	
	func fixLeak(){
		self.isActive = false
	}
}

class CompanyPlumber: Plumber{
	func eliminateLeak(leak: Leak){
		var result = "Plumber has eliminated leak of type: "
		switch(leak.type){
			case .changeGasket:
				result += "changeGasket"
			case .changeTrumpet:
				result += "changeTrumpet"
		}
		leak.fixLeak()
		print(result)
	}
}

class CompanyCleaner: Cleaner{
	func clean(){
		print("Cleaner has cleaned")
	}
}

class CompanyTranslator: Translator{
	func translate(){
		print("Translator has translated")
	}
}

class OfficeManager: Manager{
	var plumber: Plumber?
	var cleaner: Cleaner?
	var translator: Translator?
	var office: Office? {
		didSet{
			hasJob = (office != nil) ? true : false
		}
	}
	private(set) var hasJob: Bool?
	
	init(plumber: Plumber?, cleaner: Cleaner?, translator: Translator?, office: Office?){
		self.plumber = plumber
		self.translator = translator
		self.cleaner = cleaner
		self.office = office
		hasJob = (office != nil) ? true : false
	}
	func payBill(amount: Int){
		guard let office = office else{
			messageNoJob()
			return
		}
		guard office.money >= amount else{
			print("Can not pay bill cause is not enough money")
			return
		}
		office.money -= amount
		office.bill -= amount
		print("Sucsessfully paid the bill.")
	}
	func eliminateLeak(){
		guard let office = office else{
			messageNoJob()
			return
		}
		let leaks = office.leaks
		if  leaks.isEmpty{
			print("There is no a leak")
			return
		}
		guard let plumber = plumber else{
			print("Can not resolve a proplem, cause Manager hasn't a Plumber")
			return
		}
		leaks.filter{$0.isActive==true}.map{plumber.eliminateLeak(leak: $0)}
		office.leaks = leaks.filter{$0.isActive == true}
	}
	func cleanOffice(){
		guard let office = office else{
			messageNoJob()
			return
		}
		guard office.isDirty else{
			print("The office is clean")
			return
		}
		guard cleaner != nil else{
			print("Can not resolve a proplem, cause Manager hasn't a Cleaner")
			return
		}
		cleaner?.clean()
	}
	func buyCookies(count: Int){
		guard let office = office else{
			messageNoJob()
			return
		}
		let typeOfCookies: Int = TypeOfCookies.cheap.rawValue
		let sum = count * typeOfCookies
		guard office.money >= sum else{
			print("Can not buy cookies cause is not enough money")
			return
		}
		office.money -= sum
		office.cookies += count
		print("Sucsessfully bought the cookies.")
	}
	func readForeignLetters(){
		guard let office = office else{
			messageNoJob()
			return
		}
		guard office.isForeignLetters else{
			print("There is no foreign letters")
			return
		}
		guard translator != nil else{
			print("Can not resolve a proplem, cause Manager hasn't a Translator")
			return
		}
		translator?.translate()
	}
	func terroristAttack(){
		print("Dont know what can i do")
	}
	private func messageNoJob(){
		print("Manager hasn't a job")
	}
}

class Office{
	var manager: Manager?
	var money = 1000	
	var cookies=0
	var bill=200
	var leaks: [Leak] = []
	var isDirty = true
	var isForeignLetters = true
} 
var office = Office()
var manager = OfficeManager(plumber: CompanyPlumber(), cleaner: CompanyCleaner(), translator: CompanyTranslator(), office: office)
var leak1=Leak(type: TypeOfLeaks.changeGasket)
var leak2=Leak(type: TypeOfLeaks.changeTrumpet)
office.leaks.append(leak1)
office.leaks.append(leak2)
manager.eliminateLeak()
manager.readForeignLetters()
manager.cleanOffice()
manager.buyCookies(count: 20)
manager.terroristAttack()
manager.payBill(amount: 100)