//
//  gridView.swift
//  practice06
//
//  Created by FISH on 2019/3/16.
//  Copyright © 2019 FISH. All rights reserved.
//

import UIKit

class gridView: UIView {

    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        let path = UIBezierPath()
        let lineW: CGFloat = 4
        let squareW: CGFloat = 100
        let lineInterval = lineW + squareW
        
        func drawLine(_ path: UIBezierPath, _ start: CGPoint, _ end: CGPoint) {
            path.move(to: start)
            path.addLine(to: end)
        }
        // row line
        drawLine(path, CGPoint(x: 0, y: lineW / 2), CGPoint(x: rect.width, y: lineW / 2))
        drawLine(path, CGPoint(x: 0, y: lineW / 2 + lineInterval), CGPoint(x: rect.width, y: lineW / 2 + lineInterval))
        drawLine(path, CGPoint(x: 0, y: lineW / 2 + lineInterval * 2), CGPoint(x: rect.width, y: lineW / 2 + lineInterval * 2))
        drawLine(path, CGPoint(x: 0, y: rect.height - lineW / 2), CGPoint(x: rect.width, y: rect.height - lineW / 2))
        // column line
        drawLine(path, CGPoint(x: lineW / 2, y: 0), CGPoint(x: lineW / 2, y: rect.height))
        drawLine(path, CGPoint(x: lineW / 2 + lineInterval, y: 0), CGPoint(x: lineW / 2 + lineInterval, y: rect.height))
        drawLine(path, CGPoint(x: lineW / 2 + lineInterval * 2, y: 0), CGPoint(x: lineW / 2 + lineInterval * 2, y: rect.height))
        drawLine(path, CGPoint(x: rect.width - lineW / 2, y: 0), CGPoint(x: rect.width - lineW / 2, y: rect.height))
        
        path.lineWidth = lineW
        path.stroke()
    }
 

}
