//
//  iWalletApp.swift
//  iWallet
//
//  Created by Vladislav Novoshinskiy on 06.06.2023.
//

import SwiftUI
import SwiftData

@main
struct iWalletApp: App {

    var body: some Scene {
        WindowGroup {
            ListTransaction()
        }
        .modelContainer(for: Transaction.self)
    }
}
