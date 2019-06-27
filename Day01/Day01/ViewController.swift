//
//  ViewController.swift
//  Day01
//
//  Created by Peng Dewei on 2019/6/26.
//  Copyright © 2019 Peng. All rights reserved.
//

import UIKit;

class ViewController: UIViewController {
    var imageIndex1: Int = 0;
    var imageIndex2: Int = 0;
    
    let imageArray = ["dice1","dice2","dice3","dice4","dice5","dice6"];
    
    @IBOutlet weak var diceImageView: UIImageView!;
    @IBOutlet weak var diceImageView2: UIImageView!;
    
    @IBAction func rollButton(_ sender: Any) {
        changDiceImage();
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        changDiceImage();
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        changDiceImage();
    }
    
    private func changDiceImage() {
        //...表示区间
        imageIndex1 = Int.random(in: 0...5);
        imageIndex2 = Int.random(in: 0...5);
        
        diceImageView.image = UIImage.init(named: imageArray[imageIndex1]);
        diceImageView2.image = UIImage.init(named: imageArray[imageIndex2]);
    }
    
    

}

