//
//  WeatherApi.swift
//  WeatherApp
//
//  Created by 박성민 on 2021/02/03.
//

import Foundation
import RxSwift
import RxCocoa
import CoreLocation
import NSObject_Rx

class OpenWeatherMapApi: NSObject, WeatherApiType {
    private let summaryRelay = BehaviorRelay<WeatherDataType?>(value: nil)
    private let forecastRelay = BehaviorRelay<[WeatherDataType]>(value: [])
    private let urlSession = URLSession.shared
    
    private func fetchSummary(location: CLLocation) -> Observable<WeatherData?> {
        let request = composeUrlRequest(endpoint: summaryEndpoint, from: location)

        return urlSession.rx.data(request: request)
            .map { data -> CurrentWeather in
                let decoder = JSONDecoder()
                return try decoder.decode(CurrentWeather.self, from: data)
            }
            .map { WeatherData(summary: $0) }
            .catchAndReturn(nil)
    }

    private func fetchForcast(location: CLLocation) -> Observable<[WeatherData]> {
        let request = composeUrlRequest(endpoint: forecastEndpoint, from: location)
        
        return urlSession.rx.data(request: request)
            .map { data -> [WeatherData] in
                let decoder = JSONDecoder()
                let forcast = try decoder.decode(Forecast.self, from: data)
                
                return forcast.list.map(WeatherData.init)
            }
            .catchAndReturn([])
    }
    
    
    @discardableResult
    func fetch(location: CLLocation) -> Observable<(WeatherDataType?, [WeatherDataType])> {
        let summary = fetchSummary(location: location)
        let forecast = fetchForcast(location: location)
        
        Observable.zip(summary, forecast)
            .subscribe(onNext: { [weak self] result in
                self?.summaryRelay.accept(result.0)
                self?.forecastRelay.accept(result.1)
            })
            .disposed(by: rx.disposeBag)
        
        return Observable.combineLatest(summaryRelay.asObservable(), forecastRelay.asObservable())
    }
}
