//
//  model1.m
//  BlockDemo
//
//  Created by 李兴东 on 2018/9/10.
//  Copyright © 2018年 lixingdong. All rights reserved.
//

#import "ModelOne.h"

@interface ModelOne ()

@property (nonatomic, copy) ModelOneBlock block;

@end

@implementation ModelOne

- (void)cycle:(ModelOneBlock)block{
    _block = block;
    if (_block){
        _block();
    }
}

- (void)compare:(ModelOneBlock)block{
    if (block){
        block();
    }
}

@end
