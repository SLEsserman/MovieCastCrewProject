//
//  MovieListView.swift
//  MovieCastCrew
//
//  Created by Samuel Esserman on 4/7/21.
//

import SwiftUI
import URLImage

struct MovieListView: View {
    let movies: [MovieListViewModel]

    var body: some View {
        List(self.movies, id: \.imdbId) { movie in
            MovieCell(movie: movie)
        }
    }
}

struct MovieCell: View {
    let movie: MovieListViewModel
    
    var body: some View {
        HStack(alignment: .top) {
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
    }
}
