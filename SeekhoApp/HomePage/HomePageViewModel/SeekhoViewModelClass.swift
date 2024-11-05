//
//  SeekhoViewModelClass.swift
//  SeekhoApp
//
//  Created by MacBook on 30/10/24.
//

import Foundation

protocol SeekhoVMInputProtocol {
    //to get input from viewmodel
    func getPopularMovies()
    func didTapAction(_ index: Int)
}

protocol SeekhoVMOutputputProtocol {
    //to get output from viewmodel
    func reload()
    func didPresentDetailView(viewModel:DetailPageTypeProtocol)
}

protocol SeekhoVMTypeProtocol {
    //properties ,func which can be accessed outside, used here
    var popularMoviesModel: [PopularMovies]? { get}
    var input: SeekhoVMInputProtocol {get}
}

final class SeekhoViewModelClass: SeekhoVMTypeProtocol,SeekhoVMInputProtocol {
    
    var input: SeekhoVMInputProtocol { return self }
    var popularMoviesModel: [PopularMovies]? {
        return popularMoviesData ?? nil
    }
    
    private var popularMoviesData: [PopularMovies]?
    private var networkMananger: SeekhoServiceManagerProtocol?
    private var delegate:SeekhoVMOutputputProtocol?
    
    init(delegate: SeekhoVMOutputputProtocol? = nil) {
    //init
        self.delegate = delegate
        self.networkMananger = SeekhoServiceManager()
    }
    
    func getPopularMovies(){
        //as TMBD not working in india
        //using Rapid APi reference for top 100 movies here
        networkMananger?.fetchPopularMovies(completion: { [weak self] result in
            switch result {
            case .success(let success):
                self?.popularMoviesData = success
                self?.delegate?.reload()
            case .failure(let failure):
                print(failure)
            }
        })
    }
    
    func didTapAction(_ index: Int) {
        if let id = popularMoviesModel?[index].id {
            let viewModel = DetailPageViewmodel(id: id)
            delegate?.didPresentDetailView(viewModel: viewModel)
        }
       
    }
}

