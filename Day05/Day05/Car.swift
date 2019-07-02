//
//  Car.swift
//  Day05
//
//  Created by Peng Dewei on 2019/7/1.
//  Copyright © 2019 Peng. All rights reserved.
//

import Foundation

enum Type{
    case sport;
    case SUV;
    case sedan;
}

class Car{
    var color = "Red";
    var seat = 5;
    var type: Type = .sedan;
    func dirve(){
        
    }
}
