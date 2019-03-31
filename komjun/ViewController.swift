//
//  ViewController.swift
//  komjun
//
//  Created by Farhia Mohamed on 2019-03-30.
//  Copyright © 2019 Komjun. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {
    
    @IBOutlet weak var fab: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        fab.layer.cornerRadius = 24
        fab.layer.masksToBounds = true
        fab.layer.zPosition = 1
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func newReportPressed() {
        print("Button pressed!!")
    }


}

