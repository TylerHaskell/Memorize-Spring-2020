//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Haskell, Tyler on 5/25/20.
//  Copyright © 2020 Tyler Haskell. All rights reserved.
//

import SwiftUI

class EmojiMemoryGame {
    private var model: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
    
    static func createMemoryGame() -> MemoryGame<String> {
        var emojis = ["👻", "🎃", "🕷", "🦇", "🕸", "🍬", "🍫", "🐛", "🧛🏼‍♂️", "🧟‍♂️"]
        emojis.shuffle()
        let randomNumberOfPairs = Int.random(in: 2...5)
        return MemoryGame<String>(numberOfPairsOfCards: randomNumberOfPairs) { pairIndex in
            return emojis[pairIndex]
        }
    }
        
    //MARK: - Access to the model
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    // MARK: - Intent(s)
    
    func choose(card: MemoryGame<String>.Card) {
        model.choose(card: card)
    }
}
