#import "ScoreViewController.h"
#import "UIView+DCAnimationKit.h"

@interface ScoreViewController ()

@property (nonatomic, weak) IBOutlet UILabel *scoreLabel;
@property (nonatomic, weak) IBOutlet UILabel *playerNameLabel;
@property (nonatomic, weak) IBOutlet UIImageView *scoreBoardImage;
@property (nonatomic, weak) IBOutlet UIImageView *leftBadgeImage;
@property (nonatomic, weak) IBOutlet UIImageView *middleBadgeImage;
@property (nonatomic, weak) IBOutlet UIImageView *rightBadgeImage;
@property (nonatomic, weak) IBOutlet UILabel *pointsLabel;
@property (nonatomic, weak) IBOutlet UIImageView *classificationTextImage;

@end

@implementation ScoreViewController

- (void) viewWillAppear:(BOOL)animated{
    self.scoreLabel.text = self.score;
    [self.scoreBoardImage expandIntoView:self.view finished:^(void){
        [self.view bringSubviewToFront:self.scoreLabel];
        [self.view bringSubviewToFront:self.pointsLabel];
    }];
    self.playerNameLabel.text = [[UIDevice currentDevice] name];
    
    if (self.score.intValue > 1000) {
        self.middleBadgeImage.image = [UIImage imageNamed:@"diamondGhostON"];
        self.classificationTextImage.image = [UIImage imageNamed:@"messageDiamond"];
        self.rightBadgeImage.image = [UIImage imageNamed:@"goldenGhostOFF"];
        self.leftBadgeImage.image = [UIImage imageNamed:@"timberGhostOFF"];
    }
    else if (self.score.intValue > 0){
        self.middleBadgeImage.image = [UIImage imageNamed:@"goldenGhostON"];
        self.classificationTextImage.image = [UIImage imageNamed:@"messageGolden"];
        self.rightBadgeImage.image = [UIImage imageNamed:@"diamondGhostOFF"];
        self.leftBadgeImage.image = [UIImage imageNamed:@"timberGhostOFF"];
    }
    else{
        self.middleBadgeImage.image = [UIImage imageNamed:@"timberGhostON"];
        self.classificationTextImage.image = [UIImage imageNamed:@"messageTimber"];
        self.rightBadgeImage.image = [UIImage imageNamed:@"diamondGhostOFF"];
        self.leftBadgeImage.image = [UIImage imageNamed:@"goldenGhostOFF"];
    }
}

- (void) viewDidAppear:(BOOL)animated{
    [self.leftBadgeImage tada:^(void){
        [self.leftBadgeImage tada:^(void){
            [self.leftBadgeImage tada:^(void){
                [self.leftBadgeImage tada:^(void){
                    [self.leftBadgeImage tada:^(void){
                        [self.leftBadgeImage tada:^(void){
                            [self.leftBadgeImage tada:^(void){
                                [self.leftBadgeImage tada:^(void){
                                    [self.leftBadgeImage tada:^(void){
                                        [self.leftBadgeImage tada:^(void){
                                            [self.leftBadgeImage tada:^(void){
                                                [self.leftBadgeImage tada:^(void){
                                                    
                                                }];
                                            }];
                                        }];
                                    }];
                                }];
                            }];
                        }];
                    }];
                }];
            }];
        }];
    }];
    [self.rightBadgeImage tada:^(void){
        [self.rightBadgeImage tada:^(void){
            [self.rightBadgeImage tada:^(void){
                [self.rightBadgeImage tada:^(void){
                    [self.rightBadgeImage tada:^(void){
                        [self.rightBadgeImage tada:^(void){
                            [self.rightBadgeImage tada:^(void){
                                [self.rightBadgeImage tada:^(void){
                                    [self.rightBadgeImage tada:^(void){
                                        [self.rightBadgeImage tada:^(void){
                                            [self.rightBadgeImage tada:^(void){
                                                [self.rightBadgeImage tada:^(void){
                                                    
                                                }];
                                            }];
                                        }];
                                    }];
                                }];
                            }];
                        }];
                    }];
                }];
            }];
        }];
    }];
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

#pragma mark - IBAction
- (IBAction)didTappedHomeButton:(id)sender{
    [self performSegueWithIdentifier:@"homeSegueId" sender:self];
}

- (IBAction)didTappedRetryButton:(id)sender{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
