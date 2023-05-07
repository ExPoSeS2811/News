//
//  ApiManager.swift
//  News
//
//  Created by MacBook Pro 13 2019 on 5/5/23.
//

import UIKit

final class ApiManager {
    private static let apiKey = "c8c3095b85b74894b9de95e862a0cbbc"
    private static let baseUrl = "https://newsapi.org/v2/"
    private static let path = "everything"

    // Handle response
    private static func handleResponse(
        data: Data?,
        error: Error?,
        completion: @escaping (Result<[ArticleResponseObject], Error>) -> ()) {
            if let error = error {
                completion(.failure(NetworkingError.networkingError(error)))
            } else if let data = data {
                do {
                    let model = try JSONDecoder().decode(NewsResponseObject.self, from: data)
                    completion(.success(model.articles))
                } catch let decodeError {
                    completion(.failure(decodeError))
                }
            } else {
                completion(.failure(NetworkingError.unknown))
            }
    }
    
    // Create url path and make request
    static func getNews(completion: @escaping (Result<[ArticleResponseObject], Error>) -> ()) {
        let stringUrl = baseUrl + path + "?sources=bbc-news&language=en" + "&apiKey=\(apiKey)"
        
        guard let url = URL(string: stringUrl) else { return }
        
        let session = URLSession.shared.dataTask(with: url) { data, _, error in
            handleResponse(data: data, error: error, completion: completion)
        }
        
        session.resume()
    }
    
    static func getImageData(url: String, completion: @escaping (Result<Data, Error>) -> ()) {
        guard let url = URL(string: url) else { return }
        
        let session = URLSession.shared.dataTask(with: url) { data, _, error in
            if let data = data {
                completion(.success(data))
            }
            
            if let error = error {
                completion(.failure(error))
            }
        }
        
        session.resume()
    }
}
