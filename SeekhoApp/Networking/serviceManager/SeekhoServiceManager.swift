//
//  SeekhoServiceManager.swift
//  SeekhoApp
//
//  Created by MacBook on 30/10/24.
//

// ViewModels/YourViewModel.swift
import Foundation

protocol SeekhoServiceManagerProtocol{
   
    func fetchPopularMovies(completion: @escaping (Result<[PopularMovies], NetworkError>) -> Void)
    func fetchMovieDetails(movieId: String, completion: @escaping (Result<MoviesDetails, NetworkError>) -> Void)
    
}

final class SeekhoServiceManager:SeekhoServiceManagerProtocol  {

    // Fetch popular movies
    func fetchPopularMovies(completion: @escaping (Result<[PopularMovies], NetworkError>) -> Void) {
        let endpoint = Endpoints.getPopularMovies()
        APIClient.shared.fetch(endpoint: endpoint, completion: completion)
    }
       // Fetch movie details by ID
       func fetchMovieDetails(movieId: String, completion: @escaping (Result<MoviesDetails, NetworkError>) -> Void) {
           let endpoint = Endpoints.getMovieDetails(movieId: movieId)
           APIClient.shared.fetch(endpoint: endpoint, completion: completion)
       }

}



