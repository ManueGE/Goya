//
//  ViewController.swift
//  goya
//
//  Created by Manu on 30/5/16.
//  Copyright © 2016 manuege. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var alterStyle = false
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func toggleStyle(_ sender: UIButton) {
        alterStyle = !alterStyle
        let name = alterStyle ? "alterStyle" : "style"
        label.gy_styleName = name
    }
}

