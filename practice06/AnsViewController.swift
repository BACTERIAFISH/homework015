//
//  AnsViewController.swift
//  practice06
//
//  Created by FISH on 2019/3/16.
//  Copyright © 2019 FISH. All rights reserved.
//

import UIKit

class AnsViewController: UIViewController {
    @IBOutlet weak var sumLabel: UILabel!
    @IBOutlet weak var circleView: UIView!
    var sumStr: String?
    var lifeArr: [String] = []
    var lifeDic: [String: Int] = [:]
    let bingoArr = [
        ["1", "2", "3"],
        ["4", "5", "6"],
        ["7", "8", "9"],
        ["1", "4", "7"],
        ["2", "5", "8"],
        ["3", "6", "9"],
        ["1", "5", "9"],
        ["3", "5", "7"]
    ]
    var bingoLineArr: [Int] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let sumStr = sumStr {
            sumLabel.text = "生命靈數： \(sumStr)"
        }
        //print(lifeArr)
        for n in lifeArr {
            if let t = lifeDic[n] {
                lifeDic[n] = t + 1
            } else {
                lifeDic[n] = 1
            }
        }
        //print(lifeDic)
        for (k, v) in lifeDic {
            switch k {
            case "1":
                for n in 0..<v {
                    drawRedCircle(CGFloat(n * 5 + 5), CGFloat(n * 5 + 5), CGFloat(98 - n * 10))
                }
            case "2":
                for n in 0..<v {
                    drawRedCircle(CGFloat(n * 5 + 109), CGFloat(n * 5 + 5), CGFloat(98 - n * 10))
                }
            case "3":
                for n in 0..<v {
                    drawRedCircle(CGFloat(n * 5 + 213), CGFloat(n * 5 + 5), CGFloat(98 - n * 10))
                }
            case "4":
                for n in 0..<v {
                    drawRedCircle(CGFloat(n * 5 + 5), CGFloat(n * 5 + 109), CGFloat(98 - n * 10))
                }
            case "5":
                for n in 0..<v {
                    drawRedCircle(CGFloat(n * 5 + 109), CGFloat(n * 5 + 109), CGFloat(98 - n * 10))
                }
            case "6":
                for n in 0..<v {
                    drawRedCircle(CGFloat(n * 5 + 213), CGFloat(n * 5 + 109), CGFloat(98 - n * 10))
                }
            case "7":
                for n in 0..<v {
                    drawRedCircle(CGFloat(n * 5 + 5), CGFloat(n * 5 + 213), CGFloat(98 - n * 10))
                }
            case "8":
                for n in 0..<v {
                    drawRedCircle(CGFloat(n * 5 + 109), CGFloat(n * 5 + 213), CGFloat(98 - n * 10))
                }
            case "9":
                for n in 0..<v {
                    drawRedCircle(CGFloat(n * 5 + 213), CGFloat(n * 5 + 213), CGFloat(98 - n * 10))
                }
            default:
                continue
            }
        }
        
        for i in 0..<bingoArr.count {
            var check: [Int] = []
            for b in bingoArr[i] {
                if lifeArr.contains(b) {
                    check.append(1)
                }
            }
            if check.count == 3 {
                bingoLineArr.append(i)
            }
        }
        
        for i in bingoLineArr {
            switch i {
            case 0:
                drawRedLine(4, 54, 312, 54)
            case 1:
                drawRedLine(4, 158, 312, 158)
            case 2:
                drawRedLine(4, 262, 312, 262)
            case 3:
                drawRedLine(54, 4, 54, 312)
            case 4:
                drawRedLine(158, 4, 158, 312)
            case 5:
                drawRedLine(262, 4, 262, 312)
            case 6:
                drawRedLine(4, 4, 312, 312)
//                let path = UIBezierPath()
//                path.move(to: CGPoint(x: 5, y: 4))
//                path.addLine(to: CGPoint(x: 312, y: 311))
//                path.addLine(to: CGPoint(x: 311, y: 312))
//                path.addLine(to: CGPoint(x: 4, y: 5))
//                path.close()
//                let layer = CAShapeLayer()
//                layer.path = path.cgPath
//                layer.fillColor = UIColor.red.cgColor
//                circleView.layer.addSublayer(layer)
            case 7:
                drawRedLine(312, 4, 4, 312)
//                let path = UIBezierPath()
//                path.move(to: CGPoint(x: 4, y: 311))
//                path.addLine(to: CGPoint(x: 311, y: 4))
//                path.addLine(to: CGPoint(x: 312, y: 5))
//                path.addLine(to: CGPoint(x: 5, y: 312))
//                path.close()
//                let layer = CAShapeLayer()
//                layer.path = path.cgPath
//                layer.fillColor = UIColor.red.cgColor
//                circleView.layer.addSublayer(layer)
            default:
                continue
            }
        }
        
    }
    
    func drawRedCircle(_ x: CGFloat, _ y: CGFloat, _ d: CGFloat) {
        let path = UIBezierPath(ovalIn: CGRect(x: x, y: y, width: d, height: d))
        let layer = CAShapeLayer()
        layer.path = path.cgPath
        layer.fillColor = UIColor.clear.cgColor
        layer.strokeColor = UIColor.red.cgColor
        layer.lineWidth = 2
        circleView.layer.addSublayer(layer)
    }
    
    func drawRedLine(_ x1: CGFloat, _ y1: CGFloat, _ x2: CGFloat, _ y2: CGFloat) {
        let path = UIBezierPath()
        path.move(to: CGPoint(x: x1, y: y1))
        path.addLine(to: CGPoint(x: x2, y: y2))
        let layer = CAShapeLayer()
        layer.path = path.cgPath
        layer.strokeColor = UIColor.red.cgColor
        layer.lineWidth = 2
        circleView.layer.addSublayer(layer)
    }
    
//    func drawRedLine(_ x: CGFloat, _ y: CGFloat, _ w: CGFloat, _ h: CGFloat) {
//        let path = UIBezierPath(rect: CGRect(x: x, y: y, width: w, height: h))
//        let layer = CAShapeLayer()
//        layer.path = path.cgPath
//        layer.fillColor = UIColor.red.cgColor
//        circleView.layer.addSublayer(layer)
//    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
