//
//  ZPRedView.m
//  UIView的拖拽
//
//  Created by apple on 16/7/13.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "ZPRedView.h"

@implementation ZPRedView

/**
 当用户用手指触摸屏幕的时候，系统就会自动调用这个方法。
 UITouch：当用户用手指触摸屏幕的时候系统就会自动创建一个与这个手指相关的UITouch对象，一根手指对应一个UITouch对象，如果多根手指触摸屏幕的话系统就会建立多个不同的UITouch对象，并且这些UITouch对象与这些手指是一一对应的关系；
 UITouch对象会保存与手指相关的一些信息，比如手指触摸屏幕的位置、时间、阶段，当手指在屏幕上移动时系统会更新这个UITouch对象，使之能够一直保存当前该手指的信息，当手指离开屏幕时，系统就会自动销毁这个UITouch对象。
 UIEvent：当手指触摸屏幕的时候在产生UITouch对象的同时也会产生一个UIEvents对象，这个UIEvent对象被称为事件对象，用来记录事件的产生和类型。
 视图View默认只接受一根手指的点击，如果想让View默认接受多根手指的点击的话应该在storyboard文件中选中那个View然后选中实用工具区(utilities area)中的Multiple Touch。
 */
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    NSLog(@"%s, 有%lu根手指正在触摸屏幕", __func__, (unsigned long)touches.count);
}

/**
 当用户的手指在屏幕上面移动的时候，系统就会自动调用这个方法；
 随着手指在屏幕上面的移动，系统会频繁地调用这个方法。
 */
-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    NSLog(@"%s", __func__);
    
    /**
     获取UITouch对象：
     用一个手指触摸屏幕的话则NSSet集合内部就只有一个UITouch对象。
     */
    UITouch *touch = [touches anyObject];
    
    //获取当前的点
    CGPoint currentPoint = [touch locationInView:self];
    
    //获取上一个点
    CGPoint previousPoint = [touch previousLocationInView:self];
    
    //获取x轴的偏移量
    CGFloat offsetX = currentPoint.x - previousPoint.x;
    
    //获取y轴的偏移量
    CGFloat offsetY = currentPoint.y - previousPoint.y;
    
    //更改View的位置
    self.transform = CGAffineTransformTranslate(self.transform, offsetX, offsetY);
}

//当用户的手指离开屏幕的时候，系统就会自动调用这个方法
-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    NSLog(@"%s", __func__);
}

//在触摸结束前某个系统事件（例如电话呼入）会打断触摸过程，这个时候系统就会自动调用下面的方法
-(void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    NSLog(@"%s", __func__);
}

@end
