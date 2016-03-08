//
//  MyBookShellCell.m
//  BookShelf
//
//  Created by mac on 12-9-20.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "MyBookShellCell.h"

#import "Header.h"

@implementation MyBookShellCell

@synthesize label;
@synthesize imageView;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.label = [[UILabel alloc] init];
        label.backgroundColor = [UIColor clearColor];

        self.imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"BookShelfCell.png"]];
        
        [label addSubview:imageView];
        [self addSubview:label];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
}

- (void)layoutSubviews{
    imageView.frame = CGRectMake(0, 0, SCREEN_WIDTH, self.frame.size.height);
    label.frame = CGRectMake(0, 0, SCREEN_WIDTH, self.frame.size.height);
}

@end
