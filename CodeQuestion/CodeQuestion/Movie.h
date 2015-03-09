//
//  Movie.h
//  CodeQuestion
//
//  Created by HUANG WEILI on 3/9/15.
//  Copyright (c) 2015 HUANG WEILI. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Movie : NSObject

@property(nonatomic,strong)NSString *title;
@property(nonatomic,strong)NSString *year;
@property(nonatomic,strong)NSString *rating;
@property(nonatomic,strong)NSURL *posterUrl;

-(id)initWithResult:(NSDictionary *)result;

@end
