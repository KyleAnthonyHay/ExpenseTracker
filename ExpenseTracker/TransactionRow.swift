//
//  TransactionRow.swift
//  ExpenseTracker
//
//  Created by Kyle-Anthony Hay on 7/24/24.
//

import SwiftUI
import SwiftUIFontIcon

struct TransactionRow: View {
    var transaction: Transaction
    
    var body: some View {
        HStack(spacing: 20, content: {
            //MARK: Transaction Category Icon
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .fill(Color.Colors.icon.opacity(0.3))
                .frame(width: 44, height: 44)
                .overlay {
                    FontIcon.text(.awesome5Solid(code: transaction.icon), fontsize: 24, color: Color.Colors.icon)
                }
            
            VStack(alignment: .leading, spacing: 6, content: {
                //MARK: Transaction Merchant
                Text(transaction.merchant)
                    .font(.subheadline)
                    .bold()
                    .lineLimit(1)
//                    .foregroundStyle(.)
                //MARK: Transaction Category
                Text(transaction.categoryItem.name)
                    .font(.footnote)
                    .opacity(7)
                    .lineLimit(1)
                //MARK: Transaction Date
                Text(transaction.dateParsed, format: .dateTime.year().month().day())
                    .font(.footnote)
                    .foregroundStyle(.secondary)
            })//end of VStack
            
            Spacer()
            //MARK: Transaction Amount
            Text(transaction.signedAmount, format: .currency(code: "USD"))
                .bold()
                .foregroundStyle(transaction.type == TransactionType.credit.rawValue ? Color.Colors.text : .primary)
        })
        .padding([.top, .bottom], 8)
    }
}

#Preview {
    TransactionRow(transaction: transactionPreviewData)
}
