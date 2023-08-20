//
//  FirstScreenView.swift
//  App5
//
//  Created by Akshat Khare on 5/25/23.
//

import UIKit

class FirstScreenView: UIView {

    var tableViewExpense: UITableView!
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        
        //MARK: initializing a TableView...
        setupTableViewExpense()
        initConstraints()
    }
    
    func setupTableViewExpense(){
        tableViewExpense = UITableView()
        tableViewExpense.register(TableViewExpenseCell.self, forCellReuseIdentifier: "expenses")
        tableViewExpense.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(tableViewExpense)
    }
    
    //MARK: setting the constraints...
    func initConstraints(){
        NSLayoutConstraint.activate([
            tableViewExpense.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 8),
            tableViewExpense.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -8),
            tableViewExpense.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 8),
            tableViewExpense.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -8),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
