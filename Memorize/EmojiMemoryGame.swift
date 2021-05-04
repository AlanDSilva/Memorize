//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Alan on 29.4.2021.
//

import SwiftUI


class EmojiMemoryGame: ObservableObject {
    @Published private var model: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
    
    private static func createMemoryGame() -> MemoryGame<String> {
        let theme1 = Theme(name: "halloween", emojis: ["👻","🎃", "🕷", "🕸"], numberOfCards: 4, color: .orange)
        let theme2 = Theme(name: "balls", emojis: ["⚽️","🏀", "🏈", "⚾️","🥎"], numberOfCards: 5, color: .blue)
        let theme3 = Theme(name: "cars", emojis: ["🚗","🚙", "🚎", "🚛","🚕", "🚚"], numberOfCards: 6, color: .red)
        let theme4 = Theme(name: "animals", emojis: ["🐱","🐶", "🐰", "🐭","🐹", "🦊", "🐻", "🐼", "🐨", "🐷"], color: .pink)
        let theme5 = Theme(name: "weather", emojis: ["☁️","☀️", "🌤", "🌦","🌧", "⛈", "🌩"], numberOfCards: 7, color: .yellow)
        let theme6 = Theme(name: "fruits", emojis: ["🍏","🍎", "🍐"], numberOfCards: 3, color: .green)
        
        let themes = [theme1, theme2, theme3, theme4, theme5, theme6]
        let theme = themes.randomElement()!
        let numOfCards = theme.numberOfCards ?? Int.random(in: 2...theme.emojis.count)
        
//        let emojis: Array<String> = ["👻","🎃", "🕷", "🕸","💀"]
        return MemoryGame<String>(theme.name ,color: theme.color ,numberOfPairsOfCards: numOfCards) { pairIndex in
            return theme.emojis[pairIndex]}
    }
        
    
    // MARK: - Access to the Model
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    
    var name: String {
        model.name
    }
    
    var color: MemoryGame<String>.ThemeColor {
        model.color
    }
    
    var score: Int {
        model.points
    }
    
    //MARK: - Intent(s)
    func choose(card: MemoryGame<String>.Card) {
        model.choose(card: card)
    }
    
    func startNewGame() {
        model = EmojiMemoryGame.createMemoryGame()
    }
    
    // MARK: -Theme
    struct Theme {
        var name: String
        var emojis: [String]
        var numberOfCards: Int?
        var color: MemoryGame<String>.ThemeColor
    }
}
