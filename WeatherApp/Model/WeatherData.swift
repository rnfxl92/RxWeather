//
//  WeatherData.swift
//  WeatherApp
//
//  Created by 박성민 on 2021/01/31.
//

import Foundation

struct WeatherData: WeatherDataType, Equatable {
    let date: Date?
    let icon: String
    let description: String
    let temperature: Double
    let maxTemperature: Double?
    let minTemperature: Double?
}
