//
//  Movie.m
//  CodeQuestion
//
//  Created by HUANG WEILI on 3/9/15.
//  Copyright (c) 2015 HUANG WEILI. All rights reserved.
//

#import "Movie.h"

@implementation Movie

-(id)initWithResult:(NSDictionary *)result
{
    self = [super init];
    if (self) {
        _title = [result valueForKey:@"title"];
        _year = [NSString stringWithFormat:@"%d", [[result valueForKey:@"year"] intValue] ];
        _rating = [result valueForKey:@"rating"];
        if ([result valueForKeyPath:@"poster.urls.w154"]) {
            _posterUrl = [NSURL URLWithString:[result valueForKeyPath:@"poster.urls.w154"]];

        }
    }
    return self;
}

@end
