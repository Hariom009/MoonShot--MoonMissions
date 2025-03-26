//
//  MissionList.swift
//  MoonShot
//
//  Created by Hari's Mac on 02.03.2025.
//

import SwiftUI

struct MissionList: View {
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")

    var body: some View {
        NavigationStack {
            List(missions) { mission in
                NavigationLink {
                    MissionView(mission: mission, astronauts: astronauts)
                } label: {
                    HStack {
                        Image(mission.image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 40, height: 40)

                        VStack(alignment: .leading) {
                            Text(mission.displayName)
                                .font(.headline)
                                .foregroundStyle(.white)

                            Text(mission.formattedLaunchDate)
                                .font(.caption)
                                .foregroundStyle(.gray)
                        }
                    }
                    .padding(10)
                }
                .listRowBackground(Color.darkBackground) // Background color for list row
            }
            .scrollContentBackground(.hidden) // Removes default list background
            .navigationTitle("MoonShot")
            .navigationBarTitleDisplayMode(.inline)
            .background(.darkBackground)
            .preferredColorScheme(.dark)
        }
    }
}

#Preview {
    MissionList()
}

