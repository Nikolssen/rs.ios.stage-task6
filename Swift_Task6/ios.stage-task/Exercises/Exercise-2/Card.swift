import Foundation

protocol CardBaseCompatible: Hashable, Codable {
    var suit: Suit {get}
    var value: Value {get}
    var isTrump: Bool {get}

    func hash(into hasher: inout Hasher)
}

enum Suit: Int, CaseIterable, Codable {
    case clubs
    case spades
    case hearts
    case diamonds
}

enum Value: Int, CaseIterable, Codable {
    case six
    case seven
    case eight
    case nine
    case ten
    case jack
    case queen
    case king
    case ace
}

struct Card: CardBaseCompatible {
    let suit: Suit
    let value: Value
    var isTrump: Bool = false

    func hash(into hasher: inout Hasher) {
        hasher.combine(suit.rawValue)
        hasher.combine(value.rawValue)
    }

    static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.value == rhs.value && lhs.suit == rhs.suit
    }

}

extension Card {

    func checkIfCanBeat(card: Card) -> Bool {
        if self.isTrump == card.isTrump {
            return self.checkValue(card: card)
        }
        return self.isTrump
        
    }

    func checkValue(card: Card) -> Bool {
        return self.value.rawValue > card.value.rawValue
    }
}
