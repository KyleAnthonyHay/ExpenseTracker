//
//  CategoryRow.swift
//  ExpenseTracker
//
//  Created by Kyle-Anthony Hay on 8/12/24.
//

import SwiftUI
import SwiftUIFontIcon

struct CategoryRow: View {
    var category: Category
    var isSelected: Bool = false
    var isMain: Bool {
        category.mainCategoryId == nil
    }
    var body: some View {
        HStack {
            // MARK: Category Icon
            VStack {
                RoundedRectangle(cornerRadius: 20, style: .continuous)
                    .fill(Color.Colors.icon.opacity(0.3))
                    .frame(width: isMain ? 44 : 32, height: isMain ? 44 : 32)
                    .overlay {
                        FontIcon.text(.awesome5Solid(code: category.icon), fontsize: isMain ? 24 : 16, color: Color.Colors.icon)
                    }.frame(width: 50)
            }
            // MARK: Category Name
            if isMain {
                Text(category.name).foregroundStyle(.primary)
            } else {
                Text(category.name).font(.subheadline)
            }
            
            // MARK: Checkmark
            if isSelected {
                Spacer()
                Image(systemName: "checkmark.circle.fill")
                    .font(.system(size: 16))
                    .foregroundColor(Color.Colors.icon)
            }
        }
    }
}

#Preview {
    CategoryRow(category: .billsAndUtilities, isSelected: true)
}
