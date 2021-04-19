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
        ScrollView {
            ForEach(self.movies, id: \.imdbId) { movie in
                MovieCell(movie: movie)
            }
        }
    }
}

struct MovieCell: View {
    let movie: MovieListViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(movie.title)
                .font(.headline)
            URLImage(url: URL(string: movie.poster)!, content: {image in
                image
                    .frame(width: 150, height: 170)
                    .cornerRadius(6)
            })
        }.contentShape(Rectangle())
        .frame(maxWidth: .infinity)
        
    }
}
