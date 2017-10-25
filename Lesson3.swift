import Foundation

enum TypeOfCookies: Int{
	case cheap = 20
	case expensive = 30
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
	func eliminateLeak(office: Office)
} 

protocol Cleaner{
	func clean(office: Office)
}

protocol Translator{
	func translate(office: Office)	
}

class CompanyPlumber: Plumber{
	func eliminateLeak(office: Office){
		office.isLeak = false
		print("Plumber has eliminated a leak")
	}
}

class CompanyCleaner: Cleaner{
	func clean(office: Office){
		office.isDirty = false
		print("Cleaner has cleaned")
	}
}

class CompanyTranslator: Translator{
	func translate(office: Office){
		office.isForeignLetters = false
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
		guard office.isLeak else{
			print("There is no a leak")
			return
		}
		guard let plumber = plumber else{
			print("Can not resolve a proplem, cause Manager hasn't a Plumber")
			return
		}
		plumber.eliminateLeak(office: office)
	}
	func cleanOffice(office: Office){
		guard office.isDirty else{
			print("The office is clean")
			return
		}
		guard let cleaner = cleaner else{
			print("Can not resolve a proplem, cause Manager hasn't a Cleaner")
			return
		}
		cleaner.clean(office: office)
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
		guard let translator = translator else{
			print("Can not resolve a proplem, cause Manager hasn't a Translator")
			return
		}
		translator.translate(office: office)
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
	var isLeak = false
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
print(office.isLeak)
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
print(office.isLeak)
print(office.isDirty)
print(office.isForeignLetters)