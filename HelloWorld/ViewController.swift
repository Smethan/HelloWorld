//
//  ViewController.swift
//  HelloWorld
//
//  Created by Ethan Hargus on 1/28/18.
//  Copyright © 2018 Ethan Hargus. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var HelloBtn: UIButton!
    
    @IBOutlet weak var WorkView: UIView!
    @IBOutlet weak var BackBtn: UIButton!
    @IBOutlet weak var WorkText: UITextView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func HelloPressed(_ sender: Any) {
        self.HelloBtn.isHidden = true
        self.WorkView.isHidden = false
        self.WorkText.isHidden = false
        self.BackBtn.isHidden = false
    }
    @IBAction func BackPressed(_ sender: Any) {
        self.HelloBtn.isHidden = false
        self.WorkView.isHidden = true
        self.WorkText.isHidden = true
        self.BackBtn.isHidden = true
    }
    

}

