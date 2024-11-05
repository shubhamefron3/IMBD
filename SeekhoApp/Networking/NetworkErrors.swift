//
//  NetworkErrors.swift
//  SeekhoApp
//
//  Created by MacBook on 30/10/24.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case requestFailed
    case decodingFailed
    case serverError(String)
}
