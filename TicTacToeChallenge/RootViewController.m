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
@property (weak, nonatomic) IBOutlet UIBarButtonItem *timeButton;
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

//welcome alert
- (void)startSign
{
    UIAlertController *startSign = [UIAlertController alertControllerWithTitle:@"" message: @"Welcome Tic, Tac, Toe Challenge" preferredStyle:UIAlertControllerStyleAlert];
    //pvp option
    UIAlertAction *startButton = [UIAlertAction actionWithTitle:@"Player VS Player" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action)
                                  {
                                      self.navigationItem.title = [NSString stringWithFormat:@"Battle Begin"];
                                      [self startTime];
                                  }
                                  ];
    //ai option
    [startSign addAction:startButton];
    UIAlertAction *challengeButton = [UIAlertAction actionWithTitle:@"Player VS Computer" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action)
                                      {
                                          self.navigationItem.title = [NSString stringWithFormat:@"Challenge Accpeted"];
                                          [self startTime];
                                    }
                                    ];
    [startSign addAction:challengeButton];
    [self presentViewController: startSign animated:YES completion:nil];
}

//set up timer
- (void)startTime
{
    NSInteger time = kTime;
    self.timeButton.title = [NSString stringWithFormat:@"%ld", (long)time];
    self.timing = kTime;
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(countDown) userInfo:nil repeats:YES];
}

- (void)stopTime
{
    [self.timer invalidate];
}

//set up startTime method to countdown and reset
- (void)countDown
{
    if (self.timing > 0)
    {
        self.timing--;
        self.timeButton.title = [NSString stringWithFormat:@"%ld", (long)self.timing];
    }
    else
    {
        [self stopTime];
        [self timeOut];
        [self startTime];
    }
}

//create timeOut system to switch players
- (void)timeOut
{
    //timeOut and switch to the other player
    if ([self.navigationItem.title isEqualToString:@"Battle Begin"])
    {
        if ([self.whichPlayerLabel.text isEqualToString:@"Player"]||
            [self.whichPlayerLabel.text isEqualToString:@"X"])
        {
            [self oTurn];
        }
        else
            if ([self.whichPlayerLabel.text isEqualToString:@"O"])
            {
                [self xTurn];
            }
    }
    //timeOut and switch to computer
    else
        if ([self.navigationItem.title isEqualToString:@"Challenge Accpeted"])
        {
            if ([self.whichPlayerLabel.text isEqualToString:@"Player"]||
                [self.whichPlayerLabel.text isEqualToString:@"X"])
            {
                [self oTurn];
                [self computerAI];
            }
        }
}

//assign self.label with corresponding self.label#
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

//return string with winner symbol
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

//check winner and apply to switch method
- (void)checkingWinnerX
{
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

//check winner and apply to switch method
- (void)checkingWinnerO
{
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

//winning msg
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
            return [NSString stringWithFormat:@"Good Game"];
        }
    return nil;
}

//gameover alert
- (void)alert
{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"" message: [self resultMessage] preferredStyle:UIAlertControllerStyleAlert];
    //restart option
    UIAlertAction *restartButton = [UIAlertAction actionWithTitle:@"Restart" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action)
                                    {
                                        [self stopTime];
                                        [self resetLabel];
                                        [self startTime];
                                    }
                                    ];
    [alert addAction:restartButton];
    [self presentViewController: alert animated:YES completion:nil];
}

//reset all labels and buttons
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
    self.timeButton.title           = [NSString stringWithFormat:@"Time"];
}

- (void)computerAI
{
    if ([self.labelFive.text isEqualToString:@"5"])
    {
        self.labelFive.text = @"O";
        self.labelFive.textColor = [UIColor redColor];
    }
    else
        if ([self.labelFive.text isEqualToString:@"X"] &&
            [self.labelOne.text isEqualToString:@"1"])
        {
            self.labelOne.text = @"O";
            self.labelOne.textColor = [UIColor redColor];
        }

    else
        if ([self.labelOne.text isEqualToString:@"O"] &&
            [self.labelTwo.text isEqualToString:@"O"] &&
            [self.labelThree.text isEqualToString:@"3"])
        {
            self.labelThree.text = @"O";
            self.labelThree.textColor = [UIColor redColor];
        }
    else
        if ([self.labelOne.text isEqualToString:@"O"] &&
            [self.labelThree.text isEqualToString:@"O"] &&
            [self.labelTwo.text isEqualToString:@"2"])
        {
            self.labelTwo.text = @"O";
            self.labelTwo.textColor = [UIColor redColor];
        }
    else
        if ([self.labelTwo.text isEqualToString:@"O"] &&
            [self.labelThree.text isEqualToString:@"O"] &&
            [self.labelOne.text isEqualToString:@"1"])
        {
            self.labelOne.text = @"O";
            self.labelOne.textColor = [UIColor redColor];
        }
    else
        if ([self.labelOne.text isEqualToString:@"O"] &&
            [self.labelFive.text isEqualToString:@"O"] &&
            [self.labelNine.text isEqualToString:@"9"])
        {
            self.labelNine.text = @"O";
            self.labelNine.textColor = [UIColor redColor];
        }
    else
        if ([self.labelOne.text isEqualToString:@"O"] &&
            [self.labelNine.text isEqualToString:@"O"] &&
            [self.labelFive.text isEqualToString:@"5"])
        {
            self.labelFive.text = @"O";
            self.labelFive.textColor = [UIColor redColor];
        }
    else
        if ([self.labelFive.text isEqualToString:@"O"] &&
            [self.labelNine.text isEqualToString:@"O"] &&
            [self.labelOne.text isEqualToString:@"1"])
        {
            self.labelOne.text = @"O";
            self.labelOne.textColor = [UIColor redColor];
        }
    else
        if ([self.labelOne.text isEqualToString:@"O"] &&
            [self.labelFour.text isEqualToString:@"O"] &&
            [self.labelSeven.text isEqualToString:@"7"])
        {
            self.labelSeven.text = @"O";
            self.labelSeven.textColor = [UIColor redColor];
        }
    else
        if ([self.labelOne.text isEqualToString:@"O"] &&
            [self.labelSeven.text isEqualToString:@"O"] &&
            [self.labelFour.text isEqualToString:@"4"])
        {
            self.labelFour.text = @"O";
            self.labelFour.textColor = [UIColor redColor];
        }
    else
        if ([self.labelFour.text isEqualToString:@"O"] &&
            [self.labelSeven.text isEqualToString:@"O"] &&
            [self.labelOne.text isEqualToString:@"1"])
        {
            self.labelOne.text = @"O";
            self.labelOne.textColor = [UIColor redColor];
        }
    else
        if ([self.labelTwo.text isEqualToString:@"O"] &&
            [self.labelFive.text isEqualToString:@"O"] &&
            [self.labelEight.text isEqualToString:@"8"])
        {
            self.labelEight.text = @"O";
            self.labelEight.textColor = [UIColor redColor];
        }
    else
        if ([self.labelTwo.text isEqualToString:@"O"] &&
            [self.labelEight.text isEqualToString:@"O"] &&
            [self.labelFive.text isEqualToString:@"5"])
        {
            self.labelFive.text = @"O";
            self.labelFive.textColor = [UIColor redColor];
        }
    else
        if ([self.labelFive.text isEqualToString:@"O"] &&
            [self.labelEight.text isEqualToString:@"O"] &&
            [self.labelTwo.text isEqualToString:@"2"])
        {
            self.labelTwo.text = @"O";
            self.labelTwo.textColor = [UIColor redColor];
        }
    else
        if ([self.labelThree.text isEqualToString:@"O"] &&
            [self.labelFive.text isEqualToString:@"O"] &&
            [self.labelSeven.text isEqualToString:@"7"])
        {
            self.labelSeven.text = @"O";
            self.labelSeven.textColor = [UIColor redColor];
        }
    else
        if ([self.labelThree.text isEqualToString:@"O"] &&
            [self.labelSeven.text isEqualToString:@"O"] &&
            [self.labelFive.text isEqualToString:@"5"])
        {
            self.labelFive.text = @"O";
            self.labelFive.textColor = [UIColor redColor];
        }
    else
        if ([self.labelFive.text isEqualToString:@"O"] &&
            [self.labelSeven.text isEqualToString:@"O"] &&
            [self.labelThree.text isEqualToString:@"3"])
        {
            self.labelThree.text = @"O";
            self.labelThree.textColor = [UIColor redColor];
        }
    else
        if ([self.labelThree.text isEqualToString:@"O"] &&
            [self.labelSix.text isEqualToString:@"O"] &&
            [self.labelNine.text isEqualToString:@"9"])
        {
            self.labelNine.text = @"O";
            self.labelNine.textColor = [UIColor redColor];
        }
    else
        if ([self.labelThree.text isEqualToString:@"O"] &&
            [self.labelNine.text isEqualToString:@"O"] &&
            [self.labelSix.text isEqualToString:@"6"])
        {
            self.labelSix.text = @"O";
            self.labelSix.textColor = [UIColor redColor];
        }
    else
        if ([self.labelSix.text isEqualToString:@"O"] &&
            [self.labelNine.text isEqualToString:@"O"] &&
            [self.labelThree.text isEqualToString:@"3"])
        {
            self.labelThree.text = @"O";
            self.labelThree.textColor = [UIColor redColor];
        }
    else
        if ([self.labelFour.text isEqualToString:@"O"] &&
            [self.labelFive.text isEqualToString:@"O"] &&
            [self.labelSix.text isEqualToString:@"6"])
        {
            self.labelSix.text = @"O";
            self.labelSix.textColor = [UIColor redColor];
        }
    else
        if ([self.labelFour.text isEqualToString:@"O"] &&
            [self.labelSix.text isEqualToString:@"O"] &&
            [self.labelFive.text isEqualToString:@"5"])
        {
            self.labelFive.text = @"O";
            self.labelFive.textColor = [UIColor redColor];
        }
    else
        if ([self.labelFive.text isEqualToString:@"O"] &&
            [self.labelSix.text isEqualToString:@"O"] &&
            [self.labelFour.text isEqualToString:@"4"])
        {
            self.labelFour.text = @"O";
            self.labelFour.textColor = [UIColor redColor];
        }
    else
        if ([self.labelSeven.text isEqualToString:@"O"] &&
            [self.labelEight.text isEqualToString:@"O"] &&
            [self.labelNine.text isEqualToString:@"9"])
        {
            self.labelNine.text = @"O";
            self.labelNine.textColor = [UIColor redColor];
        }
    else
        if ([self.labelSeven.text isEqualToString:@"O"] &&
            [self.labelNine.text isEqualToString:@"O"] &&
            [self.labelEight.text isEqualToString:@"8"])
        {
            self.labelEight.text = @"O";
            self.labelEight.textColor = [UIColor redColor];
        }
    else
        if ([self.labelEight.text isEqualToString:@"O"] &&
            [self.labelNine.text isEqualToString:@"O"] &&
            [self.labelSeven.text isEqualToString:@"7"])
        {
            self.labelSeven.text = @"O";
            self.labelSeven.textColor = [UIColor redColor];
        }

    else
        if ([self.labelOne.text isEqualToString:@"X"] &&
            [self.labelTwo.text isEqualToString:@"X"] &&
            [self.labelThree.text isEqualToString:@"3"])
        {
            self.labelThree.text = @"O";
            self.labelThree.textColor = [UIColor redColor];
        }
    else
        if ([self.labelOne.text isEqualToString:@"X"] &&
            [self.labelThree.text isEqualToString:@"X"] &&
            [self.labelTwo.text isEqualToString:@"2"])
        {
            self.labelTwo.text = @"O";
            self.labelTwo.textColor = [UIColor redColor];
        }
    else
        if ([self.labelTwo.text isEqualToString:@"X"] &&
            [self.labelThree.text isEqualToString:@"X"] &&
            [self.labelOne.text isEqualToString:@"1"])
        {
            self.labelOne.text = @"O";
            self.labelOne.textColor = [UIColor redColor];
        }
    else
        if ([self.labelOne.text isEqualToString:@"X"] &&
            [self.labelFive.text isEqualToString:@"X"] &&
            [self.labelNine.text isEqualToString:@"9"])
        {
            self.labelNine.text = @"O";
            self.labelNine.textColor = [UIColor redColor];
        }
    else
        if ([self.labelOne.text isEqualToString:@"X"] &&
            [self.labelNine.text isEqualToString:@"X"] &&
            [self.labelFive.text isEqualToString:@"5"])
        {
            self.labelFive.text = @"O";
            self.labelFive.textColor = [UIColor redColor];
        }
    else
        if ([self.labelFive.text isEqualToString:@"X"] &&
            [self.labelNine.text isEqualToString:@"X"] &&
            [self.labelOne.text isEqualToString:@"1"])
        {
            self.labelOne.text = @"O";
            self.labelOne.textColor = [UIColor redColor];
        }
    else
        if ([self.labelOne.text isEqualToString:@"X"] &&
            [self.labelFour.text isEqualToString:@"X"] &&
            [self.labelSeven.text isEqualToString:@"7"])
        {
            self.labelSeven.text = @"O";
            self.labelSeven.textColor = [UIColor redColor];
        }
    else
        if ([self.labelOne.text isEqualToString:@"X"] &&
            [self.labelSeven.text isEqualToString:@"X"] &&
            [self.labelFour.text isEqualToString:@"4"])
        {
            self.labelFour.text = @"O";
            self.labelFour.textColor = [UIColor redColor];
        }
    else
        if ([self.labelFour.text isEqualToString:@"X"] &&
            [self.labelSeven.text isEqualToString:@"X"] &&
            [self.labelOne.text isEqualToString:@"1"])
        {
            self.labelOne.text = @"O";
            self.labelOne.textColor = [UIColor redColor];
        }
    else
        if ([self.labelTwo.text isEqualToString:@"X"] &&
            [self.labelFive.text isEqualToString:@"X"] &&
            [self.labelEight.text isEqualToString:@"8"])
        {
            self.labelEight.text = @"O";
            self.labelEight.textColor = [UIColor redColor];
        }
    else
        if ([self.labelTwo.text isEqualToString:@"X"] &&
            [self.labelEight.text isEqualToString:@"X"] &&
            [self.labelFive.text isEqualToString:@"5"])
        {
            self.labelFive.text = @"O";
            self.labelFive.textColor = [UIColor redColor];
        }
    else
        if ([self.labelFive.text isEqualToString:@"X"] &&
            [self.labelEight.text isEqualToString:@"X"] &&
            [self.labelTwo.text isEqualToString:@"2"])
        {
            self.labelTwo.text = @"O";
            self.labelTwo.textColor = [UIColor redColor];
        }
    else
        if ([self.labelThree.text isEqualToString:@"X"] &&
            [self.labelFive.text isEqualToString:@"X"] &&
            [self.labelSeven.text isEqualToString:@"7"])
        {
            self.labelSeven.text = @"O";
            self.labelSeven.textColor = [UIColor redColor];
        }
    else
        if ([self.labelThree.text isEqualToString:@"X"] &&
            [self.labelSeven.text isEqualToString:@"X"] &&
            [self.labelFive.text isEqualToString:@"5"])
        {
            self.labelFive.text = @"O";
            self.labelFive.textColor = [UIColor redColor];
        }
    else
        if ([self.labelFive.text isEqualToString:@"X"] &&
            [self.labelSeven.text isEqualToString:@"X"] &&
            [self.labelThree.text isEqualToString:@"3"])
        {
            self.labelThree.text = @"O";
            self.labelThree.textColor = [UIColor redColor];
        }
    else
        if ([self.labelThree.text isEqualToString:@"X"] &&
            [self.labelSix.text isEqualToString:@"X"] &&
            [self.labelNine.text isEqualToString:@"9"])
        {
            self.labelNine.text = @"O";
            self.labelNine.textColor = [UIColor redColor];
        }
    else
        if ([self.labelThree.text isEqualToString:@"X"] &&
            [self.labelNine.text isEqualToString:@"X"] &&
            [self.labelSix.text isEqualToString:@"6"])
        {
            self.labelSix.text = @"O";
            self.labelSix.textColor = [UIColor redColor];
        }
    else
        if ([self.labelSix.text isEqualToString:@"X"] &&
            [self.labelNine.text isEqualToString:@"X"] &&
            [self.labelThree.text isEqualToString:@"3"])
        {
            self.labelThree.text = @"O";
            self.labelThree.textColor = [UIColor redColor];
        }
    else
        if ([self.labelFour.text isEqualToString:@"X"] &&
            [self.labelFive.text isEqualToString:@"X"] &&
            [self.labelSix.text isEqualToString:@"6"])
        {
            self.labelSix.text = @"O";
            self.labelSix.textColor = [UIColor redColor];
        }
    else
        if ([self.labelFour.text isEqualToString:@"X"] &&
            [self.labelSix.text isEqualToString:@"X"] &&
            [self.labelFive.text isEqualToString:@"5"])
        {
            self.labelFive.text = @"O";
            self.labelFive.textColor = [UIColor redColor];
        }
    else
        if ([self.labelFive.text isEqualToString:@"X"] &&
            [self.labelSix.text isEqualToString:@"X"] &&
            [self.labelFour.text isEqualToString:@"4"])
        {
            self.labelFour.text = @"O";
            self.labelFour.textColor = [UIColor redColor];
        }
    else
        if ([self.labelSeven.text isEqualToString:@"X"] &&
            [self.labelEight.text isEqualToString:@"X"] &&
            [self.labelNine.text isEqualToString:@"9"])
        {
            self.labelNine.text = @"O";
            self.labelNine.textColor = [UIColor redColor];
        }
    else
        if ([self.labelSeven.text isEqualToString:@"X"] &&
            [self.labelNine.text isEqualToString:@"X"] &&
            [self.labelEight.text isEqualToString:@"8"])
        {
            self.labelEight.text = @"O";
            self.labelEight.textColor = [UIColor redColor];
        }
    else
        if ([self.labelEight.text isEqualToString:@"X"] &&
            [self.labelNine.text isEqualToString:@"X"] &&
            [self.labelSeven.text isEqualToString:@"7"])
        {
            self.labelSeven.text = @"O";
            self.labelSeven.textColor = [UIColor redColor];
        }

    else
        if ([self.labelFive.text isEqualToString:@"O"])
        {
            if ([self.labelOne.text isEqualToString:@"X"] &&
                [self.labelSix.text isEqualToString:@"6"])
            {
                self.labelSix.text = @"O";
                self.labelSix.textColor = [UIColor redColor];
            }
            else
                if ([self.labelOne.text isEqualToString:@"X"] &&
                    [self.labelEight.text isEqualToString:@"8"])
                {
                    self.labelEight.text = @"O";
                    self.labelEight.textColor = [UIColor redColor];
                }
            else
                if ([self.labelThree.text isEqualToString:@"X"] &&
                    [self.labelFour.text isEqualToString:@"4"])
                {
                    self.labelFour.text = @"O";
                    self.labelFour.textColor = [UIColor redColor];
                }
            else
                if ([self.labelThree.text isEqualToString:@"X"] &&
                    [self.labelEight.text isEqualToString:@"8"])
                {
                    self.labelEight.text = @"O";
                    self.labelEight.textColor = [UIColor redColor];
                }
            else
                if ([self.labelSeven.text isEqualToString:@"X"] &&
                    [self.labelTwo.text isEqualToString:@"2"])
                {
                    self.labelTwo.text = @"O";
                    self.labelTwo.textColor = [UIColor redColor];
                }
            else
                if ([self.labelSeven.text isEqualToString:@"X"] &&
                    [self.labelSix.text isEqualToString:@"6"])
                {
                    self.labelSix.text = @"O";
                    self.labelSix.textColor = [UIColor redColor];
                }
            else
                if ([self.labelNine.text isEqualToString:@"X"] &&
                    [self.labelTwo.text isEqualToString:@"2"])
                {
                    self.labelTwo.text = @"O";
                    self.labelTwo.textColor = [UIColor redColor];
                }
            else
                if ([self.labelNine.text isEqualToString:@"X"] &&
                    [self.labelFour.text isEqualToString:@"4"])
                {
                    self.labelFour.text = @"O";
                    self.labelFour.textColor = [UIColor redColor];
                }
            else
                if ([self.labelTwo.text isEqualToString:@"X"] &&
                    [self.labelFour.text isEqualToString:@"X"] &&
                    [self.labelOne.text isEqualToString:@"1"])
                {
                    self.labelOne.text = @"O";
                    self.labelOne.textColor = [UIColor redColor];
                }
            else
                if ([self.labelTwo.text isEqualToString:@"X"] &&
                    [self.labelSix.text isEqualToString:@"X"] &&
                    [self.labelThree.text isEqualToString:@"3"])
                {
                    self.labelThree.text = @"O";
                    self.labelThree.textColor = [UIColor redColor];
                }
            else
                if ([self.labelTwo.text isEqualToString:@"X"] &&
                    [self.labelSeven.text isEqualToString:@"X"] &&
                    [self.labelNine.text isEqualToString:@"9"])
                {
                    self.labelNine.text = @"O";
                    self.labelNine.textColor = [UIColor redColor];
                }
            else
                if ([self.labelTwo.text isEqualToString:@"X"] &&
                    [self.labelNine.text isEqualToString:@"X"] &&
                    [self.labelSeven.text isEqualToString:@"7"])
                {
                    self.labelSeven.text = @"O";
                    self.labelSeven.textColor = [UIColor redColor];
                }
            else
                if ([self.labelFour.text isEqualToString:@"X"] &&
                    [self.labelEight.text isEqualToString:@"X"] &&
                    [self.labelSeven.text isEqualToString:@"7"])
                {
                    self.labelSeven.text = @"O";
                    self.labelSeven.textColor = [UIColor redColor];
                }
            else
                if ([self.labelFour.text isEqualToString:@"X"] &&
                    [self.labelThree.text isEqualToString:@"X"] &&
                    [self.labelNine.text isEqualToString:@"9"])
                {
                    self.labelNine.text = @"O";
                    self.labelNine.textColor = [UIColor redColor];
                }
            else
                if ([self.labelFour.text isEqualToString:@"X"] &&
                    [self.labelNine.text isEqualToString:@"X"] &&
                    [self.labelThree.text isEqualToString:@"3"])
                {
                    self.labelThree.text = @"O";
                    self.labelThree.textColor = [UIColor redColor];
                }
            else
                if ([self.labelSix.text isEqualToString:@"X"] &&
                    [self.labelEight.text isEqualToString:@"X"] &&
                    [self.labelNine.text isEqualToString:@"9"])
                {
                    self.labelNine.text = @"O";
                    self.labelNine.textColor = [UIColor redColor];
                }
            else
                if ([self.labelSix.text isEqualToString:@"X"] &&
                    [self.labelOne.text isEqualToString:@"X"] &&
                    [self.labelSeven.text isEqualToString:@"7"])
                {
                    self.labelSeven.text = @"O";
                    self.labelSeven.textColor = [UIColor redColor];
                }
            else
                if ([self.labelSix.text isEqualToString:@"X"] &&
                    [self.labelSeven.text isEqualToString:@"X"] &&
                    [self.labelOne.text isEqualToString:@"1"])
                {
                    self.labelOne.text = @"O";
                    self.labelOne.textColor = [UIColor redColor];
                }
            else
                if ([self.labelEight.text isEqualToString:@"X"] &&
                    [self.labelOne.text isEqualToString:@"X"] &&
                    [self.labelThree.text isEqualToString:@"3"])
                {
                    self.labelThree.text = @"O";
                    self.labelThree.textColor = [UIColor redColor];
                }
            else
                if ([self.labelEight.text isEqualToString:@"X"] &&
                    [self.labelThree.text isEqualToString:@"X"] &&
                    [self.labelOne.text isEqualToString:@"1"])
                {
                    self.labelOne.text = @"O";
                    self.labelOne.textColor = [UIColor redColor];
                }
            else
                if ([self.labelOne.text isEqualToString:@"1"])
                {
                    self.labelOne.text = @"O";
                    self.labelOne.textColor = [UIColor redColor];
                }
        }
    else
        if ([self.labelFive.text isEqualToString:@"X"] &&
            [self.labelOne.text isEqualToString:@"O"])
        {
            if ([self.labelNine.text isEqualToString:@"X"] &&
                [self.labelSeven.text isEqualToString:@"7"])
            {
                self.labelSeven.text = @"O";
                self.labelSeven.textColor = [UIColor redColor];
            }
            else
                if ([self.labelNine.text isEqualToString:@"X"] &&
                    [self.labelThree.text isEqualToString:@"3"])
                {
                    self.labelThree.text = @"O";
                    self.labelThree.textColor = [UIColor redColor];
                }
        }

    [self checkingWinnerO];
}

//assign self.whichPlayerLabel with X and apply to checking method and timeOut system
- (void)xTurn
{
    self.whichPlayerLabel.text = @"X";
    self.whichPlayerLabel.textColor = [UIColor blueColor];
}

//assign self.whichPlayerLabel with Oand apply to checking method and timeOut system
- (void)oTurn
{
    self.whichPlayerLabel.text = @"O";
    self.whichPlayerLabel.textColor = [UIColor redColor];
}

//mark self.label with corresponding player
- (void)mark
{
    self.label.text = self.whichPlayerLabel.text;
    self.label.textColor = self.whichPlayerLabel.textColor;
}

//end of gesture and switch players
- (void)swtich
{
//switch to the other player
    if ([self.navigationItem.title isEqualToString:@"Battle Begin"])
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
                [self checkingWinnerX];
            }
            else
                if ([self.whichPlayerLabel.text isEqualToString: @"O"])
                {
                    [self mark];
                    [self checkingWinnerO];
                }
        }
    }
//switch to computer
    else
        if ([self.navigationItem.title isEqualToString:@"Challenge Accpeted"])
        {
            if ([self.label.text isEqualToString:@"X"] ||
                [self.label.text isEqualToString:@"O"])
            {
                nil;
            }
            else
                if ([self.whichPlayerLabel.text isEqualToString: @"Player"] ||
                    [self.whichPlayerLabel.text isEqualToString: @"X"])
                {
                    self.label.text = @"X";
                    self.label.textColor = [UIColor blueColor];
                    [self checkingWinnerX];
                    [self computerAI];
                }
        }
}

//assign X or O by tapGesture
- (IBAction)onLabelTapped:(UITapGestureRecognizer *)gesture
{
    self.touchPoint = [gesture locationInView:self.view];
    self.label = [self findLabelUsingPoint:self.touchPoint];
    if (CGRectContainsPoint(self.label.frame, self.touchPoint))
    {
        [self stopTime];
        [self swtich];
        [self startTime];
    }
}

//self.whichPlayerLabel moving animation
- (void)panGestureAnimation
{
    [UIView animateWithDuration:1.0 animations:^
     {
         self.whichPlayerLabel.center = self.originalPlayerLabelCenter;
     }
    ];
}

//assign X or O by panGesture
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
                [self stopTime];
                [self swtich];
                [self startTime];
            }
            [self panGestureAnimation];
        }
    }
}

//move to webview and reset the game at the same time
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    [self stopTime];
    [self resetLabel];
}


@end