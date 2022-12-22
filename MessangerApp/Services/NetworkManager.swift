//
//  NetworkManager.swift
//  MessangerApp
//
//  Created by Рафия Сафина on 20.12.2022.
//

import Foundation

enum NetworkError: Error {
    case noData
    case invalidUrl
    case decodingError
}

let apiKey = "Q7P3-LYXG-5YP8-8RJK"

class NetworkManager {
    
    static let shared = NetworkManager()
    
    private init() {}
    
    func fetchImage(from url: String?, completion: @escaping(Result<Data, NetworkError>) -> Void) {
        guard let url = URL(string: url ?? "") else {
            completion(.failure(.invalidUrl))
            return
        }
        DispatchQueue.global().async {
            guard let imageData = try? Data(contentsOf: url) else {
                completion(.failure(.noData))
                return
            }
            DispatchQueue.main.async {
                completion(.success(imageData))
            }
        }
    }
    
    func fetchData(from url: String, completion: @escaping (Result<Information, NetworkError>) -> Void) {
        
        guard let url = URL(string: url) else {
            completion(.failure(.invalidUrl))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                completion(.failure(.noData))
                return
            }
            
            do {
                let contacts = try JSONDecoder().decode(Information.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(contacts))
                }
            } catch {
                completion(.failure(.decodingError))
                print("aaaaaa")
            }
        }.resume()
    }
}
