import Foundation

protocol Manager{
	func payBill()
	func eliminateLeak()
	func cleanOffice()
	func buyCookies()
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
	
	func payBill(){
		// can do self
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
	func buyCookies(){
		// can do self
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
	
	init(manager: Manager?){
		self.manager = manager
	}
	
	func payBill(){
		checkSolvableProblem()
		manager?.payBill() 
	}
	
	func eliminateLeak(){
		checkSolvableProblem()
		manager?.eliminateLeak()
	}
	
	func cleanOffice(){
		checkSolvableProblem()
		manager?.cleanOffice()
	}
	
	func buyCookies(){
		checkSolvableProblem()
		manager?.buyCookies()
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