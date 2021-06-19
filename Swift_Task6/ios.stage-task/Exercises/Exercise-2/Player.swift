//
//  Player.swift
//  DurakGame
//
//  Created by Дима Носко on 15.06.21.
//

import Foundation

protocol PlayerBaseCompatible {
    var hand: [Card]? { get set }
}

final class Player: PlayerBaseCompatible {
    var hand: [Card]?

    func checkIfCanTossWhenAttacking(card: Card) -> Bool {
        return hand?.contains(where: {$0.value == card.value}) ?? false
    }

    func checkIfCanTossWhenTossing(table: [Card: Card]) -> Bool {
        for key in table.keys {
            if let result = hand?.contains(where: {$0.value == key.value}), result {
                return true
            }
        }
        for value in table.values {
            if let result = hand?.contains(where: {$0.value == value.value}), result {
                return true
            }
        }
        return false
    }
}
