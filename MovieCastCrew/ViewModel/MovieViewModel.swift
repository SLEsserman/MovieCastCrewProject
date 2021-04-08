//
//  MovieViewModel.swift
//  MovieCastCrew
//
//  Created by Samuel Esserman on 4/7/21.
//

import Foundation

enum MovieNumber {
    case one
    case two
}

class MovieViewModel: ObservableObject {
    @Published var moviesOne = [MovieListViewModel]()
    @Published var moviesTwo = [MovieListViewModel]()
    let movieService = MovieService()
    
    func searchByName(_ name: String, number: MovieNumber) {
        if name.isEmpty {
            return
        }
        movieService.getMovieBy(search: name.trimmedAndEscaped()) { result in
            switch result {
            case .success(let result):
                if let result = result {
                    DispatchQueue.main.async {
                        switch number {
                        case .one:
                            self.moviesOne = result.map(MovieListViewModel.init)
                        case .two:
                            self.moviesTwo = result.map(MovieListViewModel.init)
                        }
                    }
                }
            case .failure(let error):
                print(error.localizedDescription)
                DispatchQueue.main.async {
                    //show error
                }
            }
        }
    }
    
}

struct MovieListViewModel {
    let movie: Movie
    
    var title: String {
        movie.title ?? ""
    }
    
    var imdbId: String {
        movie.imdbId ?? ""
    }
    
    var poster: String {
        movie.poster ?? ""
    }
    
    var year: String {
        movie.year ?? ""
    }
}
