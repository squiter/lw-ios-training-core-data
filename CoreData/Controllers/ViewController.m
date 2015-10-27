//
//  ViewController.m
//  CoreData
//
//  Created by Treinamento Mobile on 10/27/15.
//  Copyright © 2015 Treinamento Mobile. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, weak) IBOutlet UITableView *placeTableView;
@property (nonatomic, strong) NSArray *places;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.title = @"Cidades";
    [self loadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

# pragma mark - UITableViewImplementation

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.places.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    PlaceTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"
                                                                  forIndexPath:indexPath];
    
    if (self.places.count > 0) {
        Place *place = self.places[indexPath.row];
        cell.placeName.text = place.name;
        cell.placeImage.image = [UIImage imageWithData:place.image];
        
        return cell;
    }else{
        return nil;
    }
}

# pragma mark - CoreData
- (void)loadData {
    NSManagedObjectContext *context = ((AppDelegate *) [UIApplication sharedApplication].delegate).managedObjectContext;
    
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Place"];
//    request.predicate = [NSPredicate predicateWithFormat:@"name = %@", @"São Paulo"];
//    request.sortDescriptors = @[ [NSSortDescriptor sortDescriptorWithKey:@"name" ascending:YES] ];
    
    self.places = [context executeFetchRequest:request error:nil];
}
@end
