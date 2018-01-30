//
//  ViewController.swift
//  HelloWorld
//
//  Created by Ethan Hargus on 1/28/18.
//  Copyright © 2018 Ethan Hargus. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var NumCount: UILabel!
    @IBOutlet weak var HelloBtn: UIButton!
    @IBOutlet weak var ClickProgress: UIProgressView!
    @IBOutlet weak var Stepper: UIStepper!
    var clickCount = 0
    var toAdd = 1
    var curProg: Float = 0
    var timer = Timer()
    var timeWait: Float = 50
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func HelloPressed(_ sender: Any) {
        clickCount += toAdd
        curProg = 0
        NumCount.text = String(clickCount)
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: "setProgressBar", userInfo: nil, repeats: false)
    }
    @IBAction func StepPressed(_ sender: Any) {
        toAdd = Int(Stepper.value)
    }
    func setProgressBar() {
        while curProg < timeWait {
            HelloBtn.isEnabled = false
            ClickProgress.progress = curProg / timeWait
            curProg += 1
        }
        HelloBtn.isEnabled = true
    }

}

