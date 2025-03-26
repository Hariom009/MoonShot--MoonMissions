//
//  ContentView.swift
//  MoonShot
//
//  Created by Hari's Mac on 25.02.2025.
//

import SwiftUI


struct ContentView: View {
    let astronauts:[String:Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    @State private var showingGrid: Bool = true
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    var body: some View {
        NavigationStack{
            VStack {
                if showingGrid {
                    GridView()  // Show GridView when true
                } else {
                    MissionList()
                }
            }
            .navigationTitle("MoonShot")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showingGrid.toggle()
                    } label: {
                        Label("Click Me", systemImage: "list.bullet")
                    }                        }
                }
            .background(.darkBackground)
            .preferredColorScheme(.dark)
            .navigationDestination(for: Mission.self) {mission in
                           MissionView(mission: mission, astronauts: astronauts)
                       }
                       
            .navigationDestination(for: MissionView.CrewMember.self) { crew in
                           AstronautView(astronaut: crew.astronaut)
                       }
        }
    }
}
#Preview {
    ContentView()
}
