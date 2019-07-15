//
//  SelectCityController.swift
//  Clima
//
//  Created by Peng Dewei on 2019/7/3.
//  Copyright © 2019 Peng. All rights reserved.
//

import UIKit
//protocol 协议 定义委托
protocol SelectCityDelegate {
    func didChangeCity(city: String);
}

class SelectCityController: UIViewController {
    //初始化委托，用？表示并不一定要change city
    var changeDelegate: SelectCityDelegate?;
    
    var cityValue: String = "";
    @IBOutlet weak var currentCity: UILabel!
    @IBOutlet weak var inputCity: UITextField!
    
    @IBAction func dismiss(_ sender: Any) {
        dismiss(animated: true, completion: nil);
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        //借助传值 降当前城市的label赋值
        currentCity.text = cityValue;
    }
    
    @IBAction func changeCity(_ sender: Any) {
        changeDelegate?.didChangeCity(city: inputCity.text!);
    }

   

}
