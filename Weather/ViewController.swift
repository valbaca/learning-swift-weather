//
//  ViewController.swift
//  Weather
//
//  Created by Val Baca on 2015-04-05.
//  Copyright (c) 2015 Val Baca. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var userCity: UITextField!
    @IBOutlet var getWeatherButton: UIButton!

    @IBOutlet var outputText: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // for first try, just pulling info for london and extracting the weather information (not interacting with the input text or button).
        var url = NSURL(string: "http://www.weather-forecast.com/locations/London/forecasts/latest")
        
        // check that url exists, before forcing it with `!`
        if url != nil {
            let task = NSURLSession.sharedSession().dataTaskWithURL(url!, completionHandler: {
                (data, response, error) -> Void in
                
                var urlError = false
                
                if error == nil {
                    var urlContent = NSString(data: data, encoding: NSUTF8StringEncoding)
                    println(urlContent)
                } else {
                    urlError = true
                }
                
                if urlError {
                    self.showError()
                }
            })
            task.resume()
        } else {
            showError()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func showError() {
        outputText.text = "Was not able to find weather for \(userCity.text). Please try again"
    }

    @IBAction func getWeatherButtonPressed(sender: AnyObject) {
    }
}

