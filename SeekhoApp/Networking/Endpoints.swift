//
//  Endpoints.swift
//  SeekhoApp
//
//  Created by MacBook on 30/10/24.
//
import Foundation

struct Endpoints {
    static let baseURL = "https://imdb-top-100-movies.p.rapidapi.com/"
    static let apiKey = "b8351dfd4emsh7dc65d8d36b5dd3p19d3d4jsn4d35be0cf385" // Set your API key here
    
    static func getPopularMovies() -> URL {
        let components = URLComponents(string: baseURL + "")!
        return components.url!
    }
    
    static func getMovieDetails(movieId: String) -> URL {
        let components = URLComponents(string: baseURL + movieId)!
        return components.url!
    }
    
    static func getMovieVideos(movieId: Int) -> URL {
        let components = URLComponents(string: "\(baseURL)/\(movieId)/videos")!
        return components.url!
    }
}
