//
//  MovieCardView.swift
//  MovieCastCrew
//
//  Created by Samuel Esserman on 4/20/21.
//

import SwiftUI

struct MovieCardView: View {
    @ObservedObject private var movieViewModel  = MovieViewModel()
    @State private var movieNameOne: String     = ""
    @State private var movieNameTwo: String     = ""
    @State private var frame: CGRect = .zero
    
    let color: Color

    var body: some View {
        GeometryReader { geo in
            VStack {
                ZStack {
                    Rectangle()
                        .fill(color)
                    switch movieViewModel.state {
                    case .initial:
                        VStack {
                            Text("Type The Movie You Want To Search")
                            TextField("Search", text: $movieNameOne, onEditingChanged: { _ in }, onCommit: {
                                self.movieViewModel.searchByName(self.movieNameOne)
                            }).textFieldStyle(RoundedBorderTextFieldStyle())
                        }
                    case .list(let movies):
                        MovieListView(
                            cardFrame: $frame,
                            movies: movies,
                            onSelect: onSelectedMovie
                        )
                    case .loading:
                        ProgressView()
                    case .selection(let movie):
                        MovieCell(
                            cardFrame: $frame,
                            movie: movie,
                            largeSize: true
                        )
                    }
                }.cornerRadius(16.0)
            }.onAppear {
                frame = geo.frame(in: .local)
            }
        }
    }
    
    func onSelectedMovie(movie: MovieListViewModel) {
        movieViewModel.onSelectedMovie(movie: movie)
    }
}
