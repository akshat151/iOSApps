//
//  Expense.swift
//  App5
//
//  Created by Akshat Khare on 5/22/23.
//

import Foundation

struct Expense{
    var title: String?
    var amount: Double?
    var type: String?
    
    init(title: String? = nil, amount: Double? = nil, type: String? = nil) {
        self.title = title
        self.amount = amount
        self.type = type
    }
    
}
