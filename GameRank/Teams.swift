//
//  Teams.swift
//  GameRank
//
//  Created by Dylan Conklin on 8/5/23.
//

import Foundation
import PostgresClientKit
import SwiftUI

struct Team : Hashable {
    let abbreviated_name: String
    let name: String
    var wl_record: [Int] = [0, 0, 0]
    var colors: [Color] {
        [Color("\(self.abbreviated_name)1"),
        Color("\(self.abbreviated_name)2")]
    }
}

var teams: [String : Team] {
    var result: [String: Team] = [:]
    let db_result: [[PostgresValue]] = Database.query("SELECT abbreviated_name, name, win, loss, tie FROM gamerank.team")
    do {
        for team in db_result {
            result[try team[0].string()] = Team(
                abbreviated_name: try team[0].string(),
                name: try team[1].string(),
                wl_record: [
                    try team[2].int(),
                    try team[3].int(),
                    try team[4].int(),
                ])
        }
    } catch {
        print("Could not load teams from database")
    }
    return result
}
