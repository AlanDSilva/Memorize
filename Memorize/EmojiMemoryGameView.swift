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
            ZStack {
                if card.isFaceUp{
                    RoundedRectangle(cornerRadius: cornerRadius).fill(Color.white)
                    RoundedRectangle(cornerRadius: cornerRadius).stroke(lineWidth: edgeLineWidth)
                    Text(card.content)
                } else {
                    if !card.isMatched {
                        RoundedRectangle(cornerRadius: cornerRadius).fill()
                    }
                }
            }
            .font(Font.system(size: fontSize(for: geometry.size)) )
        }
        
    }
    
    // MARK: - Drawing Constants
    
    let cornerRadius: CGFloat = 10.0
    let edgeLineWidth: CGFloat = 3
    let fontScaleFactor: CGFloat = 0.75
    func fontSize(for size: CGSize) -> CGFloat {
        min(size.width, size.height) * 0.75
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiMemoryGameView(viewModel: EmojiMemoryGame())
    }
}
