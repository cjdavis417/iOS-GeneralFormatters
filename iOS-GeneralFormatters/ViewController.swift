//
//  ViewController.swift
//  iOS-GeneralFormatters
//
//  Created by Christopher Davis on 12/31/16.
//  Copyright © 2016 Monkey Face LLC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var todayDate: UILabel!
    @IBOutlet weak var dateFull: UILabel!
    @IBOutlet weak var dateLong: UILabel!
    @IBOutlet weak var dateMedium: UILabel!
    @IBOutlet weak var dateShort: UILabel!
    
    @IBOutlet weak var timeFull: UILabel!
    @IBOutlet weak var timeLong: UILabel!
    @IBOutlet weak var timeMedium: UILabel!
    @IBOutlet weak var timeShort: UILabel!
    
    
    let today = Date()
    let gf = Formatters()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        todayDate.text = String(describing: today)
        dateFull.text = gf.formattedDate(today, style: "full")
        dateLong.text = gf.formattedDate(today, style: "long")
        dateMedium.text = gf.formattedDate(today, style: "medium")
        dateShort.text = gf.formattedDate(today, style: "short")
        
        timeFull.text = gf.formattedDate(today, style: "full")
        timeLong.text = gf.formattedDate(today, style: "long")
        timeMedium.text = gf.formattedDate(today, style: "medium")
        timeShort.text = gf.formattedDate(today, style: "short")
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

