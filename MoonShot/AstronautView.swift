//
//  AstronautView.swift
//  MoonShot
//
//  Created by Hari's Mac on 01.03.2025.
//

import SwiftUI

struct AstronautView: View {
    let astronaut: Astronaut
    var body: some View {
        ScrollView{
            VStack{
                Image(astronaut.id)
                    .resizable()
                    .scaledToFit()
                
                Text(astronaut.description)
                    .padding()
            }//VStack
        }//ScrollView
        .background(.darkBackground)
        .navigationTitle(astronaut.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
   return AstronautView(astronaut: astronauts["aldrin"]!)
        .preferredColorScheme(.dark)
}
