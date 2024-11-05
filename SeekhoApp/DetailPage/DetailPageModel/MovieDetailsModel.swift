//
//  MovieDetailsModel.swift
//  SeekhoApp
//
//  Created by MacBook on 05/11/24.
//

import Foundation

struct MoviesDetails: Codable {
    let rank: Int?
    let title: String?
    let thumbnail: String?
    let rating, id: String?
    let year: Int?
    let image: String?
    let bigImage: String?
    let description: String?
    let trailer, trailerEmbedLink: String?
    let trailerYoutubeID: String?
    let genre, director, writers: [String]?
    let imdbid: String?
    let imdbLink: String?

    enum CodingKeys: String, CodingKey {
        case rank, title, thumbnail, rating, id, year, image
        case bigImage = "big_image"
        case description, trailer
        case trailerEmbedLink = "trailer_embed_link"
        case trailerYoutubeID = "trailer_youtube_id"
        case genre, director, writers, imdbid
        case imdbLink = "imdb_link"
    }
}

