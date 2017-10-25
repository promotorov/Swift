import Foundation

protocol Manager{
	func payBill()
	func eliminateLeak()
	func cleanOffice()
	func buyCookies()
	func readForeignLetters()
	func terroristAttack()
}

class OfficeManager: Manager{
	func payBill(){
		// to do smth
	}
	func eliminateLeak(){
		// to do smth
	}
	func cleanOffice(){
		// to do smth
	}
	func buyCookies(){
		// to do smth
	}
	func readForeignLetters(){
		// to do smth
	}
	func terroristAttack(){
		// to do smth
	}
}

class Office{
	var manager: Manager?
	
	init(manager: Manager){
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
		guard manager==nil ? false : true else{
			print("Can not resolve a proplem, cause Office hasn't a Manager")
			return
		}
	}
} 

var manager = OfficeManager()
var office = Office(manager: manager)
office.eliminateLeak()