//
//  MyVideoViewController.h
//  CameraTest
//
//  Created by SDT-1 on 2014. 1. 27..
//  Copyright (c) 2014년 iamdreamer. All rights reserved.
//

#import "CHTCollectionViewWaterfallLayout.h"

#import "Flickr.h"
#import "FlickrPhoto.h"

@interface MyVideoViewController : UIViewController <UICollectionViewDataSource, CHTCollectionViewDelegateWaterfallLayout,UITextFieldDelegate>

//#define HEADER_FOOTER_SUPPORT

@property (nonatomic, strong) UICollectionView *collectionView;

@property (nonatomic) CGFloat cellWidth;

@end