//
//  AddTransaction.swift
//  iWallet
//
//  Created by Vladislav Novoshinskiy on 06.06.2023.
//

import SwiftUI
import SwiftData

struct AddTransaction: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss
    
    @State private var amount: Int = 0
    @State private var note: String = ""
    @State private var date: Date = Date()
    
    var body: some View {
        NavigationStack {
            ScrollView {
                TextField("Amount", value: $amount, formatter: NumberFormatter())
                TextField("Note", text: $note)
                DatePicker("Date", selection: $date, displayedComponents: .date)
                
                HStack {
                    Button {
                        let newTransaction = Transaction(amount: amount, note: note, date: date)
                        modelContext.insert(newTransaction)
                        dismiss()
                    } label: {
                        Text("Save")
                    }
                }
            }
            .padding()
        }
    }
}

#Preview {
    AddTransaction()
        .modelContainer(for: Transaction.self, inMemory: true)
}
