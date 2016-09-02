//
//  JenBlock.m
//  Block开发中的使用
//
//  Created by Jentle on 16/7/7.
//  Copyright © 2016年 Jentle. All rights reserved.
//

#import "JenBlock.h"
#import "ETBCLog.h"

@implementation JenBlock

- (void)operation:(void(^)(void))block{
    block();
}

- (void(^)(int))blockAsReturn{
    return ^(int num){
         ETBCLogPurple(@"4.作为返回值 --> %d",num);
    };
}


- (JenBlock *(^)(int))blockAsReturnLink{
    return ^(int num){
        self.result += num;
        return self;
    };
}

@end
