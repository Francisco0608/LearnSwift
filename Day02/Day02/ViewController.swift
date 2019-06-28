//
//  ViewController.swift
//  Day02
//
//  Created by Peng Dewei on 2019/6/28.
//  Copyright © 2019 Peng. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var ballImage: UIImageView!
    
    let imagesArray = ["ball1","ball2","ball3","ball4","ball5"];
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func askButtonClick(_ sender: UIButton) {
        
        let index: Int = Int.random(in: 0...4);
        
        ballImage.image = UIImage.init(named: imagesArray[index]);
    }
    
}

