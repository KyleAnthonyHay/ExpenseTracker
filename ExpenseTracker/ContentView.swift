//
//  ContentView.swift
//  ExpenseTracker
//
//  Created by Kyle-Anthony Hay on 7/23/24.
//

import SwiftUI
import SwiftUICharts

struct ContentView: View {
    @EnvironmentObject var transactionListVM: TransactionListViewModel
    var demoData: [Double] = [8, 2, 4, 6, 12, 9, 2]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack (alignment: .leading, spacing: 24, content: {
                    // MARK: Title
                    Text("Overview")
                        .font(.title2)
                        .bold()
                    
                    // MARK: Chart
                    let data = transactionListVM.accumulateTransactions()
                    
                    if !data.isEmpty {
                        let totalExpense = data.last?.1 ?? 0
                        CardView {
                            VStack(alignment: .leading) {
                                ChartLabel(totalExpense.formatted(.currency(code: "USD")), type: .title, format: "$%.02f")
                                LineChart()
                            }.background(Color.systemBackground)
                        }.data(data)
                        .chartStyle(ChartStyle(backgroundColor: Color.systemBackground, foregroundColor: ColorGradient(Color.Colors.icon.opacity(0.4), Color.Colors.icon)))
                        .frame(height: 300)
                    }
                    
                    // MARK: Transaction List
                    RecentTransactionList()
                })
                .padding()
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
            
            }
            .background(Color.Colors.background)
            .navigationViewStyle(.stack)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                // MARK: Notification Icon
                ToolbarItem {
                    Image(systemName: "bell.badge")
                        .symbolRenderingMode(.palette)
                        .foregroundStyle(Color.Colors.icon, .primary)
                }
            }
            
        }
        
    }
}

#Preview {
    ContentView().environmentObject(RecentTransactionList_Previews.transactionListVM)
}
