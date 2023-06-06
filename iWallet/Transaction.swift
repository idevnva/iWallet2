//
//  Transaction.swift
//  iWallet
//
//  Created by Vladislav Novoshinskiy on 06.06.2023.
//

import Foundation
import SwiftData

@Model
final class Transaction {
    @Attribute(.unique) var id = UUID().uuidString
    var amount: Int
    var note: String?
    @Attribute(.unique) var date: Date
    
    init(id: String = UUID().uuidString, amount: Int, note: String? = nil, date: Date) {
        self.id = id
        self.amount = amount
        self.note = note
        self.date = date
    }
}

