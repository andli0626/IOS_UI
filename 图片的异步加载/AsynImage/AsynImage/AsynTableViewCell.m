//
//  AsynCell.m
//  AsynImage
//
//  Created by administrator on 13-3-5.
//  Copyright (c) 2013年 enuola. All rights reserved.
//

#import "AsynTableViewCell.h"

@implementation AsynTableViewCell

@synthesize asynImgView;
@synthesize lblTitle;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        
        asynImgView = [[AsynImageView alloc] initWithFrame:CGRectMake(0, 5, 200, 200)];
        asynImgView.placeholderImage = [UIImage imageNamed:@"place.png"];
        [self.contentView addSubview:asynImgView];
        
        lblTitle = [[UILabel alloc] initWithFrame:CGRectMake(220, 50, 100, 20)];
        lblTitle.textColor = [UIColor whiteColor];
        lblTitle.backgroundColor = [UIColor clearColor];
        [self.contentView addSubview:lblTitle];

    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)dealloc
{
//    [egoImgView release];
    [asynImgView release];
    [lblTitle release];
    
    [super dealloc];
}

@end
