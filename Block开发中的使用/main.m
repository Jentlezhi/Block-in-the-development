//
//  main.m
//  Block开发中的使用
//
//  Created by Jentle on 16/7/6.
//  Copyright © 2016年 Jentle. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JenBlock.h"
#import "ETBCLog.h"


JenBlock *block;

void func(int count);

void noRetuenNoPar();

void retuenAndPar(int);

void noRetuenNoParAsPar();

void blockAsReturn(int);

void blockAsReturnLink();

int main(int argc, const char * argv[]) {
    //0.函数指针
    void(*funcptr)(int) = &func;
    funcptr(520);
    
    block = [[JenBlock alloc] init];
    //1.基本 没有参数、没有返回值
    noRetuenNoPar();//block定义
    
    if (block.noReturnNoPar) {
        block.noReturnNoPar();//调用
    }
    
    
    //2.有返回值有参数
    retuenAndPar(5);
    
    //3.作为参数
    noRetuenNoParAsPar();
    
    //4.作为返回值
    blockAsReturn(520);
    
    //5.链式思想
    blockAsReturnLink();
    
    
    

    return 0;
}

/*
 block.noReturnNoPar = ^{
 ETBCLogRed(@"allydata");
 };
 
 //Block语法
 ^void(){
 ETBCLogRed(@"allydata");
 };
 对比函数
 void func(){
 }
 //Block类型的变量
 block.noReturnNoPar void(^noReturnNoPar)();
 
 对比函数指针
 void(*funcptr)() = &func;
 
 源代码中一旦使用了Block语法就相当于生成了可赋值给Block类型变量的“值”，Blocks中由Block语法生成的值也成为“Block”，在有关Blocks的文档中，“Block”既指源代码中的Block语法，也指由Block语法所生成的值。
 
 */

/**
 *  0.函数指针
 */
void func(int count){
    ETBCLogGreen("0.函数指针 --> count = %d",count);
}

/**
 *  1.没有参数、没有返回值
 */
void noRetuenNoPar(){
    block.noReturnNoPar = ^{
        ETBCLogRed(@"1.基本 没有参数、没有返回值");
    };
}

/**
 *  2.有返回值有参数
 */
void retuenAndPar(int num){
   block.returnAndPar = ^(int n){
       return n + 515;
    };
    
    if (block.returnAndPar) {
        int result = block.returnAndPar(num);
        ETBCLogCyan(@"2.有返回值有参数 --> %d",result);
    }
}

/**
 *  3.作为参数
 */
void noRetuenNoParAsPar(){
    block.noReturnNoPar = ^(){
        ETBCLogPink(@"3.作为参数 --> 方法调用了");
    };
    if (block.noReturnNoPar) {
        [block operation:block.noReturnNoPar];
    }
}

/**
 *  4.作为返回值
 */
void blockAsReturn(int num){
    if (block.blockAsReturn) {
        block.blockAsReturn(num);
    }
}

/**
 *  5.链式思想
 */
void blockAsReturnLink(){
    block.blockAsReturnLink(1).blockAsReturnLink(2).blockAsReturnLink(3);
    ETBCLogGray(@"5.链式思想 --> linkResult = %d",block.result);
}

