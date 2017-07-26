//
//  FaceView.swift
//  FaceIt
//
//  Created by Rang, Winters on 08/07/2017.
//  Copyright © 2017 Rang, Winters. All rights reserved.
//

import UIKit

class FaceView: UIView {
    
    var scale: CGFloat = 0.90
    
    var curvature: Double = 0
    
    private var skullRadius: CGFloat {
        return min(bounds.size.width, bounds.size.height) / 2 * scale
    }
    
    private var skullCenter: CGPoint {
        return CGPoint(x: bounds.midX, y: bounds.midY)
    }
    
    
    
    private func getPath(center: CGPoint, radius: CGFloat) -> UIBezierPath {
        let path =  UIBezierPath(arcCenter: center, radius: radius, startAngle: 0.0, endAngle: CGFloat(2 * Double.pi), clockwise: false)
        path.lineWidth = 5;
        return path
        
    }
    private func getFace() -> UIBezierPath {
        return getPath(center: skullCenter, radius: skullRadius)
    }
    
    private enum Eye {
        case left
        case right
    }
    
    private func getEye(eye: Eye)-> UIBezierPath {
        var center = CGPoint()
        
        center.y = skullCenter.y - 50
        
        let radius = CGFloat(10)
        
        switch eye {
        case .left:
            
            center.x = skullCenter.x - 30
            
        case .right:
            
            center.x = skullCenter.x + 30
        }
        
        return getPath(center: center, radius: radius)
    }
    
    private func getMouth() -> UIBezierPath {
        let width = skullRadius / 1.1
        let height = skullRadius / 3
        
        let rect = CGRect(x: skullCenter.x - width/2, y: skullCenter.y + 60, width: width, height: height)
        
        let start = CGPoint(x: rect.minX, y: rect.minY)
        let end = CGPoint(x: rect.maxX, y: rect.minY)
        
        
        let offset = CGFloat(max(-1, min(curvature, 1))) * rect.height
        
        let cp1 = CGPoint(x: rect.minX + rect.width / 3, y:rect.minY + offset )
        let cp2 = CGPoint(x: rect.maxX - rect.width / 3, y: rect.minY + offset)
        
        let path = UIBezierPath()
        path.move(to: start)
        path.addCurve(to: end, controlPoint1: cp1, controlPoint2: cp2)
        return path
    }
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        
        
        UIColor.blue.set()
        getFace().stroke()
        getEye(eye: .left).stroke()
        getEye(eye: .right).stroke()
        getMouth().stroke()
    }
    
    
    
}
