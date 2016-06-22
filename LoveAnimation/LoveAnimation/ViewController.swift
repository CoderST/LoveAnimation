//
//  ViewController.swift
//  LoveAnimation
//
//  Created by xiudou on 16/6/21.
//  Copyright © 2016年 xiudo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let window_width = UIScreen.mainScreen().bounds.width
    let window_height = UIScreen.mainScreen().bounds.height
    let loveHW:CGFloat = 30
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.lightGrayColor()
       let tapGesture = UITapGestureRecognizer(target: self, action: Selector("handleTapGesture:"))
        view.addGestureRecognizer(tapGesture)
        
        let longGesture = UILongPressGestureRecognizer(target: self, action: Selector("handleLongGesture:"))
        view.addGestureRecognizer(longGesture)
    }


    
    // MARK: - 手势事件
    func handleTapGesture(sender: UITapGestureRecognizer){
       let loveView = LoveView(frame: CGRect(x: 2 * loveHW, y: window_height - 2 * loveHW, width: loveHW, height: loveHW))
        // 先添加到界面上 不然不会调用draw方法
         view.addSubview(loveView)
        loveView.showAnimationWith(view)
       
    }
    
    func handleLongGesture(sender: UITapGestureRecognizer){
        
    }
}

