//
//  RecentTransactionList.swift
//  ExpenseTracker
//
//  Created by Kyle-Anthony Hay on 7/25/24.
//

import SwiftUI

struct RecentTransactionList: View {
    
    @EnvironmentObject var transactionListVM: TransactionListViewModel
    var transactionsPreviewNumber = 5
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    // MARK: Header Title
                    Text("Recent Transactions").bold()
                    
                    Spacer()
                    
                    NavigationLink {
                        TransactionList()
                    } label: {
                        HStack(spacing:4) {
                            Text("See All")
                            Image(systemName: "chevron.right")
                        }
                        .foregroundColor(Color.Colors.text)
                    }
                }.padding(.top)
                
                // MARK: Recent Transactions List
                ForEach(Array(transactionListVM.transactions.prefix(transactionsPreviewNumber).enumerated()), id: \.offset) { index, transaction in
                    NavigationLink {
                        TransactionView(transaction: transaction)
                    } label: {
                        TransactionRow(transaction: transaction)
                            .accentColor(Color.Colors.textSet)
                    }

                    

                    Divider()
                        .opacity(index == transactionsPreviewNumber - 1 ? 0 : 1)
                }
            }
            .padding()
            .background(Color.systemBackground)
            .clipShape(RoundedRectangle(cornerRadius: 20, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/))
        .shadow(color: Color.primary.opacity(0.2), radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, x:0, y:5)
        }
        
    }
}

// MARK: Custom Preview Var
struct RecentTransactionList_Previews: PreviewProvider {
    static let transactionListVM: TransactionListViewModel = {
        let transactionListVM = TransactionListViewModel()
        transactionListVM.transactions = transactionListPreviewData
        return transactionListVM
    }()

    static var previews: some View {
        RecentTransactionList()
            .environmentObject(transactionListVM)
    }
}

#Preview {
    NavigationStack {
        RecentTransactionList()
            .environmentObject(RecentTransactionList_Previews.transactionListVM)
    }
}
