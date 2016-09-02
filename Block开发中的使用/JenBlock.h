//
//  JenBlock.h
//  Block开发中的使用
//
//  Created by Jentle on 16/7/7.
//  Copyright © 2016年 Jentle. All rights reserved.
//

/*
 blcok的作用：匿名函数，帮你保存一份代码，等到恰当的时候去调用
 */

#import <Foundation/Foundation.h>


@interface JenBlock : NSObject


/** 结果 */
@property(assign, nonatomic) int result;

/** 没有返回值没有参数 */
@property(copy, nonatomic) void(^noReturnNoPar)();

/** 有返回值有参数 */
@property(copy, nonatomic) int(^returnAndPar)(int);

// block作为方法参数(外界不调用，方法内部调用)
- (void)operation:(void(^)(void))block;


//block作为方法返回值（目的是代替方法，封装内部的实现，外界不需要知道Block怎么实现，只管调用）
- (void(^)(int))blockAsReturn;

//block作为方法返回值 链式编程思想
- (JenBlock *(^)(int))blockAsReturnLink;

@end
