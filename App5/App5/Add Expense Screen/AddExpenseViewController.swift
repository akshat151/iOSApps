//
//  AddExpenseViewController.swift
//  App5
//
//  Created by Akshat Khare on 5/22/23.
//

import UIKit

class AddExpenseViewController: UIViewController {
    
    //MARK: delegate to ViewController when getting back...
    var delegate:ViewController!
    
    //MARK: by default Groceries is selected...
    var selectedType = "Groceries"

    //MARK: initializing the ADDExpenseView...
    let addExpenseScreen = AddExpenseView()
    
    //MARK: set the current view to addExpenseScreen...
    override func loadView() {
        view = addExpenseScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //MARK: patching delegate and datasource of the type PickerView...
        addExpenseScreen.pickerType.dataSource = self
        addExpenseScreen.pickerType.delegate = self
        
        //MARK: adding the action for tapping on buttonAdd...
        addExpenseScreen.buttonAdd.addTarget(self, action: #selector(onAddButtonTapped), for: .touchUpInside)
    }
    
    //MARK: action for tapping buttonAdd..
    @objc func onAddButtonTapped(){
        var title:String?
        if let titleText = addExpenseScreen.textFieldTitle.text{
            if !titleText.isEmpty{
                title = titleText
            }else{
                //do your thing to alert user...
            }
        }
        
        var amount = 0.0
        if let amountText = addExpenseScreen.textFieldAmount.text{
            if !amountText.isEmpty{
                if let uwAmount = Double(amountText){
                    amount = uwAmount
                }else{
                    //alert the user that it's not a valid input...
                }
            
                
            }else{
                //do your thing to alert the user...
            }
            
        }
        
        let newExpense = Expense(title: title, amount: amount, type: selectedType)
        delegate.delegateOnAddExpense(expense: newExpense)
        navigationController?.popViewController(animated: true)
    }

}

//MARK: adopting the required protocols...
extension AddExpenseViewController: UIPickerViewDelegate, UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        //MARK: we are using only one section...
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        //MARK: we are displaying the options from Utilities.types...
        return Utilities.types.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        //MARK: updating the selected type when the user picks this row...
        selectedType = Utilities.types[row]
        return Utilities.types[row]
    }
}
