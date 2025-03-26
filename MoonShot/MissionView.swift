//
//  MissionView.swift
//  MoonShot
//
//  Created by Hari's Mac on 27.02.2025.
//

import SwiftUI

struct MissionView: View{
    struct CrewMember: Hashable{
        let role: String
        let astronaut: Astronaut
}
    let mission : Mission
    let crew:[CrewMember]
    
    var body: some View{
        ScrollView{
            VStack{
                Image(mission.image)
                    .resizable()
                    .scaledToFit()
                    .containerRelativeFrame(.horizontal){ width ,axis in
                        width * 0.6
                    }
                VStack(alignment: .leading){
                    Text("Mission highlights")
                        .font(.title.bold())
                        .padding(.bottom,5)
                    
                    Text(mission.formattedLaunchDate)
                        .font(.title.bold())
                        .padding(.bottom,5)
                    
                    Text(mission.description)
                        .padding(.horizontal)
                    Rectangle()
                      //  .padding()
                        .frame(height: 2)
                        .foregroundStyle(.white)
                        .padding(.vertical)
                        
                    Text("Crew")
                        .font(.title.bold())
                       .padding(.bottom,10)
                    ScrollView(.horizontal,showsIndicators: false){
                        HStack{
                            ForEach(crew, id:\.role){ crewMember in
                                NavigationLink{
                                    AstronautView(astronaut: crewMember.astronaut)
                                }label:{
                                    HStack{
                                        Image(crewMember.astronaut.id)
                                            .resizable()
                                          //  .scaledToFill()
                                            .frame(width:100,height:72)
                                            .clipShape(.capsule)
                                            .overlay(
                                                Capsule()
                                                    .strokeBorder(.white,lineWidth:1)
                                            )
                                        VStack(alignment:.leading){
                                            Text(crewMember.astronaut.name)
                                                .foregroundStyle(.white)
                                                .font(.headline)
                                            Text(crewMember.role)
                                                .foregroundStyle(.secondary)
                                        }
                                    }
                                    .padding(.horizontal)
                                }
                            }
                        }
                    }
                }
                .padding(.horizontal)
            }
            .padding(.bottom)
        }
        .navigationTitle(mission.displayName)
        .navigationBarTitleDisplayMode(.inline)
        .background(.darkBackground)
}
    
    
    init(mission: Mission, astronauts: [String:Astronaut]){
        self.mission = mission
        self.crew = mission.crew.map{ member in
            if let astronaut = astronauts[member.name]{
                return CrewMember(role: member.role, astronaut: astronaut)
            }else{
                fatalError("Missing \(member.name)")
            }
        }
    }
}
#Preview {
    let missions : [Mission] = Bundle.main.decode("missions.json")
    let astronaut :[String:Astronaut] = Bundle.main.decode("astronauts.json")
   return MissionView(mission: missions[0],astronauts: astronaut)
        .preferredColorScheme(.dark)
}
