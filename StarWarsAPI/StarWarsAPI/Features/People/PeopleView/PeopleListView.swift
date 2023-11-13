//
//  PeopleListView.swift
//  StarWarsAPI
//
//  Created by alberto saz on 9/11/23.
//

import SwiftUI

struct PeopleListView: View {
    @StateObject private var peopleViewModel = PeopleViewModel()
    
    
    var body: some View {
        NavigationStack{
            List(peopleViewModel.peoples ?? []){ peoples in NavigationLink(destination: PeopleDetailView(person:peoples),
                                                                      label: {
                HStack{
                    Text(peoples.name)
                }
            }
            )
            }
            .navigationBarTitle("Peoples")
        }
        .onAppear{
            Task{
                do{
                    try await peopleViewModel.fetchPeoples()
                } catch(let error){
                    print("Error: \(error)")
                }
                
            }
        }
        
    }
}


#Preview {
    PeopleListView()
}
