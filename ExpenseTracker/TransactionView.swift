//
//  TransactionView.swift
//  ExpenseTracker
//
//  Created by Kyle-Anthony Hay on 8/9/24.
//

import SwiftUI

struct TransactionView: View {
    var transaction: Transaction
    var body: some View {
        List {
            // MARK: Hero Section
            VStack(spacing: 6, content: {
                Text(transaction.signedAmount, format: .currency(code: "USD"))
                    .font(.largeTitle)
                    .bold()
                
                Text(transaction.merchant).lineLimit(1)
                
                Text(transaction.dateParsed, format: .dateTime.year().month(.wide).day())
            })
            .frame(maxWidth: .infinity, alignment: .center)
            .listRowSeparator(.hidden, edges: .top)
            .padding(.vertical, 16)
            
            // MARK: Merchant
            TransactionDetialRow(icon: .store, title: "Merchant", text: transaction.merchant)
            // MARK: Date
            TransactionDetialRow(icon: .calendar, title: "Date", text: transaction.dateParsed.formatted(.dateTime.year().month(.wide).day().weekday(.wide)))
            // MARK: Financial Institution
            TransactionDetialRow(icon: .landmark, title: "Financial Institution", text: transaction.institution)
            // MARK: Account
            TransactionDetialRow(icon: .credit_card, title: "Account", text: transaction.account)
            // MARK: Category
            NavigationLink {
                CategoriesView(transaction: transaction)
            } label: {
                TransactionDetialRow(icon: .list, title: "Category", text: transaction.category)
            }

        }
        .listStyle(.plain)
        .navigationTitle("Transaction")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        TransactionView(transaction: transactionPreviewData)
    }
}
