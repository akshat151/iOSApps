//
//  AddExpenseView.swift
//  App5
//
//  Created by Akshat Khare on 5/22/23.
//

import UIKit

class AddExpenseView: UIView {

    var textFieldTitle: UITextField!
    var textFieldAmount: UITextField!
    var labelType: UILabel!
    var pickerType: UIPickerView!
    var buttonAdd: UIButton!

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        
        setuptextFieldTitle()
        setuptextFieldAmount()
        setuplabelType()
        setuppickerType()
        setupbuttonAdd()
        
        initConstraints()
    }
    
//    MARK: methods to initialize the UI elements...
    func setuptextFieldTitle(){
        textFieldTitle = UITextField()
        textFieldTitle.placeholder = "Put title"
        textFieldTitle.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(textFieldTitle)
    }
    func setuptextFieldAmount(){
        textFieldAmount = UITextField()
        textFieldAmount.placeholder = "Put amount"
        textFieldAmount.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(textFieldAmount)
    }
    func setuplabelType(){
        labelType = UILabel()
        labelType.textColor = .systemGray
        labelType.text = "Select the type of expense:"
        labelType.textAlignment = .center
        labelType.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(labelType)
    }
    func setuppickerType(){
        pickerType = UIPickerView()
        pickerType.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(pickerType)
    }
    func setupbuttonAdd(){
        buttonAdd = UIButton(type: .system)
        buttonAdd.setTitle("Add Expense", for: .normal)
        buttonAdd.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(buttonAdd)
    }
    
    //MARK: initialize the constraints...
    func initConstraints(){
        NSLayoutConstraint.activate([
            textFieldTitle.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 32),
            textFieldTitle.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            textFieldAmount.topAnchor.constraint(equalTo: textFieldTitle.bottomAnchor, constant: 16),
            textFieldAmount.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            labelType.topAnchor.constraint(equalTo: textFieldAmount.bottomAnchor, constant: 16),
            labelType.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            pickerType.topAnchor.constraint(equalTo: labelType.bottomAnchor, constant: 8),
            pickerType.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            buttonAdd.topAnchor.constraint(equalTo: pickerType.bottomAnchor, constant: 16),
            buttonAdd.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
        ])
    }
    
   
    
    //MARK: unused methods...
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
