//
//  StaticLocationProvider.swift
//  WeatherApp
//
//  Created by 박성민 on 2021/02/03.
//

import Foundation
import CoreLocation
import RxSwift

struct StaticLocationProvider: LocationProviderType {
    
    @discardableResult
    func currentLocation() -> Observable<CLLocation> {
        return Observable.just(CLLocation.gangnamStation)
    }
    
    @discardableResult
    func currentAddress() -> Observable<String> {
        return Observable.just("강남역")
    }
    
}
