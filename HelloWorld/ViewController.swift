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
    @IBOutlet weak var AutoTestBtn: UIButton!
    @IBOutlet weak var Stepper: UIStepper!
    @IBOutlet weak var DebugTextAdd: UILabel!
    @IBOutlet weak var PriceAutoLabel: UILabel!
    
    var clickCount = 0
    var toAdd = 1
    var curProg: Float = 0
    var timer = Timer()
    var timeWait: Float = 50
    var amountAuto: Int = 0
    var autoPrice = 100
    
    //removes status bar because its annoying
    override var prefersStatusBarHidden: Bool {
        return true
    }
    //basically starts our main loops and kicks everything off. The exe of the program, so to speak
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.ClickProgress.progress = 1
        addLoop()
        Update()
    }

    //adds an auto clicker
    @IBAction func AutoBtnPressed(_ sender: Any) {
        amountAuto += 1
        self.clickCount -= self.autoPrice
        self.autoPrice = (self.autoPrice * 133) / 100
        
        
        
    }
    //loops infinitely, adds clicks from autoclickers
    func addLoop() {
        timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true, block: {timer in
            var loopAdd = 0
            loopAdd = self.amountAuto * 4
            self.clickCount += loopAdd
        })
    }
    //Main loop that does stuff
    func Update() {
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block: {timer in
            self.NumCount.text = String(self.clickCount)
            self.DebugTextAdd.text = String(Int(self.Stepper.value))
            self.PriceAutoLabel.text = String(self.autoPrice)
            if self.clickCount >= self.autoPrice {
                self.AutoTestBtn.isEnabled = true
            } else {
                self.AutoTestBtn.isEnabled = false
            }
        })
    }
    //activates when the big button is pressed
    @IBAction func HelloPressed(_ sender: Any) {
        self.HelloBtn.isEnabled = false
        clickCount += toAdd
        self.ClickProgress.progress = 0
        NumCount.text = String(clickCount)
        timer = Timer.scheduledTimer(withTimeInterval: 0.2, repeats: true, block: {timer in
            let change: Float = 0.1
            self.ClickProgress.progress = self.ClickProgress.progress + (change)
            if self.ClickProgress.progress >= 1.0 {
                self.timer.invalidate()
                self.HelloBtn.isEnabled = true
            }
        })
    }
    //debug function. Increases amount from each click
    @IBAction func StepPressed(_ sender: Any) {
        toAdd = Int(Stepper.value)
    }

}

