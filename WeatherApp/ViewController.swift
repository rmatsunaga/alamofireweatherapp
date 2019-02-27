//
//  ViewController.swift
//  WeatherApp
//
//  Created by Rey Matsunaga on 2/26/19.
//  Copyright © 2019 Rey Matsunaga. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    
    var weather = Weather()
    var result = Weather()
    
    let topLabel: UILabel = {
        let label = UILabel()
        label.text = "Seattle Weather"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let summary: UILabel = {
        let label = UILabel()
        label.text = "Loading..."
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let temperature: UILabel = {
        let label = UILabel()
        label.text = "Loading..."
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let icon: UILabel = {
        let label = UILabel()
        label.text = "Loading..."
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor  = .white
        
        
        
        
        let baseURL = "https://api.darksky.net/forecast/\(apiKey)/47.6062,-122.3321"
        AF.request(baseURL).responseData { response in
            // print("\(response)")
            let currently = try? JSONDecoder().decode(Fuck.self, from: response.data!)
            self.weather.summary = currently?.currently.summary
            self.weather.icon = currently?.currently.icon
            self.weather.temperature = currently?.currently.temperature
            self.view.layoutIfNeeded()
            
            self.summary.text = self.weather.summary!
            self.icon.text = self.weather.icon!
            self.temperature.text = String(self.weather.temperature!)
        }
        

        
        
        view.addSubview(summary)
        view.addSubview(icon)
        view.addSubview(temperature)
        view.addSubview(topLabel)
        
    }
    
    
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        topLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        topLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        topLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        
        summary.topAnchor.constraint(equalTo: topLabel.bottomAnchor, constant: 10).isActive = true
        summary.heightAnchor.constraint(equalToConstant: 30).isActive = true
//        summary.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        summary.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true

        icon.topAnchor.constraint(equalTo: summary.bottomAnchor, constant: 10).isActive = true
        icon.heightAnchor.constraint(equalToConstant: 30).isActive = true
//        icon.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        icon.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true

        temperature.topAnchor.constraint(equalTo: icon.bottomAnchor, constant: 10).isActive = true
        temperature.heightAnchor.constraint(equalToConstant: 30).isActive = true
//        temperature.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        temperature.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true

        

    }


}

