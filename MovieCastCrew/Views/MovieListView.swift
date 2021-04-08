//
//  MovieListView.swift
//  MovieCastCrew
//
//  Created by Samuel Esserman on 4/7/21.
//

import SwiftUI
import URLImage

struct MovieListView: View {
    let moviesOne: [MovieListViewModel]
    let moviesTwo: [MovieListViewModel]
    
    var body: some View {
        ScrollView {
            ScrollView(.horizontal) {
                HStack {
                    ForEach(self.moviesOne, id: \.imdbId) { movie in
                        MovieCell(movie: movie)
                    }
                }
            }
            ScrollView(.horizontal) {
                HStack {
                    ForEach(self.moviesTwo, id: \.imdbId) { movie in
                        MovieCell(movie: movie)
                    }
                }
            }
        }
    }
}

struct MovieCell: View {
    let movie: MovieListViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            URLImage(url: URL(string: movie.poster)!, content: {image in
                image
                    .frame(width: 100, height: 120)
                    .cornerRadius(6)
            })
            VStack(alignment: .leading) {
                Text(movie.title)
                    .font(.headline)
                Text(movie.year)
                    .opacity(0.5)
                    .padding(.top, 10)
            }.padding(5)
            Spacer()
        }.contentShape(Rectangle())
        .frame(maxWidth: 300)
    }
}
