//
//  MovieList.m
//  CodeQuestion
//
//  Created by HUANG WEILI on 3/9/15.
//  Copyright (c) 2015 HUANG WEILI. All rights reserved.
//

#import "MovieList.h"
#import "Movie.h"

@implementation MovieList

-(id)initWithResult:(NSDictionary *)result
{
    self = [super init];
    if (self) {
        _data = [[NSMutableArray alloc]init];
        NSArray *array  = [result valueForKey:@"movies"];

        for (NSDictionary *dic in array) {
            Movie *movie = [[Movie alloc] initWithResult:dic];
            [self.data addObject:movie];
        }
    }
    return self;
}

@end
