//
//  MovieCell.m
//  CodeQuestion
//
//  Created by HUANG WEILI on 3/9/15.
//  Copyright (c) 2015 HUANG WEILI. All rights reserved.
//

#import "MovieCell.h"

@implementation MovieCell

- (void)awakeFromNib {
    // Initialization code
}

-(void)prepareForReuse
{
    self.posterImageView.image = nil;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
