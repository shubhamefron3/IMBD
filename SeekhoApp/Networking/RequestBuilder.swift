//
//  RequestBuilder.swift
//  SeekhoApp
//
//  Created by MacBook on 30/10/24.
//

import Foundation

final class RequestBuilder {
    static func buildRequest(for url: URL,
                             method: String = "GET") -> URLRequest {
        
        var request = URLRequest(url: url)
        request.httpMethod = method
        request.allHTTPHeaderFields = ["x-rapidapi-key":"a267313099msh0f92d3ec52cd1ffp146109jsn5a919eb3081c"]
        // Add any necessary headers
        return request
    }
}
