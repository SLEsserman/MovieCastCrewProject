//
//  ContentView.swift
//  MovieCastCrew
//
//  Created by Samuel Esserman on 4/7/21.
//

import SwiftUI

struct MovieScreen: View {
    @ObservedObject private var movieViewModel  = MovieViewModel()
    @State private var movieNameOne: String     = ""
    @State private var movieNameTwo: String     = ""
    
    var body: some View {
        VStack {
            HStack {
                TextField("Search", text: $movieNameOne, onEditingChanged: { _ in }, onCommit: {
                    self.movieViewModel.searchByName(self.movieNameOne, number: .one)
                }).textFieldStyle(RoundedBorderTextFieldStyle())
                
                TextField("Search", text: $movieNameTwo, onEditingChanged: { _ in }, onCommit: {
                    self.movieViewModel.searchByName(self.movieNameTwo, number: .two)
                }).textFieldStyle(RoundedBorderTextFieldStyle())
            }
            Spacer()
                .navigationTitle("Movies")
            MovieListView(moviesOne: self.movieViewModel.moviesOne, moviesTwo: self.movieViewModel.moviesTwo)
        }.padding()
    }
}

struct MovieSreen_Previews: PreviewProvider {
    static var previews: some View {
        MovieScreen()
    }
}
