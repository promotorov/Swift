import Foundation
import UIKit

func createNewPerson(firstName:String, secondName:String, dateOfBirth: CustomDateField) {
    let year = dateOfBirth.yearFromValue()
    let calendar = Calendar.current
    let currentDate = Date()
    let currentYear = calendar.component(.year, from: currentDate)
    Person.addNewPerson(person: Person(firstName: firstName,  secondName: secondName, age: currentYear - year))
}

func readPerson(cell: UITableViewCell, path: IndexPath) {
    print("call")
    let userCell = cell as! CustomTableViewCell
    let user: Person = Person.persons[path.row]
    userCell.firstNameLabel.text = user.firstName
    userCell.secondNameLabel.text = user.secondName
    userCell.ageLabel.text = "\(user.age)"
    
    let documentsPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
    let personUrl = "/\(path.row).png"
    let url = URL(fileURLWithPath: documentsPath + personUrl)
    print(url)

    userCell.userImageView.image = UIImage(contentsOfFile: url.path)
    print("call2")
}

func loadImageFortable(){
    
}
