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
        HStack {
            GeometryReader { geo in
                VStack {
                    ZStack {
                        Rectangle()
                            .fill(Color.blue)
                        VStack {
                            Text("Type The Movie You Want To Search")
                            TextField("Search", text: $movieNameOne, onEditingChanged: { _ in }, onCommit: {
                                self.movieViewModel.searchByName(self.movieNameOne, number: .one)
                            }).textFieldStyle(RoundedBorderTextFieldStyle())
                        }
                    }.cornerRadius(16.0)
                }.frame(maxWidth: geo.size.width / 2, maxHeight: .infinity)
                .padding(.top, 0)
                .padding(.bottom, 50)
            }
        }
    }
}

struct MovieSreen_Previews: PreviewProvider {
    static var previews: some View {
        MovieScreen()
    }
}
