//
//  PeopleDetailView.swift
//  StarWarsAPI
//
//  Created by alberto saz on 9/11/23.
//

import SwiftUI

struct PeopleDetailView: View {
    let person: PeopleResult
    
    var body: some View {
        List {
            Section(header: Text("General Information")) {
                Text("Name: \(person.name)")
                Text("Birth Year: \(person.birthYear)")
                Text("Gender: \(person.gender.rawValue.capitalized)")
            }
            
            Section(header: Text("Homeworld")) {
                NavigationLink(destination: PlanetDetailView(planetUrl: person.homeworld)) {
                    Text("View Homeworld")
                }
            }
            
            // Agregar otras secciones para películas, especies, etc.
        }
        .navigationTitle(person.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}


