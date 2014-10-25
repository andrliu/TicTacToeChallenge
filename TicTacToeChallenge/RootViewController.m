//
//  ViewController.m
//  TicTacToeChallenge
//
//  Created by Andrew Liu on 10/23/14.
//  Copyright (c) 2014 Andrew Liu. All rights reserved.
//

#import "RootViewController.h"
#define kTime 10;

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
@property (weak, nonatomic) UILabel *label;
@property (weak, nonatomic) NSTimer *timer;
@property (nonatomic) NSInteger timing;
@property (nonatomic) CGPoint originalPlayerLabelCenter;
@property (nonatomic) CGPoint touchPoint;

@end

@implementation RootViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self startSign];
    self.originalPlayerLabelCenter = self.whichPlayerLabel.center;
}

- (void)startSign
{
    UIAlertController *startSign = [UIAlertController alertControllerWithTitle:@"" message: @"Welcome" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *startButton = [UIAlertAction actionWithTitle:@"Challenge Accpted" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action)
                                    {
                                        [self startTime];
                                    }
                                    ];
    [startSign addAction:startButton];
    [self presentViewController: startSign animated:YES completion:nil];
}

- (void)startTime
{

    NSInteger time = kTime;
    self.navigationItem.title = [NSString stringWithFormat:@"%ld", time];
    self.timing = kTime;
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(countDown) userInfo:nil repeats:YES];

}

- (void)countDown
{
    if (self.timing > 0)
    {
        self.timing--;
        self.navigationItem.title = [NSString stringWithFormat:@"%ld", (NSInteger)self.timing];
    }
    else
    {
        [self stopTime];
        [self timeOut];
    }
}

- (void)stopTime
{
    [self.timer invalidate];
}

- (void)timeOut
{
    if ([self.whichPlayerLabel.text isEqualToString:@"Player"])
    {
        [self oTurn];
        [self startTime];
    }
    else
        if ([self.whichPlayerLabel.text isEqualToString:@"O"])
        {
            [self xTurn];
            [self startTime];
        }
        else
            if ([self.whichPlayerLabel.text isEqualToString:@"X"])
            {
                [self oTurn];
                [self startTime];
            }
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

- (NSString *)whoWon
{
    if ([self.labelOne.text isEqualToString: self.labelTwo.text] &&
        [self.labelOne.text isEqualToString: self.labelThree.text])
    {
        return self.labelOne.text;
    }
    else
        if ([self.labelOne.text isEqualToString: self.labelFive.text] &&
            [self.labelOne.text isEqualToString: self.labelNine.text])
        {
            return self.labelOne.text;
        }
    else
        if ([self.labelOne.text isEqualToString: self.labelFour.text] &&
            [self.labelOne.text isEqualToString: self.labelSeven.text ])
        {
            return self.labelOne.text;
        }
    else
        if ([self.labelTwo.text isEqualToString: self.labelFive.text] &&
            [self.labelTwo.text isEqualToString: self.labelEight.text])
        {
            return self.labelTwo.text;
        }
    else
        if ([self.labelThree.text isEqualToString: self.labelFive.text] &&
            [self.labelThree.text isEqualToString: self.labelSeven.text])
        {
            return self.labelThree.text;
        }
    else
        if ([self.labelThree.text isEqualToString: self.labelSix.text] &&
            [self.labelThree.text isEqualToString: self.labelNine.text])
        {
            return self.labelThree.text;
        }
    else
        if ([self.labelFour.text isEqualToString: self.labelFive.text] &&
            [self.labelFour.text isEqualToString: self.labelSix.text])
        {
            return self.labelFour.text;
        }
    else
        if ([self.labelSeven.text isEqualToString: self.labelEight.text] &&
            [self.labelSeven.text isEqualToString: self.labelNine.text])
        {
            return self.labelSeven.text;
        }
    else
        if (![self.labelOne.text     isEqualToString: @"1"] &&
            ![self.labelTwo.text     isEqualToString: @"2"] &&
            ![self.labelThree.text   isEqualToString: @"3"] &&
            ![self.labelFour.text    isEqualToString: @"4"] &&
            ![self.labelFive.text    isEqualToString: @"5"] &&
            ![self.labelSix.text     isEqualToString: @"6"] &&
            ![self.labelSeven.text   isEqualToString: @"7"] &&
            ![self.labelEight.text   isEqualToString: @"8"] &&
            ![self.labelNine.text    isEqualToString: @"9"])
        {
            return @"draw";
        }
    return nil;
}

- (NSString *)resultMessage
{
    if ([[self whoWon] isEqualToString: @"X"] ||
        [[self whoWon] isEqualToString: @"O"]
        )
    {
        return [NSString stringWithFormat:@"The winner is player %@", [self whoWon]];
    }
    else
        if ([[self whoWon] isEqualToString: @"draw"])
        {
            return [NSString stringWithFormat:@"GG"];
        }
    return nil;
}

- (void)resetLabel
{
    self.whichPlayerLabel.text      = @"Player";
    self.whichPlayerLabel.textColor = [UIColor blackColor];
    self.labelOne.text              = @"1";
    self.labelOne.textColor         = [UIColor blackColor];
    self.labelTwo.text              = @"2";
    self.labelTwo.textColor         = [UIColor blackColor];
    self.labelThree.text            = @"3";
    self.labelThree.textColor       = [UIColor blackColor];
    self.labelFour.text             = @"4";
    self.labelFour.textColor        = [UIColor blackColor];
    self.labelFive.text             = @"5";
    self.labelFive.textColor        = [UIColor blackColor];
    self.labelSix.text              = @"6";
    self.labelSix.textColor         = [UIColor blackColor];
    self.labelSeven.text            = @"7";
    self.labelSeven.textColor       = [UIColor blackColor];
    self.labelEight.text            = @"8";
    self.labelEight.textColor       = [UIColor blackColor];
    self.labelNine.text             = @"9";
    self.labelNine.textColor        = [UIColor blackColor];
}

- (void)alert
{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"" message: [self resultMessage] preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *restartButton = [UIAlertAction actionWithTitle:@"Restart" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action)
                                    {
                                        [self resetLabel];
                                    }
                                    ];
    [alert addAction:restartButton];
    [self presentViewController: alert animated:YES completion:nil];
}

- (void) xTurn
{
    self.whichPlayerLabel.text = @"X";
    self.whichPlayerLabel.textColor = [UIColor blueColor];
}

- (void) oTurn
{
    self.whichPlayerLabel.text = @"O";
    self.whichPlayerLabel.textColor = [UIColor redColor];
}

- (void) switchPlayer
{
    if ([self.label.text isEqualToString:@"X"] ||
        [self.label.text isEqualToString:@"O"])
    {
        nil;
    }
    else
    {
        if ([self.whichPlayerLabel.text isEqualToString: @"Player"] ||
            [self.whichPlayerLabel.text isEqualToString: @"X"])
        {
            self.label.text = @"X";
            self.label.textColor = [UIColor blueColor];
            if ([[self whoWon] isEqualToString: @"X"] ||
                [[self whoWon] isEqualToString: @"O"] ||
                [[self whoWon] isEqualToString: @"draw"])
            {
                [self alert];
            }
            else
            {
                [self oTurn];
            }
        }
        else
            if ([self.whichPlayerLabel.text isEqualToString: @"O"])
            {
                self.label.text = self.whichPlayerLabel.text;
                self.label.textColor = self.whichPlayerLabel.textColor;
                if ([[self whoWon] isEqualToString: @"X"] ||
                    [[self whoWon] isEqualToString: @"O"] ||
                    [[self whoWon] isEqualToString: @"draw"])
                {
                    [self alert];
                }
                else
                {
                    [self xTurn];
                }
            }
    }
}

- (IBAction)onLabelTapped:(UITapGestureRecognizer *)gesture
{
    self.touchPoint = [gesture locationInView:self.view];
    self.label = [self findLabelUsingPoint:self.touchPoint];
    if (CGRectContainsPoint(self.label.frame, self.touchPoint))
    {
        [self switchPlayer];
        [self startTime];
    }
}

- (void) panGestureAnimation
{
    [UIView animateWithDuration:0 animations:^
     {
         self.whichPlayerLabel.center = self.originalPlayerLabelCenter;
     }];
}

- (IBAction)onLabelPanned:(UIPanGestureRecognizer *)gesture
{
    self.touchPoint = [gesture locationInView:self.view];
    if (CGRectContainsPoint(self.whichPlayerLabel.frame, self.touchPoint))
    {
        self.whichPlayerLabel.center = self.touchPoint;
        self.label = [self findLabelUsingPoint:self.touchPoint];
        if (gesture.state == UIGestureRecognizerStateEnded)
        {
            if (CGRectContainsPoint(self.label.frame, self.touchPoint))
            {
                [self switchPlayer];
            }
            [self panGestureAnimation];
        }
    }
}

@end