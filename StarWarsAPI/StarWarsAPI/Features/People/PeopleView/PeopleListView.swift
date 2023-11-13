//
//  PeopleListView.swift
//  StarWarsAPI
//
//  Created by alberto saz on 9/11/23.
//

import SwiftUI

struct PeopleListView: View {
    @StateObject private var peopleViewModel = PeopleViewModel()
    @State private var selectedFilter: FilterType = .all

    enum FilterType: String, CaseIterable, Identifiable {
        case all = "Todos"
        case favorites = "Favoritos"

        var id: String { self.rawValue }
    }

    var body: some View {
        NavigationStack {
            VStack {
                Picker("Filtro", selection: $selectedFilter) {
                    ForEach(FilterType.allCases) { filter in
                        Text(filter.rawValue).tag(filter)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()

                List {
                    ForEach(filteredPeoples, id: \.name) { person in
                        NavigationLink(destination: PeopleDetailView(peopleViewModel: peopleViewModel, person: person)) {
                            Text(person.name)
                        }
                    }
                }
            }
            .navigationBarTitle("Peoples")
        }
        .onAppear {
            Task {
                do {
                    try await peopleViewModel.fetchPeoples()
                } catch(let error) {
                    print("Error: \(error)")
                }
            }
        }
    }

    private var filteredPeoples: [PeopleResult] {
        guard let peoples = peopleViewModel.peoples else { return [] }
        switch selectedFilter {
        case .all:
            return peoples
        case .favorites:
            return peoples.filter { peopleViewModel.favorites.contains($0.name) }
        }
    }
}

// Vista previa
struct PeopleListView_Previews: PreviewProvider {
    static var previews: some View {
        PeopleListView()
    }
}
