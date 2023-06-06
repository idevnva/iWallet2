//
//  ListTransaction.swift
//  iWallet
//
//  Created by Vladislav Novoshinskiy on 06.06.2023.
//

import SwiftUI
import SwiftData

struct ListTransaction: View {
    @Environment(\.modelContext) private var modelContext
    @Query(sort: \.date , order: .reverse) var allTransaction: [Transaction]
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(allTransaction) { transaction in
                    Section {
                        HStack {
                            Text(transaction.note ?? "")
                            Spacer()
                            Text("\(transaction.amount)")
                        }
                    } header: {
                        Text("\(transaction.date)")
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink(destination: AddTransaction()) {
                        Image(systemName: "pencil.circle.fill")
                            .renderingMode(.original)
                            .animation(.easeIn)
                    }
                }
                ToolbarItem(placement: .topBarLeading) {
                    HStack {
                        Text("iWallet")
                            .font(.title)
                            .bold()
                    }
                }
            }
        }
    }
}

#Preview {
    ListTransaction()
        .modelContainer(for: Transaction.self, inMemory: true)
}


