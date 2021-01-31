//
//  WeatherDataType.swift
//  WeatherApp
//
//  Created by 박성민 on 2021/01/31.
//

import Foundation

protocol WeatherDataType {
    var date: Date? { get }
    var icon: String { get }
    var description: String { get }
    var temperature: Double { get }
    var maxTemperature: Double? { get }
    var minTemperature: Double? { get }
}
