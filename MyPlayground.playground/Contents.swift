import UIKit

//var str = "Hello, playground"
//
//public func getMilk(name: String){
//    print("\(name)买牛奶");
//}
//
//getMilk(name: "老王");
//
//private func returnMoney(name: String,count: Int) -> Int{
//    var allMoney = 100;
//
//    print("\(name)买牛奶，一共拿了\(allMoney)元，其中一箱牛奶10块钱，找回\(allMoney - count * 10)");
//
//    return allMoney;
//}
//
//returnMoney(name: "老李", count: 7);

func love(boyName: String, girlName: String)->String{
    let num = Int.random(in: 0...10);
    
    if(num >= 5){
        return "\(boyName)love\(girlName)";
    }else{
        return "\(boyName)dontlove\(girlName)";
    }
}

love(boyName: "老王", girlName: "老李");




