//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Alan on 29.4.2021.
//

import SwiftUI

@main
struct MemorizeApp: App {
    let game = EmojiMemoryGame()
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: game)
        }
    }
}
