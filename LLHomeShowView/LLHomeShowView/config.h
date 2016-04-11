//
//  config.h
//  HomeTableViewDemo
//
//  Created by 李龙 on 16/3/28.
//  Copyright © 2016年 李龙. All rights reserved.
//

#ifndef config_h
#define config_h

#import "UIView+Frame.h"
#import "LxDBAnything.h"


#define LLkeyWindowsSize [UIScreen mainScreen].bounds.size



//避免宏循环引用
#define LLWeakObj(o) autoreleasepool{} __weak typeof(o) o##Weak = o;
#define LLStrongObj(o) autoreleasepool{} __strong typeof(o) o = o##Weak;


#endif /* config_h */
