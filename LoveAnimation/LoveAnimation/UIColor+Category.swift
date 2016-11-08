//
//  AppDelegate.swift
//  LoveAnimation
//
//  Created by xiudou on 16/6/21.
//  Copyright © 2016年 xiudo. All rights reserved.
//

import UIKit

extension UIColor {
    
    class func randomColor() -> UIColor {
        return UIColor(red: randomNumber(), green: randomNumber(), blue: randomNumber() , alpha: 1.0)
    }
    
    class func randomNumber() -> CGFloat {
        // 0 ~ 255
        return CGFloat(arc4random_uniform(256)) / CGFloat(255)
    }
}
