//
//  Movie.swift
//  Netflix Clone
//
//  Created by User on 03.03.2024.
//

import Foundation

struct TrendingTitleResponse: Codable {
    let results: [Title]
    
}

struct Title: Codable {
    let id: Int
    let media_type: String?
    let original_language: String?
    let title: String?
    let poster_path: String?
    let overview: String?
    let vote_count: Int
    let release_date: String?
    let vote_average: Double

}
