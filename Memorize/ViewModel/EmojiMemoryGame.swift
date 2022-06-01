//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Ksenia Surikova on 08.10.2021.
//

import SwiftUI



class EmojiMemoryGame: ObservableObject {
    
    enum MemoryGameError: Error {
        case NoThemeToSet
    }
    
    
    static let availableThemes: [MemoryGameTheme] = [
        MemoryGameTheme(name: "dolce vita", color: "red", numberOfPairsOfCards: 8, emojis: ["🕶","👗", "👠", "💍", "🏰", "👸🏼", "🍸", "🧁", "🌆", "🏝", "🎁"]),
        MemoryGameTheme(name: "weather", color: "blue", numberOfPairsOfCards: 7, emojis: ["☁️","☀️", "🌪", "🌈", "☂️", "⚡️", "💧", "❄️", "🌱", "⛱", "🍁"]),
        MemoryGameTheme(name: "animals", color: "green", numberOfPairsOfCards: 11, emojis: [  "🐤", "🦈", "🦓","🐕","🦧", "🦩", "🦡", "🦉", "🦋", "🐛", "🐟", "🐨"]),
        MemoryGameTheme(name: "people", color: "pink", numberOfPairsOfCards: 9, emojis: [  "🤡", "🤠", "👶🏽","👮🏿‍♀️","👨🏼‍💻", "🧜🏽‍♀️", "🥷🏻", "👨🏾‍🎨", "🎅🏻", "🏃🏽‍♂️", "👩‍👧", "👺"]),
        MemoryGameTheme(name: "activity", color: "purple", numberOfPairsOfCards: 8, emojis: [  "🧘🏻‍♂️", "⛸", "🏀","🏓","⛷", "🤸🏿‍♂️", "🚴🏼‍♂️", "🎯", "♟", "🎤", "🏇", "🏋🏾‍♂️"]),
        MemoryGameTheme(name: "meal", color: "yellow", numberOfPairsOfCards: 10, emojis: [  "🍎", "🥐", "🥡","🫕","🥖", "🍕", "🥑", "🌽", "🧀", "🥫", "🍢", "🍉"])
    ]
    
    static func createMemoryGame(with theme: MemoryGameTheme) -> MemoryGame<String> {
        let currentEmojis = theme.emojis.shuffled()
        return MemoryGame<String>(numberOfPairsOfCards: theme.numberOfPairsOfCards) {pairIndex in currentEmojis[pairIndex] }
    }
    
    
    @Published private(set) var model: MemoryGame<String>
    private(set) var theme: MemoryGameTheme
    
    init() {
        theme = EmojiMemoryGame.availableThemes.randomElement()!
        model = EmojiMemoryGame.createMemoryGame(with: theme)
    }
    
    
    
    func getColorFromTheme() -> Color {
        switch theme.color {
        case "red": return .red
        case "blue": return .blue
        case "green" : return .green
        case "pink" : return .pink
        case "purple" : return .purple
        case "yellow" : return .yellow
        default : return .black
        }
    }
  
    
    //Mark: - Intent(s)
    func choose(_ card: MemoryGame<String>.Card) {
        // don't need more, because we set @Published directive to model var
        //objectWillChange.send()
        model.choose(card)
    }
    
    func playAgain() {
        theme = EmojiMemoryGame.availableThemes.randomElement()!
        model = EmojiMemoryGame.createMemoryGame(with: theme)
    }
    
   
}
