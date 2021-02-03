//
//  Endpoint.swift
//  WeatherApp
//
//  Created by 박성민 on 2021/02/03.
//

import Foundation
import CoreLocation

let summaryEndpoint = "https://api.openweathermap.org/data/2.5/weather"
let forecastEndpoint = "https://api.openweathermap.org/data/2.5/forecast"

func composeUrlRequest(endpoint: String, from location: CLLocation) -> URLRequest {
    let urlStr = "\(endpoint)?lat=\(location.coordinate.latitude)&lon=\(location.coordinate.longitude)&appid=\(apiKey)&lang=kr&units=metric"
    let url = URL(string: urlStr)!
    return URLRequest(url: url)
}
