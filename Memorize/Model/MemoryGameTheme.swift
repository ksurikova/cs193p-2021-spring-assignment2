//
//  MemoryGameTheme.swift
//  Memorize
//
//  Created by Ksenia Surikova on 11.10.2021.
//

import Foundation



struct MemoryGameTheme {
    
    let name: String
    let color: String
    let numberOfPairsOfCards: Int
    let emojis: [String]
    
   
    init(name: String, color: String, numberOfPairsOfCards: Int, emojis: [String]) {
        self.name = name
        self.color = color
        self.emojis = emojis
        self.numberOfPairsOfCards = emojis.count < numberOfPairsOfCards ? emojis.count : numberOfPairsOfCards
    }

}
