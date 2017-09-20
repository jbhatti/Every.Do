//
//  DetailViewController.m
//  Every.Do
//
//  Created by Jaison Bhatti on 2017-09-19.
//  Copyright © 2017 Jaison Bhatti. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()
@property (weak, nonatomic) IBOutlet UILabel *titleDetail;
@property (weak, nonatomic) IBOutlet UILabel *descriptionDetail;
@property (weak, nonatomic) IBOutlet UILabel *priorityDetail;

@end

@implementation DetailViewController

#pragma mark - Managing the detail item

- (void)configureView {
        //self.toDo = [[Todo alloc] init];
        
        self.titleDetail.text = self.detailItem.title;
        self.descriptionDetail.text = self.detailItem.todoDescription;
        self.priorityDetail.text = @(self.detailItem.priorityNumber).stringValue;
        
        // Update the view.
}





- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self configureView];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
