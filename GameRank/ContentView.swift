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
        NavigationView {
            List {
                NavigationLink {
                    ScheduleView(week: 1)
                } label: {
                    MenuLabel(image: "football", text: "Scores")
                }
                NavigationLink {
                } label: {
                    MenuLabel(image: "trophy", text: "Standings")
                }
                NavigationLink {
                    ScheduleView(week: 1)
                } label: {
                    MenuLabel(image: "calendar", text: "Schedule")
                }
                NavigationLink {
                } label: {
                    MenuLabel(image: "checkmark", text: "Make Picks")
                }
            }
            .navigationTitle("GameRank")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
