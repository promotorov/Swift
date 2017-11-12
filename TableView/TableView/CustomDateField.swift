//
//  CustomDateField.swift
//  TableView
//
//  Created by Гость on 12.11.2017.
//  Copyright © 2017 Гость. All rights reserved.
//
import UIKit
import Foundation

class CustomDateField: UITextField {
    let formatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy"
        return formatter
    }()
    
    private(set) var isCorrect = false;
    
    func setControllers() {
        self.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingDidBegin)
        self.addTarget(self, action: #selector(textFieldEndChange(_:)), for: .editingChanged)
    }
    
    @objc func textFieldEndChange(_ textField: UITextField) {
        guard let date = dateFromString(date: textField.text!) else {
            isCorrect = false
            textField.backgroundColor = UIColor.red
            return
        }
        isCorrect = true
        textField.backgroundColor = UIColor.white
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        let dataPicker = UIDatePicker()
        dataPicker.datePickerMode = .date
        textField.inputView = dataPicker
        textField.text = stringFromDate(date: dataPicker.date)
        isCorrect = true
        dataPicker.addTarget(self, action: #selector(datePickerChanged), for: .valueChanged)
    }
    
    func stringFromDate(date: Date) -> String {
        return formatter.string(from: date)
    }
    
    func dateFromString(date: String) -> Date? {
        return formatter.date(from: date)
    }
    
    func yearFromValue() -> Int {
        let calendar = Calendar.current
        let year = calendar.component(.year, from: dateFromString(date: text!)!)
        return year
    }
    
    @objc func datePickerChanged(sender: UIDatePicker) {
        self.text = stringFromDate(date: sender.date)
    }
    
}
