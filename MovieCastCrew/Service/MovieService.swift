//
//  MovieService.swift
//  MovieCastCrew
//
//  Created by Samuel Esserman on 4/7/21.
//

import Foundation

enum NetworkError: Error {
    case badURL
    case noData
    case decodingError
}

class MovieService {
    func getMovieBy(search: String, completion: @escaping (Result<[Movie]?, NetworkError>) -> Void) {
        guard let url = URL.forMoviesByName(search) else {
            return completion(.failure(.badURL))
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                return completion(.failure(.noData))
            }
            
            guard let movieResponse = try? JSONDecoder().decode(MovieResponse.self, from: data) else {
                return completion(.failure(.decodingError))
            }
            
            return completion(.success(movieResponse.movies))
        }.resume()
    }
    
    func getMovieDetailBy(imdbId: String, completion: @escaping (Result<MovieDetail?, NetworkError>) -> Void) {
        guard let url = URL.forMoviesDetailByImdbId(imdbId) else {
            return completion(.failure(.badURL))
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                return completion(.failure(.noData))
            }
            
            guard let movieDetailsResponse = try? JSONDecoder().decode(MovieDetail.self, from: data) else {
                return completion(.failure(.decodingError))
            }
            
            return completion(.success(movieDetailsResponse))
        }.resume()
        
    }
}
