//
//  ViewController.swift
//  LoveAnimation
//
//  Created by xiudou on 16/6/21.
//  Copyright © 2016年 xiudo. All rights reserved.


import UIKit

class ViewController: UIViewController {
    
    private var time:Timer?
    private let kWindowWidth = UIScreen.main.bounds.width
    private let kWindowHeight = UIScreen.main.bounds.height
    private let kLoveHW:CGFloat = 30
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.lightGray
        
        // 添加点击手势
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(ViewController.handleTapGesture(_:)))
        view.addGestureRecognizer(tapGesture)
        
        let longGesture = UILongPressGestureRecognizer(target: self, action: #selector(ViewController.handleLongGesture(_:)))
        view.addGestureRecognizer(longGesture)
    }

    // MARK: - 手势事件
    func handleTapGesture(_ tap: UITapGestureRecognizer){
        
        creatAnimation()
    }
    
    func handleLongGesture(_ long: UITapGestureRecognizer){
        
        if long.state == UIGestureRecognizerState.began{
            time = Timer.scheduledTimer(timeInterval: 0.2, target: self, selector:  #selector(ViewController.creatAnimation), userInfo: nil, repeats: true)
        }else{
            // 先停止后置空
            time?.invalidate()
            time = nil
        }
    }
    
    func creatAnimation(){
        
        let loveView = LoveView(frame: CGRect(x: 2 * kLoveHW, y: kWindowHeight - 2 * kLoveHW, width: kLoveHW, height: kLoveHW))
        // 先添加到界面上 不然不会调用draw方法
        view.addSubview(loveView)
        loveView.showAnimationWith(view)
    }
}
