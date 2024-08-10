//
//  TransactionDetialRow.swift
//  ExpenseTracker
//
//  Created by Kyle-Anthony Hay on 8/9/24.
//

import SwiftUI
import SwiftUIFontIcon

struct TransactionDetialRow: View {

    var icon: FontAwesomeCode
    var title: String
    var text: String
    
    var body: some View {
        HStack(spacing: 16, content: {
            // MARK: Icon
            FontIcon.text(.awesome5Solid(code: icon), fontsize: 24, color: Color.Colors.icon)
                .frame(width: 32, height: 32)
            
            VStack(alignment: .leading, spacing: 6, content: {
                // MARK: Title
                Text(title)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                
                // MARK: Text
                Text(text)
                    .lineLimit(1)
            })
        })
        .padding(.vertical, 8)
    }
}

#Preview {
    TransactionDetialRow(icon: .store, title: "Merchant", text: "Apple")
}
