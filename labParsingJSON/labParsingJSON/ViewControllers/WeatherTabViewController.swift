//
//  WeatherTabViewController.swift
//  labParsingJSON
//
//  Created by Levi Davis on 8/27/19.
//  Copyright © 2019 Levi Davis. All rights reserved.
//

import UIKit

class WeatherTabViewController: UIViewController {
    
    var weatherResults = [Cities]() {
        didSet {
            weatherTableView.reloadData()
        }
    }

    @IBOutlet weak var weatherTableView: UITableView!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is WeatherDetailViewController {
            guard let indexPath = weatherTableView.indexPathForSelectedRow,
                let weatherVC = segue.destination as? WeatherDetailViewController else {return}
            let oneWeather = weatherResults[indexPath.row]
            weatherVC.oneWeather = oneWeather
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        weatherTableView.dataSource = self
        weatherTableView.delegate = self
        loadData()
        // Do any additional setup after loading the view.
    }
    
    private func loadData() {
        guard let pathToJSONFile = Bundle.main.path(forResource: "weather", ofType: "json") else {
            fatalError("Could Not Find JSON File")
        }
        let url = URL(fileURLWithPath: pathToJSONFile)
        do {
            let data = try Data(contentsOf: url)
            let cityWeatherFromJSON = try Cities.getWeatherData(from: data)
            weatherResults = cityWeatherFromJSON
        } catch {
            fatalError("\(error)")
        }
    }
    

}

extension WeatherTabViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weatherResults.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = weatherTableView.dequeueReusableCell(withIdentifier: "weatherCell", for: indexPath)
        let oneWeather = weatherResults[indexPath.row]
        cell.textLabel?.text = oneWeather.name
        cell.detailTextLabel?.text = "\(oneWeather.weather[0].description)"
        
        return cell
    }
    
    
}
