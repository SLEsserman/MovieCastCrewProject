//
//  ContentView.swift
//  MovieCastCrew
//
//  Created by Samuel Esserman on 4/7/21.
//

import SwiftUI

struct MovieScreen: View {
    @ObservedObject private var movieViewModel = MovieViewModel()
    @State private var movieNameSearch: String = ""
    
    var body: some View {
        VStack {
            TextField("Search", text: $movieNameSearch, onEditingChanged: { _ in }, onCommit: {
                self.movieViewModel.searchByName(self.movieNameSearch)
            }).textFieldStyle(RoundedBorderTextFieldStyle())
            Spacer()
                .navigationTitle("Movies")
                MovieListView(movies: self.movieViewModel.movies)
            
        }.padding()
    }
}

struct MovieSreen_Previews: PreviewProvider {
    static var previews: some View {
        MovieScreen()
    }
}
