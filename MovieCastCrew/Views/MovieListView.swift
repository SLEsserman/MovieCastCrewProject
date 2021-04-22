//
//  MovieListView.swift
//  MovieCastCrew
//
//  Created by Samuel Esserman on 4/7/21.
//

import SwiftUI
import URLImage

struct MovieListView: View {
    
    @Binding var cardFrame: CGRect

    let movies: [MovieListViewModel]
    let onSelect: (MovieListViewModel) -> ()
    
    var body: some View {
        ScrollView {
            ForEach(self.movies, id: \.imdbId) { movie in
                MovieCell(
                    cardFrame: $cardFrame,
                    movie: movie,
                    largeSize: false)
                    .onTapGesture {
                        onSelect(movie)
                    }
            }
        }
    }
}

struct MovieCell: View {

    @Binding var cardFrame: CGRect

    let movie: MovieListViewModel
    let largeSize: Bool

    var width: CGFloat {
        largeSize ? cardFrame.size.width * 0.95 : cardFrame.size.width * 0.65
    }
    var height: CGFloat {
        largeSize ? cardFrame.size.height * 0.8 : cardFrame.size.height * 0.3
    }

    var body: some View {
        VStack(alignment: .leading) {
            Text(movie.title)
                .font(.headline)
            URLImage(url: URL(string: movie.poster)!, content: {image in
                image
                    .frame(width: width, height: height)
                    .cornerRadius(6)
            })
        }.contentShape(Rectangle())
        .frame(maxWidth: .infinity)
    }
}
