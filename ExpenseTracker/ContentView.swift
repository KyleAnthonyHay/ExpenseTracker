//
//  ContentView.swift
//  ExpenseTracker
//
//  Created by Kyle-Anthony Hay on 7/23/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            ScrollView {
            
            }.background(Color.Colors.background)
        }
        .navigationViewStyle(.stack)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            // MARK: Notification Icon
            ToolbarItem {
                Image(systemName: "bell.badge")
                    .symbolRenderingMode(.palette)
                    .foregroundStyle(Color.icon, .primary)
            }
        }
    }
}

#Preview {
    ContentView()
}
