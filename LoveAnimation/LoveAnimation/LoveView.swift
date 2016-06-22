//
//  LoveView.swift
//  LoveAnimation
//
//  Created by xiudou on 16/6/21.
//  Copyright © 2016年 xiudo. All rights reserved.
//

import UIKit

class LoveView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.clearColor()
        layer.anchorPoint = CGPoint(x: 0.5, y: 1)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func drawRect(rect: CGRect) {
        drawLoveIn(rect)
    }
    
    private func drawLoveIn(rect:CGRect){
        /**
        *  设置填充颜色
        */
        UIColor.whiteColor().setStroke()
        UIColor.randomColor().setFill()
        
        
        /**
         *  爱心间隙
         */
        let drawingPadding:CGFloat = 4.0
        
        /**
         *  一侧圆的半径
         *  @param rect
         *  @return 一侧圆的半径
         */
        let curveRadius = floor((CGRectGetWidth(rect) - 2*drawingPadding) / 4.0)
        
        
        /**
         *  创建曲线
         */
        let heartPath = UIBezierPath()
        
        
        /**
         *  底部的小尖尖
         *  @param rect 底部尖尖的 X和Y
         *  @return 底部的小尖尖
         */
        let tipLocation = CGPointMake(floor(CGRectGetWidth(rect) / 2.0), CGRectGetHeight(rect) - drawingPadding)
        heartPath.moveToPoint(tipLocation)
        
        
        /**
         *  左侧半圆起始点
         *  @param drawingPadding 起始点X
         *  @param rect           起始点Y
         *  @return 左侧圆起始点
         */
        let topLeftCurveStart = CGPointMake(drawingPadding, floor(CGRectGetHeight(rect) / 2.4))
        
        
        /**
        *  添加底部尖尖到左侧圆起始点曲线
        *  @param topLeftCurveStart                         添加的点
        *  @param topLeftCurveStart.x                       控制点X
        *  @param topLeftCurveStart.y + curveRadius         控制点Y
        *  @return 添加底部尖尖到左侧圆起始点曲线
        */
        heartPath.addQuadCurveToPoint(topLeftCurveStart, controlPoint: CGPoint(x: topLeftCurveStart.x, y: topLeftCurveStart.y + curveRadius))
        
        
        /**
        *  添加左侧半圆起始点到终点圆弧
        *  @param topLeftCurveStart.x + curveRadius         左侧圆心X
        *  @param topLeftCurveStart.y                       左侧圆心Y
        *  @param curveRadius                               半径
        *  @param startAngle                                开始角度
        *  @param endAngle                                  结束角度
        *  @param clockwise                                 旋转方向
        *  @return 添加左侧圆起始点到终点圆弧
        */
        heartPath.addArcWithCenter(CGPoint(x: topLeftCurveStart.x + curveRadius, y: topLeftCurveStart.y), radius: curveRadius, startAngle: CGFloat(M_PI), endAngle: 0, clockwise: true)
        
        
        
        
        /**
         *  右侧半圆弧起始点
         *  @param topLeftCurveStart.x + 2*curveRadius 右侧圆起始点X(注意:此处点的位置)
         *  @param topLeftCurveStart.y                 右侧圆起始点Y
         *  @return 右侧圆起始点
         */
        let topRightCurveStart = CGPoint(x: topLeftCurveStart.x + 2*curveRadius, y: topLeftCurveStart.y)
        
        
        
        
        /**
        *  添加右侧半圆起始点到终点圆弧
        *  @param topRightCurveStart.x + curveRadius          右侧圆心X
        *  @param topRightCurveStart.y                        右侧圆心Y
        *  @param curveRadius                                 半径
        *  @param startAngle                                  开始角度
        *  @param endAngle                                    结束角度
        *  @param clockwise                                   旋转方向
        *  @return 添加右侧半圆起始点到终点圆弧
        */
        heartPath.addArcWithCenter(CGPoint(x: topRightCurveStart.x + curveRadius, y: topRightCurveStart.y), radius: curveRadius, startAngle: CGFloat(M_PI), endAngle: 0, clockwise: true)
        
        
        /**
         *  右侧半圆终点
         *  @param topLeftCurveStart.x + 4*curveRadius          右侧半圆的终点X
         *  @param topRightCurveStart.y                         右侧半圆的终点Y
         *  @return 右侧半圆终点
         */
        let topRightCurveEnd = CGPoint(x: topLeftCurveStart.x + 4*curveRadius, y: topRightCurveStart.y)
        
        
        /**
        *  右侧半圆终点到底部小尖尖曲线
        *  @param topRightCurveEnd.x                       控制点X
        *  @param topRightCurveEnd.y + curveRadius         控制点Y
        *  @return 右侧半圆终点到底部小尖尖
        */
        heartPath.addQuadCurveToPoint(tipLocation, controlPoint: CGPoint(x: topRightCurveEnd.x, y: topRightCurveEnd.y + curveRadius))
        
        
        heartPath.fill()
        heartPath.lineWidth = 1;
        heartPath.lineCapStyle = CGLineCap.Round
        heartPath.lineJoinStyle = CGLineJoin.Round
        heartPath.stroke()
    }
    
    
    func showAnimationWith(view: UIView){
        /// 父类的高度
        let viewHeight = view.frame.height
        /// 动画执行总时间
        let totleAnimationDuration:NSTimeInterval = 6
        /// 爱心的宽
        let loveWidth:CGFloat = CGRectGetWidth(bounds)
        /// 爱心缩放起始比例
        transform = CGAffineTransformMakeScale(0, 0)
        alpha = 0.0
        /**
        *  爱心在开始显示时的动画
        */
        UIView.animateWithDuration(0.5, delay: 0.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.6, options: UIViewAnimationOptions.CurveEaseOut, animations: { () -> Void in
            self.transform = CGAffineTransformIdentity
            self.alpha = 0.9
            }) { (_) -> Void in
                
        }
        /// 临时值 0 1
        let tempNumber = (CGFloat)(arc4random_uniform(2));
        /// 旋转方向值 -1 1
        let rotationDirectionNumber = (1 - 2 * (tempNumber))
        let rotationFraction = (CGFloat)(arc4random_uniform(10)); // 0 ~ 9
        
        /**
        *  在totleAnimationDuration时间内动画执行的角度
        */
        let temp = (CGFloat)(M_PI / (Double)(16 + rotationFraction * 0.2))
        UIView.animateWithDuration(totleAnimationDuration) { () -> Void in
            self.transform = CGAffineTransformMakeRotation(rotationDirectionNumber * temp)
        }
        
        let lovePath = UIBezierPath()
        lovePath.moveToPoint(center)
        
        /**
         *  结束的顶部随机点
         */
        let number = UInt32(2 * loveWidth)
        let arc4random = (CGFloat)(arc4random_uniform(number))
        let arc4random_Y = (CGFloat)(arc4random_uniform(UInt32(viewHeight / 4.0)))
        let endarc4randomPoint = CGPoint(x: center.x + rotationDirectionNumber * arc4random, y: viewHeight / 6.0 + arc4random_Y)
        
        /**
         *  随机控制的点
         */
        let randomControl = (CGFloat)(arc4random_uniform(2));
        /// 方向值 -1 1
        let directionNumber = (1 - 2 * (randomControl))
        // 控制点 X 和 Y
        let xDelta = (CGFloat)(loveWidth / 2.0 + (CGFloat)(arc4random_uniform(UInt32( 2 * loveWidth)))) * directionNumber;
        let yDelta = max(endarc4randomPoint.y ,max((CGFloat)(arc4random_uniform(UInt32( 8 * loveWidth))), loveWidth));
        let controlPoint1 = CGPointMake(center.x + xDelta, viewHeight - yDelta);
        let controlPoint2 = CGPointMake(center.x - 2 * xDelta, yDelta);
        
        /**
        *  添加结束点和控制点画曲线
        */
        lovePath.addCurveToPoint(endarc4randomPoint, controlPoint1: controlPoint1, controlPoint2: controlPoint2)
        
        /**
         *  创建帧动画
         */
        let keyFrameAnimation = CAKeyframeAnimation(keyPath: "position")
        keyFrameAnimation.path = lovePath.CGPath
        
        /**
        *  timingFunction：速度控制函数，控制动画运行的节奏
        *  kCAMediaTimingFunctionLinear 匀速
        */
        keyFrameAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        
        /**
        *  动画执行
        */
        keyFrameAnimation.duration = totleAnimationDuration + (NSTimeInterval)(endarc4randomPoint.y/viewHeight);
        layer.addAnimation(keyFrameAnimation, forKey: "positionOnPath")
        UIView.animateWithDuration(totleAnimationDuration, animations: { () -> Void in
            self.alpha = 0.0
            }) { (_) -> Void in
                self.removeFromSuperview()
        }
        
    }
    
}
