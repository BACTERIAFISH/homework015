//
//  ViewController.swift
//  practice06
//
//  Created by FISH on 2019/3/16.
//  Copyright © 2019 FISH. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var birthdayPicker: UIDatePicker!
    
    let dFomatter = DateFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dFomatter.dateFormat = "yyyyMMdd"
    }

    @IBAction func pressCalculateButton(_ sender: Any) {
        //birthdayStr = dFomatter.string(from: birthdayPicker.date)
        
        //print(sumBirthday(birthdayStr))
        //print(findLifeNumber(birthdayStr))
    }
    
    func sumBirthday(_ str: String) -> String {
        var sum = 0
        for s in str {
            if let n = Int(s.description) {
                sum += n
            }
        }
        let sumStr = sum.description
        if sumStr.count > 1 {
            return sumBirthday(sumStr)
        } else {
            return sum.description
        }
    }
    
    func findLifeNumber(_ str: String, _ arrOld: Array<String> = []) -> Array<String> {
        var sum = 0
        var arr = arrOld
        for s in str {
            if let n = Int(s.description) {
                sum += n
                if n != 0 {
                    arr.append(s.description)
                }
            }
        }
        let sumStr = sum.description
        if sumStr.count > 1 {
            return findLifeNumber(sumStr, arr)
        } else {
            arr.append(sumStr)
            return arr
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let birthdayStr = dFomatter.string(from: birthdayPicker.date)
        let controller = segue.destination as? AnsViewController
        controller?.sumStr = sumBirthday(birthdayStr)
        controller?.lifeArr = findLifeNumber(birthdayStr)
    }
}

