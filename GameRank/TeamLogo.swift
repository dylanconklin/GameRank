//
//  TeamLogo.swift
//  GameRank
//
//  Created by Dylan Conklin on 8/5/23.
//

import SwiftUI

struct TeamLogo: View {
    var team: Team
    var score: Int?

    var body: some View {
        ZStack {
            Circle()
                .foregroundColor(team.colors[0])
                .frame(width: 105, height: 105)
            Circle()
                .foregroundColor(team.colors[1])
                .frame(width: 90, height: 90)
            if let score {
                Circle()
                    .frame(width: 105, height: 105)
                    .foregroundStyle(team.colors[0])
                Text("\(score)")
                    .frame(width: 105, height: 105)
                    .font(.largeTitle)
                    .fontDesign(.monospaced)
                    .fontWeight(.bold)
                    .foregroundStyle(team.colors[1])
            } else {
                Image(systemName: "football.fill")
                    .resizable()
                    .frame(width: 60, height: 60)
                    .imageScale(.large)
                    .foregroundColor(team.colors[0])
            }
        }
    }
}

#Preview {
    @State var team: [Team] = [
        Team(abbreviated_name: "ARI", name: ""),
        Team(abbreviated_name: "ATL", name: ""),
        Team(abbreviated_name: "BAL", name: ""),
        Team(abbreviated_name: "BUF", name: ""),
        Team(abbreviated_name: "CAR", name: ""),
        Team(abbreviated_name: "CHI", name: ""),
        Team(abbreviated_name: "CIN", name: ""),
        Team(abbreviated_name: "CLE", name: ""),
        Team(abbreviated_name: "DAL", name: ""),
        Team(abbreviated_name: "DEN", name: ""),
        Team(abbreviated_name: "DET", name: ""),
        Team(abbreviated_name: "GB", name: ""),
        Team(abbreviated_name: "HOU", name: ""),
        Team(abbreviated_name: "IND", name: ""),
        Team(abbreviated_name: "JAX", name: ""),
        Team(abbreviated_name: "KC", name: ""),
        Team(abbreviated_name: "LAC", name: ""),
        Team(abbreviated_name: "LAR", name: ""),
        Team(abbreviated_name: "LV", name: ""),
        Team(abbreviated_name: "MIA", name: ""),
        Team(abbreviated_name: "MIN", name: ""),
        Team(abbreviated_name: "NE", name: ""),
        Team(abbreviated_name: "NO", name: ""),
        Team(abbreviated_name: "NYG", name: ""),
        Team(abbreviated_name: "NYJ", name: ""),
        Team(abbreviated_name: "PHI", name: ""),
        Team(abbreviated_name: "PIT", name: ""),
        Team(abbreviated_name: "SEA", name: ""),
        Team(abbreviated_name: "SF", name: ""),
        Team(abbreviated_name: "TB", name: ""),
        Team(abbreviated_name: "TEN", name: ""),
        Team(abbreviated_name: "WAS", name: ""),
    ]
    return VStack {
        ScrollView {
            ForEach(team, id: \.self) { t in
                HStack {
                    Spacer()
                    Text("\(t.abbreviated_name)")
                    Spacer()
                    TeamLogo(team: t)
                    Spacer()
                    TeamLogo(team: t, score: 50)
                    Spacer()
                }
            }
        }
    }
}
