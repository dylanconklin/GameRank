//
//  ScheduleView.swift
//  GameRank
//
//  Created by Dylan Conklin on 8/7/23.
//

import SwiftUI

struct WeekNavigator: View {
    @Binding var week: Int
    var weekLabel: String {
        var result: String = ""
        if week == 19 {
            result = "Wild Card"
        } else if week == 20 {
            result = "Divisional"
        } else if week == 21 {
            result = "Conference"
        } else if week == 22 {
            result = "Final Game"
        } else {
            result = "Week \(week > 9 ? "" : " ")\(week)"
        }
        return result
    }

    var body: some View {
        HStack {
            Spacer()
            Button {
                if week > 1 {
                    week -= 1
                }
            } label: {
                Image(systemName: "arrow.left")
            }
            Spacer()
            Text(weekLabel)
                .fontDesign(.monospaced)
            Spacer()
            Button {
                if week < 22 {
                    week += 1
                }
            } label: {
                Image(systemName: "arrow.right")
            }
            Spacer()
        }
    }
}

struct ScheduleView: View {
    @State var week: Int
    var schedule: [Game] {
        var result: [Game] = []
        let games = Database.query("SELECT week, away, home, date, away_score, home_score FROM gamerank.schedule WHERE week = \(week) ORDER BY date ASC;")
        do {
            for game in games {
                result.append(Game(week: try game[0].int(),
                                   teams: [
                                       teams[try game[1].string()] ?? Team(abbreviated_name: "???", name: "Unknown"),
                                       teams[try game[2].string()] ?? Team(abbreviated_name: "???", name: "Unknown"),
                                   ],
                                   score: [try? game[4].int(), try? game[5].int()]
                    ))
            }
        } catch {
            print("Error loading schedule")
        }
        return result
    }

    var body: some View {
        VStack {
            WeekNavigator(week: $week)
            if schedule.isEmpty {
                VStack {
                    Text("No games scheduled yet...")
                    Text("Check back again later.")
                }
                .padding()
            } else {
                ScrollView {
                    ForEach(schedule.sorted(by: { $0.week < $1.week }), id: \.self) { game in
                        Matchup(game: Game(week: game.week, teams: game.teams))
                    }
                }
            }
        }
    }
}

struct ScheduleView_Previews: PreviewProvider {
    static var previews: some View {
        ScheduleView(week: 1)
    }
}
