//
//  UICollectionViewWaterfallCell.m
//  Demo
//
//  Created by Nelson on 12/11/27.
//  Copyright (c) 2012年 Nelson. All rights reserved.
//

#import "CHTCollectionViewWaterfallCell.h"
#import "FlickrPhoto.h"

@implementation CHTCollectionViewWaterfallCell

#pragma mark - Accessors
- (UILabel *)displayLabel {
    
	if (!_displayLabel) {
	
        _displayLabel = [[UILabel alloc] initWithFrame:self.contentView.bounds];
		_displayLabel.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
		_displayLabel.backgroundColor = [UIColor lightGrayColor];
		_displayLabel.textColor = [UIColor whiteColor];
		_displayLabel.textAlignment = NSTextAlignmentCenter;
        
        
	}
    
	return _displayLabel;
    
}

- (void)setDisplayString:(NSString *)displayString {
	
    if (![_displayString isEqualToString:displayString]) {
	
        _displayString = [displayString copy];
		
        self.displayLabel.text = _displayString;
        
	}
}



-(void)setPhoto:(FlickrPhoto *)photo {
    
    if(_photo != photo) {
        _photo = photo;
    }
    
//    self.imageView.image = _photo.thumbnail;
}



#pragma mark - Life Cycle
- (void)dealloc {
	
    [_displayLabel removeFromSuperview];
	_displayLabel = nil;
    
    
}

- (id)initWithFrame:(CGRect)frame {
	
    if (self = [super initWithFrame:frame]) {
        
        [self.contentView addSubview:self.displayLabel];
        
        
 //       self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 75, 75)];
        
       // self.imageView.image = [self makeThumbnailImage:[dataArr objectAtIndex:row] onlyCrop:NO Size:75];
        
 //       [self.contentView addSubview:self.imageView];
        
	}
    
	return self;
}

@end
