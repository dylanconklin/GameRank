//
//  ContentView.swift
//  GameRank
//
//  Created by Dylan Conklin on 8/5/23.
//

import SwiftUI

struct MenuLabel: View {
    var image: String
    var text: String

    var body: some View {
        HStack {
            Image(systemName: image)
            Text(text)
        }
    }
}

struct ContentView: View {
    var body: some View {
        TabView {
            ScheduleView(week: 1)
                .tabItem { Label("Scores", systemImage: "football") }
            StandingsView()
                .tabItem { Label("Standings", systemImage: "trophy") }
            ScheduleView(week: 1)
                .tabItem { Label("Schedule", systemImage: "calendar") }
            ScheduleView(week: 1)
                .tabItem { Label("Make Picks", systemImage: "checkmark") }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
