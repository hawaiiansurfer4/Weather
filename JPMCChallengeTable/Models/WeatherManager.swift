//
//  WeatherManager.swift
//  JPMCChallengeTable
//
//  Created by Sean Murphy on 8/12/22.
//

import Foundation

protocol WeatherManagerDelegate {
    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel)
    func didFailWithError(error: Error)
}

struct WeatherManager {
    var delegate: WeatherManagerDelegate?

  
    
    func fetchData() {
        guard let weatherURL = URL(string: "https://www.7timer.info/bin/astro.php?lon=113.2&lat=23.1&ac=0&unit=metric&output=json&tzshift=0") else {
            return
        }
        
        URLSession.shared.dataTask(with: weatherURL) { data, response, error in
                   guard let data = data, error == nil else {
                       return
                   }
                   
                   do {
                       if let weatherInfo = self.parseData(data: data) {
                           self.delegate?.didUpdateWeather(self, weather: weatherInfo)
                       }

                   } catch {
                       fatalError("Error fetching data")
                   }
               }.resume()
           }
    
    func parseData(data: Data) -> WeatherModel? {
        var toBeReturned: WeatherModel?
        do {
            toBeReturned = try JSONDecoder().decode(WeatherModel.self, from: data)
            print(toBeReturned?.product)
            print(toBeReturned?.dataseries.count)
            print(toBeReturned?.dataseries[0].timepoint)
            print(toBeReturned?.dataseries[0].wind10M.direction)
            print(toBeReturned?.dataseries[0].wind10M.speed)

        } catch {
            fatalError("Unable to parse data")
        }

        return toBeReturned
    }
}
