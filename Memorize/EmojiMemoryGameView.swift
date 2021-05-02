//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Alan on 29.4.2021.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    
    var body: some View {
        VStack{
            HStack() {
                Text("Score: \(viewModel.score)")
                Spacer()
                Text(viewModel.name).font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                Spacer()
                Button("New Game") {
                    viewModel.startNewGame()
                }
            }.padding()
            .frame(maxWidth: .infinity)
            
            Grid(viewModel.cards) { card in
                CardView(card: card).onTapGesture{
                    viewModel.choose(card: card)
                }
                .padding(5)
            }
            .foregroundColor(.orange)
            .padding()
        }
    }
}


struct CardView: View {
    var card: MemoryGame<String>.Card
    
    var body: some View {
        GeometryReader{ geometry in
            if card.isFaceUp || !card.isMatched {
                ZStack {
                    Pie(startAngle: Angle.degrees(-90), endAngle: Angle.degrees(30), clockWise: true).padding(5).opacity(0.4)
                    Text(card.content)
                        .font(Font.system(size: fontSize(for: geometry.size)) )
                }
                .cardify(isFaceUp: card.isFaceUp)
            }
        }
        
    }
    
}

// MARK: - Drawing Constants

private func fontSize(for size: CGSize) -> CGFloat {
    min(size.width, size.height) * 0.7
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        game.choose(card: game.cards[0])
        return EmojiMemoryGameView(viewModel: game)
    }
}
