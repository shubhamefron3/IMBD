//
//  Models.swift
//  SeekhoApp
//
//  Created by MacBook on 30/10/24.
//

// Models/YourMovieModel.swift
import Foundation

struct PopularMovies: Codable {
    let rank: Int?
    let title, description: String?
    let image, bigImage: String?
    let genre: [String]?
    let thumbnail: String?
    let rating, id: String?
    let year: Int?
    let imdbid: String?
    let imdbLink: String?

    enum CodingKeys: String, CodingKey {
        case rank, title, description, image
        case bigImage = "big_image"
        case genre, thumbnail, rating, id, year, imdbid
        case imdbLink = "imdb_link"
    }
}


