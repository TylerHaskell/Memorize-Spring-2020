//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Haskell, Tyler on 5/25/20.
//  Copyright © 2020 Tyler Haskell. All rights reserved.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    @Published private var model: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
    
    static var themes = [theme("Halloween", emojis: ["👻", "🎃", "🕷", "🦇", "🕸", "🍬", "🍫", "🐛", "🧛🏼‍♂️", "🧟‍♂️"], numberOfCardsShown: 5, themeColor: Color.orange),
                         theme("Sports", emojis: ["🏀", "🏈", "⚾️", "⚽️" ,"🏒", "🎾", "🏐", "🎱"], themeColor: Color.blue),
                         theme("Food", emojis: ["🍎", "🍒", "🥑", "🥕", "🌽", "🍆", "🍑", "🍇"], themeColor: Color.green),
                         theme("Animals", emojis: ["🐶", "🐭", "🐰", "🦊", "🐻", "🐯", "🦁", "🐷", "🐸", "🐵"], themeColor: Color.yellow),
                         theme("Weather", emojis: ["☀️", "🌤", "☁️", "🌧", "🌩", "❄️", "💨", "💦"], themeColor: Color.gray),
                         theme("Cars", emojis: ["🚗", "🚕", "🚙", "🚌", "🏎", "🚚", "🚛", "🚓"], themeColor: Color.red)]
    
    static var gameTheme = themes.randomElement()!
    
    static func createMemoryGame() -> MemoryGame<String> {
        gameTheme = themes.randomElement()!
        var emojis = gameTheme.emojis
        emojis.shuffle()
        return MemoryGame<String>(numberOfPairsOfCards: gameTheme.numberOfCardsShown) { pairIndex in emojis[pairIndex] }
    }
        
    //MARK: - Access to the model
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    // MARK: - Intent(s)
    
    func choose(card: MemoryGame<String>.Card) {
        model.choose(card: card)
    }
    
    // MARK: - Intent(s)
    
    var score: Int {
        model.score
    }
    
    // MARK: - New Game
    
    func newGame() {
        model = EmojiMemoryGame.createMemoryGame()
    }
    
    // MARK: - Game Theme
    
    static func chooseTheme() -> theme {
        return self.themes.randomElement()!
    }
    
    struct theme {
        let themeName: String
        let emojis: [String]
        let numberOfCardsShown: Int
        let themeColor: Color
        
        init(_ themeName: String, emojis: [String], themeColor: Color) {
            self.themeName = themeName
            self.emojis = emojis
            self.numberOfCardsShown = Int.random(in: 4...6)
            self.themeColor = themeColor
        }
        
        init(_ themeName: String, emojis: [String], numberOfCardsShown: Int, themeColor: Color) {
            self.themeName = themeName
            self.emojis = emojis
            self.numberOfCardsShown = numberOfCardsShown
            self.themeColor = themeColor
        }
    }
}
