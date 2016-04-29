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
        

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func findWeather() {
        let sanitizedUserText = sanitizeCityInput(userCity.text!)
        print(sanitizedUserText as String!)
        let url = NSURL(string: "http://www.weather-forecast.com/locations/" +  sanitizedUserText + "/forecasts/latest")
        
        // check that url exists, before forcing it with `!`
        if url != nil {
            let task = NSURLSession.sharedSession().dataTaskWithURL(url!, completionHandler: {
                (data, response, error) -> Void in
                
                var urlError = false
                var weatherPhrase = ""
                
                if error == nil {
                    // Extract phrase from data and put in weatherPhrase
                    let urlContent = NSString(data: data!, encoding: NSUTF8StringEncoding) as NSString!
                    let urlContentSplitByPhrase = urlContent.componentsSeparatedByString("<span class=\"phrase\">")
                    if urlContentSplitByPhrase.count > 1 {
                        var urlContentSplitByCloseSpan = urlContentSplitByPhrase[1].componentsSeparatedByString("</span>")
                        weatherPhrase = urlContentSplitByCloseSpan[0] as String!
                        weatherPhrase = weatherPhrase.stringByReplacingOccurrencesOfString("&deg;", withString: "º")
                    } else {
                        urlError = true // error parsing html
                    }
                } else {
                    urlError = true // error returned from task
                }
                
                dispatch_async(dispatch_get_main_queue()) {
                    if !urlError {
                        self.outputText.text = weatherPhrase
                    } else {
                        self.showError()
                    }
                }
                
            })
            task.resume()
        } else {
            showError()
        }
    }
    
    func sanitizeCityInput (userText: String) -> String {
        return userText.stringByReplacingOccurrencesOfString(" ", withString: "-")
    }
    
    func showError() {
        outputText.text = "Was not able to find weather for \(userCity.text!). Please try again"
    }
    
    @IBAction func getWeatherButtonPressed(sender: AnyObject) {
        findWeather()
    }
}

