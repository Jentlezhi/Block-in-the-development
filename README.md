#### Block在开发中的使用

#####基本定义:
 * 1.匿名函数，帮你保存一份代码，等到恰当的时候再去调用
 * 2.类似于函数指针

```
    void func(int count){
    ETBCLogGreen("0.函数指针 --> count = %d",count);
    
    //函数指针
    void(*funcptr)(int) = &func;
    funcptr(520);
}

```
* 3.block语法
 
```
 ^void(){
 ETBCLogRed(@"allydata");
 };

```
* 4.Block类型的变量
 
```
 block.noReturnNoPar void(^noReturnNoPar)();

```
* 5.对比函数指针
 
```
 void(*funcptr)() = &func;

```
* 6.补充
 
```
源代码中一旦使用了Block语法就相当于生成了可赋值给Block类型变量的“值”，Blocks中由Block语法生成的值也成为“Block”，在有关Blocks的文档中，“Block”既指源代码中的Block语法，也指由Block语法所生成的值。

```



 


