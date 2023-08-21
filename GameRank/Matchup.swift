//
//  Matchup.swift
//  GameRank
//
//  Created by Dylan Conklin on 8/5/23.
//

import SwiftUI

struct Game : Hashable {
    var week: Int
    var teams: [Team]
    var score: [Int?]?
    var date: Date?
}

struct MatchupTeam: View {
    var team: Team
    var score: Int?
    
    var body: some View {
        VStack {
            Button {
            } label: {
                TeamLogo(team: team, score: score)
            }
            Text(team.abbreviated_name)
                .fontDesign(.monospaced)
                .fontWeight(Font.Weight.bold)
                .font(.largeTitle)
            Text("\(team.wl_record[0]) - \(team.wl_record[1])\(team.wl_record[2] == 0 ? "" : " - \(team.wl_record[2])")")
        }
    }
}

struct Matchup: View {
    var game: Game
    
    @State private var awayScale: Double = 1.0
    @State private var homeScale: Double = 1.0

    @State var hovered = false
    
    var body: some View {
        HStack {
            Spacer()
            MatchupTeam(team: game.teams[0], score: game.score?[0])
            Spacer()
            Text("at")
                .fontDesign(.monospaced)
                .fontWeight(Font.Weight.bold)
                .font(.largeTitle)
            Spacer()
            MatchupTeam(team: game.teams[1], score: game.score?[1])
            Spacer()
        }
    }
}

struct Matchup_Previews: PreviewProvider {
    static var game1: Game = Game(week: 1, teams: [teams["PIT"] ?? Team(abbreviated_name: "PIT", name: "Pittsburgh"), teams["BAL"] ?? Team(abbreviated_name: "BAL", name: "Baltimore")])
    static var game2: Game = Game(week: 1, teams: [teams["PIT"] ?? Team(abbreviated_name: "PIT", name: "Pittsburgh"), teams["BAL"] ?? Team(abbreviated_name: "BAL", name: "Baltimore")], score: [3, 7])
    static var previews: some View {
        VStack {
            Matchup(game: game1)
            Matchup(game: game2)
        }
    }
}
