//
//  MasterViewController.m
//  Every.Do
//
//  Created by Jaison Bhatti on 2017-09-19.
//  Copyright © 2017 Jaison Bhatti. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"
#import "Todo.h"
#import "ToDoCell.h"

@interface MasterViewController ()

@property NSMutableArray *toDos;
@end

@implementation MasterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.navigationItem.leftBarButtonItem = self.editButtonItem;
    [self listOfTodos];
    [self.tableView reloadData];
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)];
    self.navigationItem.rightBarButtonItem = addButton;
}

- (void)listOfTodos {
    //////
    self.toDos = [[NSMutableArray alloc] init];
    Todo *toDoList = [[Todo alloc] init];
    toDoList.title = @"Eat Healthy";
    toDoList.todoDescription = @"Go to Whole Foods";
    toDoList.priorityNumber = 3;
    toDoList.isCompleted = NO;
    [self.toDos addObject:toDoList];
    
    toDoList = [[Todo alloc] init];
    toDoList.title = @"Study";
    toDoList.todoDescription = @"Learn iOS";
    toDoList.priorityNumber = 1;
    toDoList.isCompleted = NO;
    [self.toDos addObject:toDoList];
    
    toDoList = [[Todo alloc] init];
    toDoList.title = @"Exercise";
    toDoList.todoDescription = @"Gainz";
    toDoList.priorityNumber = 2;
    toDoList.isCompleted = NO;
    [self.toDos addObject:toDoList];
}

- (void)viewWillAppear:(BOOL)animated {
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)insertNewObject:(id)sender {
    if (!self.toDos) {
        self.toDos = [[NSMutableArray alloc] init];
    }
    [self.toDos insertObject:[NSDate date] atIndex:0];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}


#pragma mark - Segues

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        Todo *todo = self.toDos[indexPath.row];
        
        
        DetailViewController *controller = (DetailViewController *)[segue destinationViewController];
        
        
        controller.detailItem = todo;
    }
}


#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.toDos.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ToDoCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ToDoCell" forIndexPath:indexPath];
    
    
    ///////////////
    
    Todo *toDo = self.toDos[indexPath.row];
    
    cell.titleLabel.text = toDo.title;
    [cell.titleLabel sizeToFit];
    cell.todoDescriptionLabel.text = toDo.todoDescription;
    cell.priorityLabel.text = @(toDo.priorityNumber).stringValue;
    
    return cell;
}


- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}


- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.toDos removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
}


@end
