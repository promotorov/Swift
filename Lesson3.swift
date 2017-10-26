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
	func payBill(amount: Int, office: Office)
	func eliminateLeak(office: Office)
	func cleanOffice(office: Office)
	func buyCookies(count: Int, office: Office)
	func readForeignLetters(office: Office)
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
	var status = true
	
	init(type: TypeOfLeaks){
		self.type = type
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
		leak.status = false
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
	
	init(plumber: Plumber?, cleaner: Cleaner?, translator: Translator?){
		self.plumber = plumber
		self.translator = translator
		self.cleaner = cleaner
	}
	
	func payBill(amount: Int, office: Office){
		guard office.money >= amount else{
			print("Can not pay bill cause is not enough money")
			return
		}
		office.money -= amount
		office.bill -= amount
		print("Sucsessfully paid the bill.")
	}
	func eliminateLeak(office: Office){
		let leaks = office.leaks
		if  leaks.isEmpty{
			print("There is no a leak")
			return
		}
		guard let plumber = plumber else{
			print("Can not resolve a proplem, cause Manager hasn't a Plumber")
			return
		}
		leaks.map{plumber.eliminateLeak(leak: $0)}
		office.leaks = leaks.filter{$0.status == true}
	}
	func cleanOffice(office: Office){
		guard office.isDirty else{
			print("The office is clean")
			return
		}
		guard cleaner != nil else{
			print("Can not resolve a proplem, cause Manager hasn't a Cleaner")
			return
		}
	}
	func buyCookies(count: Int, office: Office){
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
	func readForeignLetters(office: Office){
		guard office.isForeignLetters else{
			print("There is no foreign letters")
			return
		}
		guard translator != nil else{
			print("Can not resolve a proplem, cause Manager hasn't a Translator")
			return
		}
	}
	func terroristAttack(){
		print("Dont know what can i do")
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
	
	
	init(manager: Manager?){
		self.manager = manager
	}
	
	func payBill(amount: Int){
		checkSolvableProblem()
		manager?.payBill(amount: amount, office: self) 
	}
	
	func eliminateLeak(){
		checkSolvableProblem()
		manager?.eliminateLeak(office: self)
	}
	
	func cleanOffice(){
		checkSolvableProblem()
		manager?.cleanOffice(office: self)
	}
	
	func buyCookies(count: Int){
		checkSolvableProblem()
		manager?.buyCookies(count: count, office: self)
	}
	
	func readForeignLetters(){
		checkSolvableProblem()
		manager?.readForeignLetters(office: self)
	}
	
	func terrorostAttack(){
		checkSolvableProblem()
		manager?.terroristAttack()
	}
	
	private func checkSolvableProblem(){
		guard manager == nil ? false : true else{
			print("Can not resolve a proplem, cause Office hasn't a Manager")
			return
		}
	}
} 
var manager = OfficeManager(plumber: CompanyPlumber(), cleaner: nil, translator: CompanyTranslator())
var office = Office(manager: manager)
var leak1=Leak(type: TypeOfLeaks.changeGasket)
var leak2=Leak(type: TypeOfLeaks.changeTrumpet)
office.leaks.append(leak1)
office.leaks.append(leak2)
print(office.isDirty)
print(office.isForeignLetters)
office.eliminateLeak()
office.cleanOffice()
office.readForeignLetters()
print(office.money)
print(office.bill)
office.payBill(amount: 100)
print(office.money)
print(office.bill)
print(office.cookies)
office.buyCookies(count: 20)
print(office.money)
print(office.cookies)
print(office.isDirty)
print(office.isForeignLetters)
office.eliminateLeak()
