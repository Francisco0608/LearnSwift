//
//  ViewController.swift
//  Clima
//
//  Created by Peng Dewei on 2019/7/1.
//  Copyright © 2019 Peng. All rights reserved.
//

import UIKit;
import CoreLocation;
import Alamofire;
import SwiftyJSON;

//delegate-委托，类似一种协议
class ViewController: UIViewController {
    let locationManager = CLLocationManager();
    let weather = Weather();
    let appid = "e550ea1966d439a9309fee1de73b9e94";
    
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate = self;
        
        locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters;//精度越高 耗电量越大
        locationManager.requestLocation();//就是获取一次地址
    }
    //页面出现事件
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated);
        locationManager.requestWhenInUseAuthorization();//授权获取当前位置
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let latitude = locations[0].coordinate.latitude;
        let longitude = locations[0].coordinate.longitude;
        
        let URLParameter = ["lat":"\(latitude)","lon":"\(longitude)","appid":appid];
        
        getWeatherData(paras:URLParameter);
    }
    
    //跨界面传值
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "selectCity"){
            let selecCity = segue.destination as! SelectCityController;
            //利用第二界面的变量 传值
            selecCity.cityValue = weather.city;
            //第二个页面的时间函数委托给这个controller实现，让干活的人知道谁是老板，谁委托给我干活
            selecCity.changeDelegate = self;
        }
     }
}
//实现协议之后 需要将协议中的某些函数 具体化
extension ViewController: CLLocationManagerDelegate,SelectCityDelegate{
    //将选择城市页面的数值传送到第一个页面中
    func didChangeCity(city: String) {
        let paras = ["q":city,"appid":appid];
        getWeatherData(paras: paras);
        
        dismiss(animated: true, completion: nil);
    }
    
    func getWeatherData(paras:[String:String]){
        //利用Alamofire
        Alamofire.request("https://api.openweathermap.org/data/2.5/weather",parameters: paras).responseJSON{
            response in
            if let json = response.result.value{
                let weather = JSON(json);
                //print(weather);
                self.createWeather(weatherJSON: weather);
                self.updateUI();
            }
        }
    }
    
    func createWeather(weatherJSON: JSON){
        weather.city = weatherJSON["name"].stringValue;
        weather.temp = Int(round(weatherJSON["main","temp"].doubleValue - 273.15));
        weather.condition = weatherJSON["weather",0,"id"].intValue;
    }
    
    func updateUI(){
        locationLabel.text = self.weather.city;
        tempLabel.text = String(self.weather.temp);
        imageView.image = UIImage(named: self.weather.icon);
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error);
    }
}

