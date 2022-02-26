//
//  Film.swift
//  MovieDb-AF
//
//  Created by Nurşah on 26.02.2022.
//

import Foundation

// MARK: - NowPlaying
struct Movie: Decodable {
    let results: [Results]

    enum CodingKeys: String, CodingKey {
        case results
    }
}

// MARK: - Result
struct Results: Decodable {
    let id: Int
    let originalTitle, overview: String
    let popularity: Double
    let posterPath, releaseDate, title: String
    let voteAverage: Double
    let voteCount: Int

    enum CodingKeys : String, CodingKey {
        case id
        case originalTitle = "original_title"
        case overview, popularity
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case title
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}

