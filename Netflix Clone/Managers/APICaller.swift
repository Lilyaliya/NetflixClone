//
//  APICaller.swift
//  Netflix Clone
//
//  Created by User on 03.03.2024.
//

import Foundation

struct Contents{
    static let API_KEY = "59f108b8589600a63233ebf2c17ec355"
    static let ACCESS_TOKEN =  "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI1OWYxMDhiODU4OTYwMGE2MzIzM2ViZjJjMTdlYzM1NSIsInN1YiI6IjY1ZTQ5NmEyMjBlNmE1MDE4NjUyY2Q4ZiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.K5dKGaNCSnZxJUb8LHylVFOTccqYl2k_q-FRWR_m0oE"
    static let baseURL = "https://api.themoviedb.org"
}

enum APIError: Error{
    case failedToGetData
}

class APICaller{
    static let shared = APICaller()
    
    func getTrendingMovies(completion: @escaping (Result<[Movie], Error>) -> Void){
        let headers = [
            "accept": "application/json",
            "Authorization": "Bearer \(Contents.ACCESS_TOKEN)"
        ]
        guard let url = NSURL(string: "\(Contents.baseURL)/3/trending/movie/day?language=ru-RU") as? URL
        else{
            return
        }
        
        let request = NSMutableURLRequest(url: url,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        let task = URLSession.shared.dataTask(with: request as URLRequest,
                                              completionHandler: {(data, response, error) -> Void in
//            if (error != nil){
//                print(error as Any)
//            }else{
//                let httpResponse = response as? HTTPURLResponse
//                print(httpResponse as Any)
//            }
            
            guard let data = data, error == nil else{
                print(error as Any)
                return
            }
            do {
                let results = try JSONDecoder().decode(TrendingMoviesResponse.self, from: data)
                completion(.success(results.results))
                print(results)
            }
            catch{
                completion(.failure(error))
            }
            
        })
        
        task.resume()
        
    }
}
