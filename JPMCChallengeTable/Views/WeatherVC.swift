//
//  ViewController.swift
//  JPMCChallengeTable
//
//  Created by Sean Murphy on 8/11/22.
//

import UIKit



class WeatherVC: UITableViewController {
    
    var weatherArray: WeatherModel?


    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "WeatherCell", bundle: nil), forCellReuseIdentifier: "weatherCell")
        var manager = WeatherManager()
        manager.delegate = self
        manager.fetchData()
    }
    
    

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weatherArray?.dataseries.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "weatherCell", for: indexPath) as! WeatherCell
        let dataSeriesObj = weatherArray?.dataseries[indexPath.row]
        if let dataSeriesObj = dataSeriesObj {
            cell.timepointLabel.text = "Time Point: \(dataSeriesObj.timepoint)"
            cell.cloudCover.text = "Cloud Cover: \(dataSeriesObj.cloudcover)"
            cell.transparencyLabel.text = "Transparency: \(dataSeriesObj.transparency)"
        }
        if dataSeriesObj?.wind10M.direction == "E" {
            cell.windImage.image = UIImage(systemName: "wind")
        } else {
            cell.windImage.image = nil
        }
        
        return cell
    }

}

//MARK: - WeatherManagerDelegate

extension WeatherVC: WeatherManagerDelegate {
    
    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel) {

        weatherArray = weather
           DispatchQueue.main.async {
               self.tableView.reloadData()
           }
    }
    
    func didFailWithError(error: Error) {
        print(LocalizedError.self)
    }
}

