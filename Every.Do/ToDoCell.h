//
//  ToDoCell.h
//  Every.Do
//
//  Created by Jaison Bhatti on 2017-09-19.
//  Copyright © 2017 Jaison Bhatti. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ToDoCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UILabel* titleLabel;
@property (nonatomic, weak) IBOutlet UILabel* todoDescriptionLabel;
@property (nonatomic, weak) IBOutlet UILabel* priorityLabel;


@end
