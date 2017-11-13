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
            let alert = UIAlertController(title: "ERROR", message: "Form is incorrect", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
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
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let userView = UserInfoViewController()
        let person = Person.persons[indexPath.row]
        print(indexPath.row)
        userView.firstName = person.firstName
        userView.secondName = person.secondName
        userView.age = person.age
        navigationController?.pushViewController(userView, animated: true)
    }
}
