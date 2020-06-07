//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Haskell, Tyler on 5/23/20.
//  Copyright © 2020 Tyler Haskell. All rights reserved.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    
    var body: some View {
        VStack {
            Text("\(EmojiMemoryGame.gameTheme.themeName) Theme")
            Text("Score: \(viewModel.score)")
            Grid (viewModel.cards) { card in
                CardView(card: card).onTapGesture {
                    self.viewModel.choose(card: card)
                }
                .padding(5)
            }
            .padding()
            .foregroundColor(EmojiMemoryGame.gameTheme.themeColor)
            Button("New Game") {
                self.viewModel.newGame()
            }
        }
        .padding()
    }
}

struct CardView: View {
    var card: MemoryGame<String>.Card
    
    var body: some View {
        GeometryReader{ geometry in
            self.body(for: geometry.size)
                    }
    }
    
    func body(for size: CGSize) -> some View {
        ZStack {
            if self.card.isFaceUp {
                RoundedRectangle(cornerRadius: cornerRadius).fill(Color.white)
                RoundedRectangle(cornerRadius: cornerRadius).stroke(lineWidth: edgeLineWidth)
                Text(self.card.content)
            } else {
                if !card.isMatched {
                    RoundedRectangle(cornerRadius: cornerRadius).fill(AngularGradient(gradient: Gradient(colors: [EmojiMemoryGame.gameTheme.themeColor, Color.black]), center: UnitPoint()))
                }
            }
        }
        .font(Font.system(size: fontSize(for: size)))
    }
    // MARK: - Drawing Constants
    
    let cornerRadius: CGFloat = 10.0
    let edgeLineWidth: CGFloat = 3
    func fontSize(for size: CGSize) -> CGFloat {
        min(size.width, size.height) * 0.75
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiMemoryGameView(viewModel: EmojiMemoryGame())
    }
}
