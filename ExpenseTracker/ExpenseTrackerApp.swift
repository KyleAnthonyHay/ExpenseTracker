//
//  ExpenseTrackerApp.swift
//  ExpenseTracker
//
//  Created by Kyle-Anthony Hay on 7/23/24.
//

import SwiftUI

@main
struct ExpenseTrackerApp: App {
    @StateObject var transactionListVM = TransactionListViewModel() //added
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(transactionListVM)
        }
    }
}
