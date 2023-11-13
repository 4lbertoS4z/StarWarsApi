//
//  FilmDetailView.swift
//  StarWarsAPI
//
//  Created by alberto saz on 9/11/23.
//

import SwiftUI

struct FilmDetailView: View {
    let film: FilmResult
    var body: some View {
        VStack{
            ScrollView{
                Text("Title:")
                    .font(.title)
                Text(film.title)
                    .font(.headline)
                Text("Directed by")
                    .font(.title)
                Text(film.director)
                    .font(.headline)
                Text("Produced by")
                    .font(.title)
                Text(film.producer)
                    .font(.headline)
                Text("Opening:")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                Text(film.openingCrawl)
                Text("Characters:")
                    .font(.title)
                ForEach(film.characters, id: \.self) { character in
                    Text(character)
                }
                
                Text("Planets:")
                    .font(.title)
                ForEach(film.planets, id: \.self) { planet in
                    Text(planet)
                }
            }
        }
    }
}

