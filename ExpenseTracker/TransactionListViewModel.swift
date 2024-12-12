//
//  TransactionListViewModel.swift
//  ExpenseTracker
//
//  Created by Kyle-Anthony Hay on 7/25/24.
//

import Foundation
import Combine
import Collections

typealias TransactionGroup = OrderedDictionary<String, [Transaction]>  // Dictionary
typealias TransactionPrefixSum = [(String, Double)]

final class TransactionListViewModel: ObservableObject, Observable {
    @Published var transactions: [Transaction] = []
    
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        getTransactions()
    }
    
    func getTransactions() {
        guard let url = URL(string: "https://designcode.io/data/transactions.json") else {
            print("Invalid URL")
            return
        }
        
        URLSession.shared.dataTaskPublisher(for: url)
            .tryMap { (data, response) -> Data in
                guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                    dump(response)
                    throw URLError(.badServerResponse)
                }

                return data
            }
            .decode(type: [Transaction].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure(let error):
                    print("Error fetching transactions:", error.localizedDescription)
                case .finished:
                    print("Finished fetching transactions")
                }
            }, receiveValue: { [weak self] result in
                self?.transactions = result
//                    dump(self?.transactions as Any) //for testing
            })
            .store(in: &cancellables)

    }
    
    func groupTransactionsByMonth() -> TransactionGroup {
        guard !transactions.isEmpty else {return [:] }
        // group transactions by month and store in new dictionary
        let groupedTransactions = TransactionGroup(grouping: transactions, by: {$0.month})
        
        return groupedTransactions
    }
    
    func accumulateTransactions() -> TransactionPrefixSum {
        print("Accumulate transactions")
        guard !transactions.isEmpty else { return []}
        
        let today = "02/17/2022".dateParsed() // ideally todays date in production code: Date()
        let dateInterval = Calendar.current.dateInterval(of: .month, for: today)!
        print("Date Interval: ", dateInterval)
        
        var sum: Double = .zero
        var cumulativeSum = TransactionPrefixSum()
        
        for date in stride(from: dateInterval.start, to: today, by: 60 * 60 * 24) {
            let dailyExpenses = transactions.filter({ $0.dateParsed == date && $0.isExpense })
            let dailyTotal = dailyExpenses.reduce(0) { $0 - $1.signedAmount }
            
            sum += dailyTotal
            sum = sum.roundedTo2Digits()
            cumulativeSum.append( (date.formatted(), sum))
            print(date.formatted(), "daily Total: ", dailyTotal, " Sum: ", sum)
            
        }
        
        return cumulativeSum
    }
    
    func updateCategory(transaction: Transaction, category: Category) {
        guard transaction.categoryId != category.id else { return }
        
        if let index = transactions.firstIndex(where: { $0.id == transaction.id }) {
            var updatedTransaction = transactions[index]
            updatedTransaction.categoryId = category.id
            updatedTransaction.isEdited = true
            transactions[index] = updatedTransaction
        }
    }
}
