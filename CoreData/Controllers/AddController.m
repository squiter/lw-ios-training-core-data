//
//  AddController.m
//  CoreData
//
//  Created by Treinamento Mobile on 10/27/15.
//  Copyright © 2015 Treinamento Mobile. All rights reserved.
//

#import "AddController.h"

@interface AddController ()

@property (nonatomic, weak) IBOutlet UITextField *nameField;

@end

@implementation AddController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"Adicionar Cidade";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - IBActions
- (IBAction)cancelButtonTap:(id)sender{
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - CoreDataActions
-(IBAction)addEntry:(id)sender {
    NSManagedObjectContext *context = ((AppDelegate *) [UIApplication sharedApplication].delegate).managedObjectContext;
    
    Place *place = [NSEntityDescription insertNewObjectForEntityForName:@"Place" inManagedObjectContext:context];
    
    place.name = self.nameField.text;
    //place.image = NSData de aumguma coisa
    
    NSError *error = nil;
    if (![context save:&error]) {
        NSLog(@"%@", error);
    }else{
        NSLog(@"%@ adcionado com sucesso!", place.name);
        
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}

@end
