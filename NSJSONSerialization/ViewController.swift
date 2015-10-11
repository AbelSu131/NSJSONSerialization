//
//  ViewController.swift
//  NSJSONSerialization
//
//  Created by abel on 15/10/11.
//  Copyright © 2015年 abel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let label:UILabel = UILabel(frame: CGRectMake(100, 100,300,100))
        label.text = "输出在控制台"
        self.view.addSubview(label)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //测试json
    func testJson(){
        //Swift对象
        let user = [
            "uname" : "张三",
            "tel" : ["mobile": "138", "home": "010"]
        ]
        //首先判断能不能转换
        if (!NSJSONSerialization.isValidJSONObject(user)){
            print("is not a valid json object")
            return
        }
        //利用OC的json库转换成OC的NSData
        //如果设置options为NSJSONWritingOptions.PrettyPrinted,则打印格式更好阅读
    
        let data : NSData! = NSJSONSerialization.dataWithJSONObject(user, options: nil,error:nil)
        //NSData转换成NSString打印输出
        let str = NSString(data: data, encoding: NSUTF8StringEncoding)
        //输出json字符串
        print("Json Str:");
        print(str)
        
        //把NSData对象转回JSON对象
        let json : AnyObject! = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.AllowFragments,error:nil)
        print("Json Object:")
        print(json)
        //验证JSON对象可用性
        let uname:AnyObject = json.objectForKey("uname")!
        let mobile:AnyObject = json.objectForKey("tel")!.objectForKey("mobile")!
        print("get Json Object:")
        print("uname: \(uname),mobile: \(mobile)")
        
        
    }


}

