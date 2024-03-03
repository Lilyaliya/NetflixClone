//
//  Tv.swift
//  Netflix Clone
//
//  Created by User on 03.03.2024.
//

import Foundation

struct TrendingTvsResponse: Codable{
    let results: [Tv]
}

struct Tv: Codable{
    let id: Int
    let media_type: String?
    let original_language: String?
    let name: String?
    let poster_path: String?
    let overview: String?
    let vote_count: Int
    let first_air_date: String?
    let vote_average: Double
}
