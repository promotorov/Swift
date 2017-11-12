//
//  MainViewController.swift
//  TableView
//
//  Created by Гость on 08.11.2017.
//  Copyright © 2017 Гость. All rights reserved.
//

import UIKit

struct Person {
    var firstName: String
    var secondName: String
    var age: Int
}

var source: [Person] = []

class MainViewController: UIViewController, UITextFieldDelegate {
    
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
        mainView.textFieldDateOfBirth.delegate = self
        mainView.tableViewPersons.dataSource = self
        mainView.tableViewPersons.delegate = self
        mainView.tableViewPersons.register(CustomTableViewCell.self, forCellReuseIdentifier: "cell")
        mainView.buttonAdd.addTarget(self, action: #selector(handleButtonAddPerson), for: .touchUpInside)
        mainView.textFieldDateOfBirth.setControllers()
    }
    
    @objc func handleButtonAddPerson(){
        let firstName = mainView.textFieldFirstName.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let secondName = mainView.textFieldSecondName.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let date = mainView.textFieldDateOfBirth.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let isCorrectDate = mainView.textFieldDateOfBirth.isCorrect
    
        if secondName.isEmpty || date.isEmpty || !isCorrectDate == true {
            return
        }
    
        let year = mainView.textFieldDateOfBirth.yearFromString()
        let calendar = Calendar.current
        let currentDate = Date()
        let currentYear = calendar.component(.year, from: currentDate)
        
        mainView.tableViewPersons.beginUpdates()
        source.append(Person(firstName: firstName, secondName: secondName, age: currentYear - year))
        let indexPath = IndexPath(row: source.count - 1, section: 0)
        mainView.tableViewPersons.insertRows(at: [indexPath], with: .automatic)
        mainView.textFieldFirstName.text = ""
        mainView.textFieldSecondName.text = ""
        mainView.textFieldDateOfBirth.text = ""
        mainView.tableViewPersons.endUpdates()
    }
}

extension MainViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let userCell = cell as! CustomTableViewCell
        let user: Person = source[indexPath.row]
        userCell.firstNameLabel.text = user.firstName
        userCell.secondNameLabel.text = user.secondName
        userCell.ageLabel.text = "\(user.age)"
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return source.count
    }
}

extension MainViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.reloadRows(at: [indexPath], with: UITableViewRowAnimation.fade)
    }
    //    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    //        return indexPath.row == 3 ? 100 : 44
    //    }
}
