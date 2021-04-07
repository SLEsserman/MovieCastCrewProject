//
//  URLExtensions.swift
//  MovieCastCrew
//
//  Created by Samuel Esserman on 4/7/21.
//

import Foundation

extension URL {
    static func forMoviesByName(_ name: String) -> URL? {
        return URL(string: "https://www.omdbapi.com/?s=\(name)&apikey=\(Constant.API_KEY)")
    }
    
    static func forMoviesDetailByImdbId(_ imdbId: String) -> URL? {
        return URL(string: "https://www.omdbapi.com/?i=\(imdbId)&apikey=\(Constant.API_KEY)")
    }
}
