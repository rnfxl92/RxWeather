//
//  ApiError.swift
//  WeatherApp
//
//  Created by 박성민 on 2021/01/30.
//

import Foundation

enum ApiError: Error {
    case unknown
    case invalidUrl(String)
    case invalidResponse
    case failed(Int)
    case emptyData
}
