//
//  ViewController.swift
//  SliderPractice
//
//  Created by Mehdi Salemi on 2016-03-23.
//  Copyright © 2016 MxMd. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let videoLength : Float =  10.000 //seconds
    var timerOn = false
    var timerStartedAt : Float!
    
    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var sliderPercent: UILabel!
    
    @IBOutlet weak var timeSlider: UISlider!
    @IBAction func timeChange(sender: UISlider) {
        sliderPercent.text = "\(String(format: "%.3f", sender.value))"
        if timerOn == true {
            time.text = getTimeForTimer(sender.value)
        } else {
            timerStartedAt = sender.value
        }
    }
    
    @IBOutlet weak var startTimeButton: UIButton!
    @IBAction func startTimer(sender: UIButton) {
        if (timerOn == false){
            timerOn = true
            startTimeButton.setTitle("Stop", forState: .Normal)
            resetTimer()
        } else {
            timerOn = false
            startTimeButton.setTitle("Start", forState: .Normal)
        }
    }
    
    @IBAction func resetTimer(sender: UIButton) {
        resetTimer()
    }
    
    func resetTimer(){
        time.text = "\(0.000)"
    }
    
    func getTimeForTimer(current : Float) -> String {
        let startPercent = timerStartedAt / 100
        let currentPercent = current / 100
        let time = String(format: "%.3f", videoLength * (currentPercent - startPercent))
        
        return time
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

