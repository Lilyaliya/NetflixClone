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
    static let headers = [
        "accept": "application/json",
        "Authorization": "Bearer \(Contents.ACCESS_TOKEN)"
    ]
}

enum APIError: Error{
    case failedToGetData
}

class APICaller{
    static let shared = APICaller()
    
    func getTrendingMovies(completion: @escaping (Result<[Title], Error>) -> Void){
        guard let url = NSURL(string: "\(Contents.baseURL)/3/trending/movie/day?language=ru-RU") as? URL
        else{
            return
        }
        
        let request = NSMutableURLRequest(url: url,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = Contents.headers
        
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
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                completion(.success(results.results))
            }
            catch{
                completion(.failure(APIError.failedToGetData))
            }
            
        })
        
        task.resume()
        
    }
    
    func getTrendingTvs(completion: @escaping (Result<[Title], Error>) -> Void){
        guard let url = NSURL(string: "\(Contents.baseURL)/3/trending/tv/day?language=ru-RU") as? URL
        else{
            return
        }
        
        let request = NSMutableURLRequest(url: url,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = Contents.headers
        
        let task = URLSession.shared.dataTask(with: request as URLRequest, completionHandler: {(data, response, error) -> Void in
            guard let data = data, error == nil else{
                print(error as Any)
                return
            }
            
            do{
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                completion(.success(results.results))
            }catch{
                completion(.failure(APIError.failedToGetData))
            }
        })
        
        task.resume()
    }
    
//    https://api.themoviedb.org/3/movie/upcoming?language=en-US&page=1
    
    func getUpcomingMovies(completion: @escaping (Result<[Title], Error>) -> Void){
        guard let url = NSURL(string: "\(Contents.baseURL)/3/movie/upcoming?language=ru-RU&page=1") as? URL
        else{
            return
        }
        
        let request = NSMutableURLRequest(url: url,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = Contents.headers
        
        let task = URLSession.shared.dataTask(with: request as URLRequest, completionHandler: {(data, response, error) -> Void in
            
            guard let data = data, error == nil else{
                print(error as Any)
                return
            }
            
            do{
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                completion(.success(results.results))
            }
            catch{
                completion(.failure(APIError.failedToGetData))
            }
        })
        
        task.resume()
    }
    
//    https://api.themoviedb.org/3/movie/popular?language=en-US&page=1
    
    func getPopularMovies(completion: @escaping (Result<[Title], Error>) -> Void){
        guard let url = NSURL(string: "\(Contents.baseURL)/3/movie/popular?language=ru-RU&page=1") as? URL
        else{
            return
        }
        
        let request = NSMutableURLRequest(url: url,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = Contents.headers
        
        let task = URLSession.shared.dataTask(with: request as URLRequest, completionHandler: {(data, response, error) -> Void in
            guard let data = data, error == nil else{
                print(error as Any)
                return
                }
            
            do{
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                completion(.success(results.results))
            }
            catch{
                completion(.failure(APIError.failedToGetData))
            }
        })
        
        task.resume()
    }
    
//    https://api.themoviedb.org/3/movie/top_rated?language=en-US&page=1
    
    func getTopRatedMovies(completion: @escaping (Result<[Title], Error>) -> Void){
        guard let url = NSURL(string: "\(Contents.baseURL)/3/movie/top_rated?language=ru-RU&page=1") as? URL
        else{
            return
        }
        
        let request = NSMutableURLRequest(url: url, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = Contents.headers
        
        let task = URLSession.shared.dataTask(with: request as URLRequest, completionHandler: {(data, response, error) -> Void in
            guard let data = data, error == nil else{
                print(error as Any)
                return
            }
            
            do{
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                completion(.success(results.results))
            }catch{
                completion(.failure(APIError.failedToGetData))
            }
        })
        
        task.resume()
    }
    
    // https://api.themoviedb.org/3/discover/movie?include_adult=false&include_video=false&language=ru-RU&page=1&sort_by=popularity.desc

    func getDiscoverMovies(completion: @escaping (Result<[Title], Error>) -> Void) {
        guard let url = NSURL(string: "\(Contents.baseURL)/3/discover/movie?include_adult=false&include_video=false&language=ru-RU&page=1&sort_by=popularity.desc") as? URL
        else {
            return
        }
        
        let request = NSMutableURLRequest(url: url, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = Contents.headers
        
        let task = URLSession.shared.dataTask(with: request as URLRequest, completionHandler: {(data, response, error) -> Void in
            guard let data = data, error == nil else{
                print(error as Any)
                return
            }
            
            do{
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                completion(.success(results.results))
            }catch{
                completion(.failure(APIError.failedToGetData))
            }
        })
        
        task.resume()
    }
    
//    https://api.themoviedb.org/3/search/movie?query=%D0%B0%D0%BD&include_adult=false&language=ru-RU&page=1
    func search(with query: String, completion: @escaping (Result<[Title], Error>) -> Void) {
        guard let query = query.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) else {
            return
        }
        guard let url = NSURL(string: "\(Contents.baseURL)/3/search/movie?query=\(query)&include_adult=false&language=ru-RU&page=1") as? URL
        else {
            return
        }
        
        let request = NSMutableURLRequest(url: url, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = Contents.headers
        
        let task = URLSession.shared.dataTask(with: request as URLRequest, completionHandler: {(data, response, error) -> Void in
            guard let data = data, error == nil else{
                print(error as Any)
                return
            }
            
            do{
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                completion(.success(results.results))
            }catch{
                completion(.failure(APIError.failedToGetData))
            }
        })
        
        task.resume()
    }
    
}


