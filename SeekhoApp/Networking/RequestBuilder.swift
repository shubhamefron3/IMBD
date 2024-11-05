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
        request.allHTTPHeaderFields = ["x-rapidapi-key":"8ca6b57c06mshda403828015cc85p139808jsn871cb2c9416d"]
        // Add any necessary headers
        return request
    }
}
