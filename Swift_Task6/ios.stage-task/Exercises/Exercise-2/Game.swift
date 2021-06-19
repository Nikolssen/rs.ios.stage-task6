//
//  Game.swift
//  DurakGame
//
//  Created by Дима Носко on 16.06.21.
//

import Foundation

protocol GameCompatible {
    var players: [Player] { get set }
}

struct Game: GameCompatible {
    var players: [Player]
}

extension Game {

    func defineFirstAttackingPlayer(players: [Player]) -> Player? {
        if players.count <= 1 {
            return nil
        }
        let result = players.map{
            player -> Int in
            var initial = 100
            for card in player.hand!{
                if card.isTrump {
                    if card.value.rawValue < initial {
                        initial = card.value.rawValue
                    }
                }
            }
            return initial
        }
        let value = result.min()
        let index = result.firstIndex(where: {$0 == value}) ?? 0
        return players[index]
        
    }
}
