//
//  ViewController.m
//  TicTacToeChallenge
//
//  Created by Andrew Liu on 10/23/14.
//  Copyright (c) 2014 Andrew Liu. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController ()
@property (weak, nonatomic) IBOutlet UILabel *labelOne;
@property (weak, nonatomic) IBOutlet UILabel *labelTwo;
@property (weak, nonatomic) IBOutlet UILabel *labelThree;
@property (weak, nonatomic) IBOutlet UILabel *labelFour;
@property (weak, nonatomic) IBOutlet UILabel *labelFive;
@property (weak, nonatomic) IBOutlet UILabel *labelSix;
@property (weak, nonatomic) IBOutlet UILabel *labelSeven;
@property (weak, nonatomic) IBOutlet UILabel *labelEight;
@property (weak, nonatomic) IBOutlet UILabel *labelNine;
@property (weak, nonatomic) IBOutlet UILabel *whichPlayerLabel;

@end

@implementation RootViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (UILabel *)findLabelUsingPoint:(CGPoint)point
{
    if (CGRectContainsPoint(self.labelOne.frame, point))
        {
            return self.labelOne;
        }
    else
        if (CGRectContainsPoint(self.labelTwo.frame, point))
        {
            return self.labelTwo;
        }
    else
        if (CGRectContainsPoint(self.labelThree.frame, point))
        {
            return self.labelThree;
        }
    else
        if (CGRectContainsPoint(self.labelFour.frame, point))
        {
            return self.labelFour;
        }
    else
        if (CGRectContainsPoint(self.labelFive.frame, point))
        {
            return self.labelFive;
        }
    else
        if (CGRectContainsPoint(self.labelSix.frame, point))
        {
            return self.labelSix;
        }
    else
        if (CGRectContainsPoint(self.labelSeven.frame, point))
        {
            return self.labelSeven;
        }
    else
        if (CGRectContainsPoint(self.labelEight.frame, point))
        {
            return self.labelEight;
        }
    else
        if (CGRectContainsPoint(self.labelNine.frame, point))
        {
            return self.labelNine;
        }
    return nil;
}

- (IBAction)onLabelTapped:(UITapGestureRecognizer *)gesture
{
    CGPoint point = [gesture locationInView:self.view];
    UILabel *label = [self findLabelUsingPoint:point];
    if (CGRectContainsPoint(label.frame, point))
    {
        if ([label.text isEqualToString:@"O"] || [label.text isEqualToString:@"X"])
        {
            nil;
        }
        else
        {
            if ([self.whichPlayerLabel.text isEqualToString: @"X"])
            {
                label.text = self.whichPlayerLabel.text;
                label.textColor = self.whichPlayerLabel.textColor;
                self.whichPlayerLabel.text = @"O";
                self.whichPlayerLabel.textColor = [UIColor redColor];
            }
            else
                if ([self.whichPlayerLabel.text isEqualToString: @"O"])
                {
                    label.text = self.whichPlayerLabel.text;
                    label.textColor = self.whichPlayerLabel.textColor;
                    self.whichPlayerLabel.text = @"X";
                    self.whichPlayerLabel.textColor = [UIColor blueColor];
                }
        }
    }
}



@end



