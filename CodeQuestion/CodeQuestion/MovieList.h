//
//  MovieList.h
//  CodeQuestion
//
//  Created by HUANG WEILI on 3/9/15.
//  Copyright (c) 2015 HUANG WEILI. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MovieList : NSObject

@property(assign)int length;
@property(assign)int offset;
@property(nonatomic,strong)NSMutableArray *data;

-(id)initWithResult:(NSDictionary *)result;

@end
