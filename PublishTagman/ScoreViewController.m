#import "ScoreViewController.h"

@interface ScoreViewController ()

@property (nonatomic, weak) IBOutlet UILabel *scoreLabel;

@end

@implementation ScoreViewController

- (void) viewWillAppear:(BOOL)animated{
    self.scoreLabel.text = self.score;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)didTappedHomeButton:(id)sender{
    [self performSegueWithIdentifier:@"homeSegueId" sender:self];
}
- (IBAction)didTappedRetryButton:(id)sender{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
