//
//  EmojiMemoryGameTheme.swift
//  Memorize
//
//  Created by Ken Goettler on 4/5/21.
//

import SwiftUI
import Combine

struct EmojiMemoryGameTheme: Codable, Identifiable, Hashable {
    var id: UUID
    var name: String
    var emojis: [String]
    var color: UIColor.RGB
    var numberOfPairs: Int
    
    init(name: String, emojis: [String], color: UIColor.RGB) {
        self.name = name
        self.emojis = emojis
        self.color = color
        self.id = UUID()
        self.numberOfPairs = emojis.count
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    func printJSON() {
        let jsonData = try! JSONEncoder().encode(self)
        let jsonString = String(data: jsonData, encoding: .utf8)!
        print(jsonString)
    }
    
    static func createNewTheme(named name: String) -> EmojiMemoryGameTheme {
        return EmojiMemoryGameTheme(
            name: name,
            emojis: ["🙂", "😊", "☺️"],
            color: UIColor.RGB(
                red: CGFloat(0.2745),
                green: CGFloat(0.5098),
                blue: CGFloat(0.7059),
                alpha: CGFloat(1)
            )
        )
    }
}

enum EmojiMemoryGameThemes: String, CaseIterable {
    case halloween
    case flags
    case numbers
    case smileys
    case mammals
    case ocean
    
    func getTheme() -> EmojiMemoryGameTheme {
        switch self{
        case .halloween:
            return EmojiMemoryGameTheme(
                name: self.rawValue,
                emojis: ["👻", "🎃", "🕷", "🦴", "💀"],
                color: UIColor.RGB(
                    red: CGFloat(1),
                    green: CGFloat(0.647),
                    blue: CGFloat(0),
                    alpha: CGFloat(1)
                )
            )
        case .flags:
            return EmojiMemoryGameTheme(
                name: self.rawValue,
                emojis: ["🇺🇸", "🇨🇦", "🇬🇧", "🇮🇪", "🇫🇷"],
                color: UIColor.RGB(
                    red: CGFloat(0),
                    green: CGFloat(0),
                    blue: CGFloat(1),
                    alpha: CGFloat(1)
                )
            )
        case .numbers:
            return EmojiMemoryGameTheme(
                name: self.rawValue,
                emojis: ["1️⃣", "2️⃣", "3️⃣", "4️⃣", "5️⃣"],
                color: UIColor.RGB(
                    red: CGFloat(0),
                    green: CGFloat(0),
                    blue: CGFloat(1),
                    alpha: CGFloat(1)
                )            )
        case .smileys:
            return EmojiMemoryGameTheme(
                name: self.rawValue,
                emojis: ["🙂", "😊", "☺️", "🥰", "😘"],
                color: UIColor.RGB(
                    red: CGFloat(0),
                    green: CGFloat(0),
                    blue: CGFloat(1),
                    alpha: CGFloat(1)
                )            )
        case .mammals:
            return EmojiMemoryGameTheme(
                name: self.rawValue,
                emojis: ["🐶", "🐱", "🐯", "🦁", "🐨"],
                color: UIColor.RGB(
                    red: CGFloat(0),
                    green: CGFloat(0),
                    blue: CGFloat(1),
                    alpha: CGFloat(1)
                )
            )
        case .ocean:
            return EmojiMemoryGameTheme(
                name: self.rawValue,
                emojis: ["🐳", "🐙", "🐬", "🐋", "🐠"],
                color: UIColor.RGB(
                    red: CGFloat(0),
                    green: CGFloat(0),
                    blue: CGFloat(1),
                    alpha: CGFloat(1)
                )            )
        }
    }
    
    static func getRandomTheme() -> EmojiMemoryGameTheme {
        EmojiMemoryGameThemes.allCases.randomElement()!.getTheme()
    }
}
