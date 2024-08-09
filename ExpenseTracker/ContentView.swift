//
//  ContentView.swift
//  ExpenseTracker
//
//  Created by Kyle-Anthony Hay on 7/23/24.
//

import SwiftUI
import SwiftUICharts

struct ContentView: View {
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
                    CardView {
                        VStack {
                            ChartLabel("$900", type: .title)
                            LineChart()
                        }.background(Color.systemBackground)
                    }.data(demoData)
                    .chartStyle(ChartStyle(backgroundColor: Color.systemBackground, foregroundColor: ColorGradient(Color.Colors.icon.opacity(0.4), Color.Colors.icon)))
                    .frame(height: 300)
                    
                    
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
