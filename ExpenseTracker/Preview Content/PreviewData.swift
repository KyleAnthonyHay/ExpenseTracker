//
//  PreviewData.swift
//  ExpenseTracker
//
//  Created by Kyle-Anthony Hay on 7/24/24.
//

import Foundation
import SwiftUI

var transactionPreviewData = Transaction(
    id: 1,
    date: "01/24/2022",
    institution: "Desjardins",
    account: "Visa Desjardins",
    amount: 11.49,
    isPending: false,
    type: "debit",
    merchant: "Apple",
    categoryId: 801,
    category: "Software",
    isTransfer: false,
    isExpense: true,
    isEdited: false
)

var transactionListPreviewData = [Transaction](repeating: transactionPreviewData, count: 10)
