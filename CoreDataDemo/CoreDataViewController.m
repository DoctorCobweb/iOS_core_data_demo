//
//  CoreDataViewController.m
//  CoreDataDemo
//
//  Created by andre trosky on 20/02/13.
//  Copyright (c) 2013 andre trosky. All rights reserved.
//

#import "CoreDataViewController.h"

@implementation CoreDataViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)saveData:(UIButton *)sender {
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    
    NSManagedObjectContext *context = [appDelegate managedObjectContext];
    NSManagedObject *newContact;
    newContact = [NSEntityDescription insertNewObjectForEntityForName:@"Contacts" inManagedObjectContext:context];
    [newContact setValue:_theName.text forKey:@"name"];
    [newContact setValue:_theAddress.text forKey:@"address"];
    [newContact setValue:_thePhone.text forKey:@"phone"];
    
    _theName.text = @"";
    _theAddress.text = @"";
    _thePhone.text = @"";
    NSError *error;
    [context save:&error];
    _theStatus.text = @"Contact saved.";
}

- (IBAction)findContact:(UIButton *)sender {
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *context = [appDelegate managedObjectContext];
    NSEntityDescription *entityDesc  = [NSEntityDescription entityForName:@"Contacts" inManagedObjectContext:context];
    
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    [request setEntity:entityDesc];
    
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"(name = %@)",
                         _theName.text];
    [request setPredicate:pred];
    NSManagedObject *matches = nil;
    
    NSError *error;
    NSArray *objects = [context executeFetchRequest:request error:&error];
    
    if ([objects count] == 0) {
        _theStatus.text = @"NO MATCHES";
    } else {
        matches = objects[0];
        _theAddress.text = [matches valueForKey:@"address"];
        _thePhone.text = [matches valueForKey:@"phone"];
        _theStatus.text = [NSString stringWithFormat:@"%d matches found", [objects count]];
    }
    [self nameDone:_theName];
}

- (IBAction)nameDone:(UITextField *)sender {
    [_theName resignFirstResponder];
}

- (IBAction)addressDone:(UITextField *)sender {
    [_theAddress resignFirstResponder];
}

- (IBAction)phoneDone:(UITextField *)sender {
    [_thePhone resignFirstResponder];
}
@end
