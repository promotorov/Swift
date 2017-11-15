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
    private(set) var wrongStyle: UIColor = UIColor.red
    private(set) var correctStyle: UIColor = UIColor.white
    
    private(set) var isCorrect = true {
        didSet {
            backgroundColor = isCorrect ? correctStyle : wrongStyle
        }
    }
    
    let formatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy"
        return formatter
    }()
    init(wrongStyle: UIColor, correctStyle: UIColor) {
        super.init(frame: CGRect())
        self.wrongStyle = wrongStyle
        self.correctStyle = correctStyle
    }
    
    required override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init has not been implemented")
    }
    
    
    func setControllers() {
        self.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingDidBegin)
        self.addTarget(self, action: #selector(textFieldEndChange(_:)), for: .editingChanged)
    }
    
    @objc func textFieldEndChange(_ textField: UITextField) {
        guard let date = dateFromString(date: textField.text!) else {
            isCorrect = false
            return
        }
        isCorrect = true
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
