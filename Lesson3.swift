import Foundation

enum TypeOfCookies: Int{
	case cheap = 20
	case expensive = 30
}

protocol Manager{
	func payBill(amount: Int, office: Office)
	func eliminateLeak()
	func cleanOffice()
	func buyCookies(count: Int, office: Office)
	func readForeignLetters()
	func terroristAttack()
}

protocol Plumber{
	func eliminateLeak()
} 

protocol Cleaner{
	func clean()
}

protocol Translator{
	func translate()	
}

class CompanyPlumber: Plumber{
	func eliminateLeak(){
		print("Plumber has eliminated a leak")
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
	func eliminateLeak(){
		guard let plumber = plumber else{
			print("Can not resolve a proplem, cause Manager hasn't a Plumber")
			return
		}
		plumber.eliminateLeak()
	}
	func cleanOffice(){
		guard let cleaner = cleaner else{
			print("Can not resolve a proplem, cause Manager hasn't a Cleaner")
			return
		}
		cleaner.clean()
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
	func readForeignLetters(){
		guard let translator = translator else{
			print("Can not resolve a proplem, cause Manager hasn't a Translator")
			return
		}
		translator.translate()
	}
	func terroristAttack(){
		// to do smth
	}
}

class Office{
	var manager: Manager?
	var money = 1000	
	var cookies=0
	var bill=200
	
	init(manager: Manager?){
		self.manager = manager
	}
	
	func payBill(amount: Int){
		checkSolvableProblem()
		manager?.payBill(amount: amount, office: self) 
	}
	
	func eliminateLeak(){
		checkSolvableProblem()
		manager?.eliminateLeak()
	}
	
	func cleanOffice(){
		checkSolvableProblem()
		manager?.cleanOffice()
	}
	
	func buyCookies(count: Int){
		checkSolvableProblem()
		manager?.buyCookies(count: count, office: self)
	}
	
	func readForeignLetters(){
		checkSolvableProblem()
		manager?.readForeignLetters()
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