//
//  ViewController.swift
//  iOS Test
//
//  Created by Talha Qamar on 27/3/18.
//  Copyright © 2018 devtalha.com. All rights reserved.
//

import UIKit
import JASON

class ViewController: UIViewController {

override func viewDidLoad() {
super.viewDidLoad()


    }
override func didReceiveMemoryWarning() {
super.didReceiveMemoryWarning()
// Dispose of any resources that can be recreated.
}



func loadData() -> String
{
let url = "https://dl.dropboxusercontent.com/s/2iodh4vg0eortkl/facts.json"
  
 URLSession.shared.dataTask(with: URL(string: url)!) { (data, res, err) in

        if let d = data {
            if let value = String(data: d, encoding: String.Encoding.ascii) {

                if let jsonData = value.data(using: String.Encoding.utf8) {
                    do {
                        let json = try JSONSerialization.jsonObject(with: jsonData, options: []) as! [String: Any]

print(json["title"]!)
                        if let arr = json["rows"] as? [[String: Any]] {
                            debugPrint(arr)


                        }

                    } catch {
                        NSLog("ERROR \(error.localizedDescription)")
                    }
                }
            }

        }
        }.resume()
        
	return "";
}


}

