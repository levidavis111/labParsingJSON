//
//  WeatherDetailViewController.swift
//  labParsingJSON
//
//  Created by Levi Davis on 8/27/19.
//  Copyright © 2019 Levi Davis. All rights reserved.
//

import UIKit

class WeatherDetailViewController: UIViewController {
    
    var oneWeather: Cities!
    
    @IBOutlet weak var cityLabelOutlet: UILabel!
    @IBOutlet weak var tempLableOutlet: UILabel!
    @IBOutlet weak var weatherLabelOutlet: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        // Do any additional setup after loading the view.
    }
    
    private func setUpView() {
        cityLabelOutlet.text = oneWeather.name
        tempLableOutlet.text = "Temp(C): \(oneWeather.main.temp)"
        weatherLabelOutlet.text = "Description: \(oneWeather.weather[0].description)"
    }

}
