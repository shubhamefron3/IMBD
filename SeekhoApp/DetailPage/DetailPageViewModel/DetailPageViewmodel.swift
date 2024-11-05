//
//  DetailPageViewmodel.swift
//  SeekhoApp
//
//  Created by MacBook on 04/11/24.
//

import Foundation

protocol DetailPageInputProtocol {
    func initWith(delegate: DetailPageOutputProtocol)
    func getMoviesDetailbyID()
}
protocol DetailPageOutputProtocol {
    func updateUI(model: MoviesDetails)
}

protocol DetailPageTypeProtocol {
    var movieDetaildModel: MoviesDetails? { get}
    var input: DetailPageInputProtocol {get}
}

final class DetailPageViewmodel:DetailPageInputProtocol , DetailPageTypeProtocol {
    var input:DetailPageInputProtocol {return self}
    var delegate:DetailPageOutputProtocol?
    
    var movieDetaildModel: MoviesDetails? {
        return movieDetaildData ?? nil
    }
    
    private var movieDetaildData: MoviesDetails?
    private var movieId: String
    private let networkManager:SeekhoServiceManager
    
    init(id: String) {
        self.networkManager = SeekhoServiceManager()
        self.movieId = id
    }
    
    func initWith(delegate: DetailPageOutputProtocol) {
        self.delegate = delegate
    }
    
    func getMoviesDetailbyID(){
        networkManager.fetchMovieDetails(movieId: movieId, completion: { [weak self] result in
            switch result {
            case .success(let success):
                print(success)
                self?.movieDetaildData = success
                self?.delegate?.updateUI(model: success)
            case .failure(let failure):
                print(failure)
            }
        })
    }
}
