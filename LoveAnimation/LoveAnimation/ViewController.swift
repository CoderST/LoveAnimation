//
//  ViewController.swift
//  LoveAnimation
//
//  Created by xiudou on 16/6/21.
//  Copyright © 2016年 xiudo. All rights reserved.


import UIKit

class ViewController: UIViewController {
    
    var time:NSTimer?
    let window_width = UIScreen.mainScreen().bounds.width
    let window_height = UIScreen.mainScreen().bounds.height
    let loveHW:CGFloat = 30
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.lightGrayColor()
        // 添加点击手势
        let tapGesture = UITapGestureRecognizer(target: self, action: "handleTapGesture:")
        view.addGestureRecognizer(tapGesture)
        
        let longGesture = UILongPressGestureRecognizer(target: self, action: "handleLongGesture:")
        view.addGestureRecognizer(longGesture)
    }
    
    
    
    // MARK: - 手势事件
    func handleTapGesture(tap: UITapGestureRecognizer){
        
        creatAnimation()
    }
    
    func handleLongGesture(long: UITapGestureRecognizer){
        if long.state == UIGestureRecognizerState.Began{
            time = NSTimer.scheduledTimerWithTimeInterval(0.2, target: self, selector:  "creatAnimation", userInfo: nil, repeats: true)
        }else{
            // 先停止后置空
            time?.invalidate()
            time = nil
            
        }
    }
    
    
    func creatAnimation(){
        let loveView = LoveView(frame: CGRect(x: 2 * loveHW, y: window_height - 2 * loveHW, width: loveHW, height: loveHW))
        // 先添加到界面上 不然不会调用draw方法
        view.addSubview(loveView)
        loveView.showAnimationWith(view)
    }
}

