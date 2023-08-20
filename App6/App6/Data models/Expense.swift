//
//  Expense.swift
//  App6
//
//  Created by Akshat Khare on 5/25/23.
//

import Foundation
import UIKit

struct Expense{
    var title: String?
    var amount: Double?
    var type: String?
    var image: UIImage?
    
    init(title: String, amount: Double, type: String, image: UIImage) {
        self.title = title
        self.amount = amount
        self.type = type
        self.image = image
    }
    
}

