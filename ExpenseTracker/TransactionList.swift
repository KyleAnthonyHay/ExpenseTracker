//
//  TransactionList.swift
//  ExpenseTracker
//
//  Created by Kyle-Anthony Hay on 7/30/24.
//

import SwiftUI

struct TransactionList: View {
    @EnvironmentObject var transactionListVM: TransactionListViewModel
    
    var body: some View {
        VStack {
            List {
                // MARK: Grouped Transactions
                ForEach(Array(transactionListVM.groupTransactionsByMonth()), id: \.key) { month,
                    transactions in
                    Section {
                        // MARK: Transaction List
                        ForEach(transactions) { transaction in
                            NavigationLink {
                                TransactionView(transaction: transaction)
                            } label: {
                                TransactionRow(transaction: transaction)
                            }

                            
                            
                        }
                    } header: {
                        // MARK: Transaction Month
                        Text(month)
                    }.listSectionSeparator(.hidden)

                }
            }.listStyle(.plain)
                
        }
        .navigationTitle("Transactions")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationView {
        TransactionList()
            .environmentObject(RecentTransactionList_Previews.transactionListVM)
    }
}
