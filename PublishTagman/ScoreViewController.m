#import "ScoreViewController.h"

@interface ScoreViewController ()

@property (nonatomic, weak) IBOutlet UILabel *scoreLabel;
@property (nonatomic, weak) IBOutlet UILabel *playerNameLabel;
@property (nonatomic, weak) IBOutlet UIImageView *leftBadgeImage;
@property (nonatomic, weak) IBOutlet UIImageView *middleBadgeImage;
@property (nonatomic, weak) IBOutlet UIImageView *rightBadgeImage;

@end

@implementation ScoreViewController

- (void) viewWillAppear:(BOOL)animated{
    self.scoreLabel.text = self.score;
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
