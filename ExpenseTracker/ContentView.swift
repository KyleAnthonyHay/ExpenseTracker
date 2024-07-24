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
                VStack (alignment: .leading, spacing: 24, content: {
                    // MARK: Title
                    /*@START_MENU_TOKEN@*/Text("Placeholder")/*@END_MENU_TOKEN@*/
                        .font(.title2)
                        .bold()
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
    ContentView()
}
