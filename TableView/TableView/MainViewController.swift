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
    var dateOfBirh: String
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
        mainView.buttonAdd.addTarget(self, action: #selector(handleButtonAddPerson), for: .touchUpInside)
        mainView.textFieldDateOfBirth.setControllers()
    }
    
    @objc func handleButtonAddPerson(){
        mainView.tableViewPersons.beginUpdates()
        source.append(Person(firstName: mainView.textFieldFirstName.text!, secondName: mainView.textFieldSecondName.text!,
                             dateOfBirh: mainView.textFieldDateOfBirth.text!))
        let indexPath = IndexPath(row: source.count - 1, section: 0)
        mainView.tableViewPersons.insertRows(at: [indexPath], with: .automatic)
        mainView.textFieldFirstName.text = "\(source.count)"
        mainView.tableViewPersons.endUpdates()
    }
}

extension MainViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "cell")
        cell.textLabel?.text = source[indexPath.row].firstName
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
