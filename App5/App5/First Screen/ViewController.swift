//
//  ViewController.swift
//  App5
//
//  Created by Akshat Khare on 5/22/23.
//

import UIKit

class ViewController: UIViewController {
    
    let firstScreen = FirstScreenView()
    
    //MARK: expenses array to populate TableView...
    var expenses = [Expense]()
    
    //MARK: predefined types of expenses...
    let types = ["Groceries", "Rent", "Subscriptions", "Gadgets and Electronics"]
    
    override func loadView() {
        view = firstScreen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Expense App"
        
        //MARK: patching the table view delegate and datasource to controller...
        firstScreen.tableViewExpense.delegate = self
        firstScreen.tableViewExpense.dataSource = self
                
        //MARK: setting the add button to the navigation controller...
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .add, target: self,
            action: #selector(onAddBarButtonTapped)
        )
    }
    
    //MARK: On add Bar Button tapped...
    @objc func onAddBarButtonTapped(){
        let addExpenseController = AddExpenseViewController()
        addExpenseController.delegate = self
        navigationController?.pushViewController(addExpenseController, animated: true)
    }
    
    //MARK: got the new expense back and delegated to ViewController...
    func delegateOnAddExpense(expense: Expense){
        expenses.append(expense)
        firstScreen.tableViewExpense.reloadData()
    }


}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    //MARK: returns the number of rows in the current section...
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return expenses.count
    }
    
    //MARK: populate a cell for the currecnt row...
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "expenses", for: indexPath) as! TableViewExpenseCell
        cell.labelTitle.text = expenses[indexPath.row].title
        if let uwAmount = expenses[indexPath.row].amount{
            cell.labelAmount.text = "Cost: $\(uwAmount)"
        }
        if let uwType = expenses[indexPath.row].type{
            cell.labelType.text = "Type: \(uwType)"
        }
        return cell
    }
    
    //MARK: deal with user interaction with a cell...
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(self.expenses[indexPath.row])
    }
    
    
}

