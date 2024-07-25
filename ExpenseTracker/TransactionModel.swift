//
//  TransactionModel.swift
//  ExpenseTracker
//
//  Created by Kyle-Anthony Hay on 7/24/24.
//

import Foundation

struct Transaction: Identifiable, Decodable {
    let id: Int
    let date: String
    let institution: String
    let account: String
    let amount: Double
    let isPending: Bool
    let type: TransactionType.RawValue
    var merchant: String
    var categoryId: Int
    var category: String
    var isTransfer: Bool
    var isExpense: Bool
    var isEdited: Bool
    
    var dateParsed: Date {
        date.dateParsed()
    }
    var signedAmount: Double {
        return type == TransactionType.credit.rawValue ? amount : -amount
    }
}

enum TransactionType: String {
    case debit = "debit"
    case credit = "credit"
}
