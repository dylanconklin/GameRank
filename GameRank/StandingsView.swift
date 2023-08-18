//
//  StandingsView.swift
//  GameRank
//
//  Created by Dylan Conklin on 8/8/23.
//

import SwiftUI
import PostgresClientKit

struct StandingsView: View {
    private var standings: [String : Team] {
        var standings: [String : Team] = [:]
        let queryResults: [[PostgresValue]] = Database.query("SELECT name, win, loss, tie FROM team")
        return standings
    }
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct StandingsView_Previews: PreviewProvider {
    static var previews: some View {
        StandingsView()
    }
}
