//
//  DetailViewController.h
//  Every.Do
//
//  Created by Jaison Bhatti on 2017-09-19.
//  Copyright © 2017 Jaison Bhatti. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Todo.h"

@interface DetailViewController : UIViewController

@property (strong, nonatomic) Todo *detailItem;

-(void)configureView;

@end

