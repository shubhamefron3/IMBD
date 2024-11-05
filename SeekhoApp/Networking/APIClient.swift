//
//  APIClient.swift
//  SeekhoApp
//
//  Created by MacBook on 30/10/24.
//
import Foundation

class APIClient {
    
    static let shared = APIClient()
    
    private init() {}

    // Fetch method for GET requests
    func fetch<T: Decodable>(endpoint: URL, completion: @escaping (Result<T, NetworkError>) -> Void) {
        let request = RequestBuilder.buildRequest(for: endpoint)

        URLSession.shared.dataTask(with: request) { data, response, error in
            // Handle error and response (same as before)
            if let _ = error {
                completion(.failure(.requestFailed))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                let errorMessage = String(data: data ?? Data(), encoding: .utf8) ?? "Unknown error"
                completion(.failure(.serverError(errorMessage)))
                return
            }
            
            guard let data = data else {
                completion(.failure(.decodingFailed))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let decodedModel = try decoder.decode(T.self, from: data)
                completion(.success(decodedModel))
            } catch {
                completion(.failure(.decodingFailed))
            }
        }.resume()
    }

    // New method for POST requests
    func post<T: Encodable, R: Decodable>(endpoint: URL, body: T, completion: @escaping (Result<R, NetworkError>) -> Void) {
        var request = RequestBuilder.buildRequest(for: endpoint, method: "POST")
        
        do {
            let encoder = JSONEncoder()
            let jsonData = try encoder.encode(body)
            request.httpBody = jsonData
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        } catch {
            completion(.failure(.decodingFailed))
            return
        }

        URLSession.shared.dataTask(with: request) { data, response, error in
            // Handle error and response (similar to fetch)
            if let _ = error {
                completion(.failure(.requestFailed))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                let errorMessage = String(data: data ?? Data(), encoding: .utf8) ?? "Unknown error"
                completion(.failure(.serverError(errorMessage)))
                return
            }
            
            guard let data = data else {
                completion(.failure(.decodingFailed))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let decodedModel = try decoder.decode(R.self, from: data)
                completion(.success(decodedModel))
            } catch {
                completion(.failure(.decodingFailed))
            }
        }.resume()
    }
}
