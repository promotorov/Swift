//
//  MainViewController.swift
//  TableView
//
//  Created by Гость on 08.11.2017.
//  Copyright © 2017 Гость. All rights reserved.
//

import UIKit

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
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        let datePicker = UIDatePicker()
        textField.inputView = datePicker
        datePicker.addTarget(self, action: #selector(datePickerChanged), for: .valueChanged)
    }
    
    @objc func datePickerChanged(sender: UIDatePicker) {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy"
        mainView.textFieldDateOfBirth.text = formatter.string(from: sender.date)
    }
}
