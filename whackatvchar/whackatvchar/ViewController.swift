//
//  ViewController.swift
//  whackatvchar
//
//  Created by Shane White on 6/19/17.
//  Copyright © 2017 DMA. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var homerButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let width = self.view.frame.width;
        let height = self.view.frame.height;
        
        let homerXPos = random(lower: 0, upper: width - homerButton.frame.width);
        let homerYPos = random(lower: 0, upper: height - homerButton.frame.height);
        
        homerButton.setPosition(x: homerXPos, y: homerYPos);
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func homerTouchUpInside(_ sender: UIButton) {
        homerButton.isHidden = true;
        
        let width = self.view.frame.width;
        let height = self.view.frame.height;
        
        let margeXPos = random(lower: 0, upper: width - homerButton.frame.width);
        let margeYPos = random(lower: 0, upper: height - homerButton.frame.height);
        
        homerButton.setPosition(x: margeXPos, y: margeYPos);
        homerButton.isHidden = false;
    }


}

