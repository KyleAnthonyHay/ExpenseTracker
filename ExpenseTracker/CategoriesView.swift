//
//  CategoriesView.swift
//  ExpenseTracker
//
//  Created by Kyle-Anthony Hay on 8/12/24.
//

import SwiftUI

struct CategoriesView: View {
    var transaction: Transaction
    @EnvironmentObject var transactionListVM: TransactionListViewModel
    
    var body: some View {
        List {
            ForEach(Category.categories) { category in
                Section {
                    // MARK: Subcategories
                    ForEach(category.subCategorires ?? []) {subCategory in
                        let isSelected = transaction.categoryId == subCategory.id
                        
                        CategoryRow(category: subCategory, isSelected: isSelected).onTapGesture {
                            transactionListVM.updateCategory(transaction: transaction, category: subCategory)
                        }
                    }
                } header: {
                    // MARK: Categories
                    let isSelected = transaction.categoryId == category.id
                    
                    CategoryRow(category: category, isSelected: isSelected).onTapGesture {
                        transactionListVM.updateCategory(transaction: transaction, category: category)
                    }
                }

            }
        }.listStyle(.plain)
            .navigationTitle("Category")
            .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    CategoriesView(transaction: transactionPreviewData).environmentObject(TransactionListViewModel())
}
