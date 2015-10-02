//
//  PasswordViewController.m
//  Assignment 3 (Assignment1.prac)
//
//  Created by ddwatts on 9/24/14.
//  Copyright (c) 2014 Dylan. All rights reserved.
//
//  Main file for the password system. Has user input gestures that are shown on screen when you do them.
//  PASSWORD: SWIPE UP, DOWN, LEFT, then RIGHT
#import "PasswordViewController.h"

@interface PasswordViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;        //UI connections
@property (weak, nonatomic) IBOutlet UILabel *matchText;

@end

@implementation PasswordViewController

NSArray *secretHandshake;                       //aka the password
int currentStep = 0;                            //how many gestures the user has taken

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
     secretHandshake = [NSArray arrayWithObjects:@"UP",@"DOWN",@"LEFT",@"RIGHT", nil];  //set the password here.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}



-(void)drawImageForGestureRecognizer: (NSString *)imageName atPoint: (CGPoint) centerPoint
{
    self.imageView.image = [UIImage imageNamed:imageName];                      //reference point for where gestures start
    self.imageView.center = centerPoint;
    self.imageView.alpha = 1.0;
}

-(IBAction)handleSwipe:(UISwipeGestureRecognizer *)recognizer                   //the method that essentially controls everything.
{
    
    NSString *imageName = @"Incorrect.png";
    
    CGPoint startLocation = [recognizer locationInView:self.view];
    CGPoint endLocation = startLocation;
    
    
    if(recognizer.direction == UISwipeGestureRecognizerDirectionUp)             //user swipes up, gesture is added
    {
        imageName = @"uparrow.png";
        endLocation.y -= 220.0;
        
        if([[secretHandshake objectAtIndex:currentStep] isEqualToString:@"UP"]) //no else here since this is the first entry.
            currentStep++;                                                      //adds to step array if user hits up

        NSLog(@"Up");                                                           //Helpful NSLog just to show directions, even though I have arrows on display.
    }
    else if(recognizer.direction == UISwipeGestureRecognizerDirectionDown)      //same as before, but with down gesture
    {
        
        imageName = @"downarrow.png";
        
        endLocation.y += 220.0;
        
        if([[secretHandshake objectAtIndex:currentStep] isEqualToString:@"DOWN"])
            currentStep++;
        else
            currentStep=0;
        
        NSLog(@"Down");
    }
    else if(recognizer.direction == UISwipeGestureRecognizerDirectionLeft)      //left gesture
    {
        
        imageName = @"leftarrow.png";
        
        endLocation.x -= 220.0;
        
        if([[secretHandshake objectAtIndex:currentStep] isEqualToString:@"LEFT"])
            currentStep++;
        else
            currentStep=0;
        
        NSLog(@"Left");
    }
    else if(recognizer.direction == UISwipeGestureRecognizerDirectionRight)     //right gesture
    {
        
        imageName = @"rightarrow.png";
        
        if([[secretHandshake objectAtIndex:currentStep] isEqualToString:@"RIGHT"])
            currentStep++;
        else
            currentStep=0;
        
        endLocation.x += 220.0;
        NSLog(@"Right");
    }
    else
    {
        NSLog(@"Not a valid swipe.");
    }
    
    
    [self drawImageForGestureRecognizer:imageName atPoint:startLocation];
    
    [UIView animateWithDuration:0.5 animations:^                                //this makes my arrows appear and then dissapear when swiping.
     {self.imageView.alpha = 0.0;
         self.imageView.center = endLocation;
     }];
    
    
    if(currentStep == [secretHandshake count])           //if you complete all 4 gestures correctly, view transitions and navigation bar puts Logout instead of
    {                                                    //back button on top, which acts as a makeshift login-logout system.
        self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Logout" style:UIBarButtonItemStylePlain target:nil action:nil];
        [self performSegueWithIdentifier:@"segueToBank" sender:self];
        NSLog(@"CORRECT PASSWORD");
        currentStep = 0;
    }

}

@end
