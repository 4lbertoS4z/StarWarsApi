//
//  FilmsListView.swift
//  StarWarsAPI
//
//  Created by alberto saz on 9/11/23.
//

import SwiftUI

struct FilmsListView: View {
    @StateObject private var filmsViewModel = FilmsViewModel()
    
    
    var body: some View {
        NavigationStack{
            List(filmsViewModel.films ?? []){ films in NavigationLink(destination: FilmDetailView(film:films),
                                                                      label: {
                HStack{
                    Text(films.title)
                    Spacer()
                    Text(films.releaseDate)
                }
            }
            )
            }
            .navigationBarTitle("Films")
        }
        .onAppear{
            Task{
                do{
                   try await filmsViewModel.fetchFilms()
                } catch(let error){
                    print("Error: \(error)")
                }
                
            }
        }
        
    }
}

#Preview {
    FilmsListView()
}
