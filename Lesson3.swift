import Foundation

protocol Manager{
	func payBill()
	func eliminateLeak()
	func cleanOffice()
	func buyCookies()
	func readForeignLetters()
	func terrorostAttack()
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
	func terrorostAttack(){
		// to do smth
	}
}

class Office{
	var manager: Manager?
	
	init(manager: Manager){
		self.manager = manager
	}
	
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
	
	func terrorostAttack(){
		// to do smth
	}

} 