//
//  Todo.h
//  Every.Do
//
//  Created by Jaison Bhatti on 2017-09-19.
//  Copyright © 2017 Jaison Bhatti. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Todo : NSObject

@property (nonatomic, strong) NSString* title;
@property (nonatomic) NSString* todoDescription;
@property (nonatomic, assign) int priorityNumber;
@property (nonatomic) BOOL isCompleted;

@end
