//
//  CategoriesView.swift
//  ExpenseTracker
//
//  Created by Kyle-Anthony Hay on 8/12/24.
//

import SwiftUI

struct CategoriesView: View {
    var transaction: Transaction
    
    var body: some View {
        List {
            ForEach(Category.categories) { category in
                Section {
                    // MARK: Subcategories
                    ForEach(category.subCategorires ?? []) {subCategory in
                        let isSelected = transaction.categoryId == subCategory.id
                        
                        CategoryRow(category: subCategory, isSelected: isSelected)
                    }
                } header: {
                    // MARK: Categories
                    let isSelected = transaction.categoryId == category.id
                    
                    CategoryRow(category: category, isSelected: isSelected)
                }

            }
        }.listStyle(.plain)
            .navigationTitle("Category")
            .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    CategoriesView(transaction: transactionPreviewData)
}
