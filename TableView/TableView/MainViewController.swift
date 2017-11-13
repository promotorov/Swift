import UIKit

class MainViewController: UIViewController {
    
    var reuseIdentifier = "person"
    
    var mainView: MainView{
        get{
            return view as! MainView
        }
    }
    override func loadView() {
        view = MainView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "UserTable"
        mainView.tableViewPersons.dataSource = self
        mainView.tableViewPersons.delegate = self
        mainView.tableViewPersons.register(CustomTableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
        mainView.buttonAdd.addTarget(self, action: #selector(handleButtonAddPerson), for: .touchUpInside)
        mainView.textFieldDateOfBirth.setControllers()
        Person.desirializePersons()
    }
    
    @objc func handleButtonAddPerson(){
        let firstName = mainView.textFieldFirstName.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let secondName = mainView.textFieldSecondName.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let date = mainView.textFieldDateOfBirth.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let isCorrectDate = mainView.textFieldDateOfBirth.isCorrect
        if secondName.isEmpty || date.isEmpty || !isCorrectDate == true {
            let c = UIAlertController(title: "ERROR", message: "Form is incorrect", preferredStyle: .alert)
            c.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(c, animated: true, completion: nil)
            return
        }
    
        mainView.tableViewPersons.beginUpdates()
        createNewPerson(firstName: firstName, secondName: secondName, dateOfBirth: mainView.textFieldDateOfBirth)
        let indexPath = IndexPath(row: Person.persons.count - 1, section: 0)
        mainView.tableViewPersons.insertRows(at: [indexPath], with: .automatic)
        mainView.textFieldFirstName.text = ""
        mainView.textFieldSecondName.text = ""
        mainView.textFieldDateOfBirth.text = ""
        mainView.tableViewPersons.endUpdates()
        Person.serializePersons()
    }

}

extension MainViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath)
        readPerson(cell: cell, path: indexPath)
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Person.persons.count
    }
}

extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let c = UserInfoViewController()
        let person = Person.persons[indexPath.row]
        print(indexPath.row)
        c.firstName = person.firstName
        c.secondName = person.secondName
        c.age = person.age
        navigationController?.pushViewController(c, animated: true)
    }
}

class UserInfoViewController: UIViewController {
    var firstName: String = ""
    var secondName: String = ""
    var age: Int = 0
    
    var userInfoView: UserInfoView{
        get{
            return view as! UserInfoView
        }
    }
    
    override func loadView() {
        view = UserInfoView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "UserInfo"
        userInfoView.labelFirstName.text = firstName
        userInfoView.labelSecondName.text = secondName
        userInfoView.labelAge.text = "\(age)"
    }
}
