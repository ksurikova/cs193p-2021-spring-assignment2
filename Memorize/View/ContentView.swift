//
//  ContentView.swift
//  Memorize
//
//  Created by Ksenia Surikova on 05.10.2021.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var viewModel: EmojiMemoryGame
    
    //Mark: body
    var body: some View {
        VStack {
            Text("Memorized \(viewModel.theme.name)").font(.largeTitle)
            ScrollView {
                LazyVGrid(columns:[GridItem(.adaptive(minimum: 65))]) {
                    ForEach(viewModel.model.cards){ card in
                        CardView(card: card).aspectRatio(2/3, contentMode: .fit).onTapGesture{
                            viewModel.choose(card)
                        }
                    }
                }
            }.foregroundColor(viewModel.getColorFromTheme())
            Spacer()
            HStack{
                Button("New game") {
                    viewModel.playAgain()
                }
                Spacer()
                Text("Score: \(viewModel.model.score)").font(.title)
            }
        }.padding(.horizontal)
    }
}






struct CardView: View {
    
    let card: MemoryGame<String>.Card

    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20.0)
            if card.isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3.0)
                Text(card.content).font(.largeTitle)
            } else if card.isMatched {
                shape.opacity(0)
            }
            else {
                shape.fill()
            }
        }
}
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
       
        let game = EmojiMemoryGame()
        ContentView(viewModel: game)
            .preferredColorScheme(.dark)
        ContentView(viewModel: game)
            .preferredColorScheme(.light)
        }
    
}
