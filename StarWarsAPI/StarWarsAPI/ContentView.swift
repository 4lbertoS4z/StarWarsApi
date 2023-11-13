//
//  ContentView.swift
//  StarWarsAPI
//
//  Created by alberto saz on 9/11/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView{
            FilmsListView()
                .tabItem {
                    Label( "Films",
                           systemImage: "film" )
                }
            PeopleListView()
                .tabItem{
                    Label("People",
                    systemImage: "person.2.fill")
                }
            VehiclesListView()
                .tabItem{
                    Label("Vehicles",
                    systemImage: "car.fill")
                }
           
            
        }
    }
}

#Preview {
    ContentView()
}
