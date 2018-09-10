//
//  model1.h
//  BlockDemo
//
//  Created by 李兴东 on 2018/9/10.
//  Copyright © 2018年 lixingdong. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^ModelOneBlock) (void);


@interface ModelOne : NSObject

- (void)cycle:(ModelOneBlock)block;

- (void)compare:(ModelOneBlock)block;


@end
