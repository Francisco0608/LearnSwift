//
//  main.swift
//  Day05
//
//  Created by Peng Dewei on 2019/7/1.
//  Copyright © 2019 Peng. All rights reserved.
//

import Foundation

let car = Car();

print(car.color);
class  Tesla: Car {
    override func dirve() {
        //想拥有父类
        self.dirve();
        //再写自己的逻辑
        
    }
    
}
