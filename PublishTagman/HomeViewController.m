#import "HomeViewController.h"
#import "UIView+DCAnimationKit.h"

@interface HomeViewController ()

@property (nonatomic, weak) IBOutlet UIButton *playButton;
@property (nonatomic, weak) IBOutlet UIButton *howButton;
@property (nonatomic, weak) IBOutlet UIImageView *headerImage;
@property (nonatomic, weak) IBOutlet UIImageView *logoImage;

@end

@implementation HomeViewController

- (void)viewDidLoad{
    [self.logoImage expandIntoView:self.view finished:nil];
}

- (void) viewDidAppear:(BOOL)animated{
    [self.playButton tada:nil];
    [self.howButton tada:nil];
}

#pragma mark - IBAction
- (IBAction)didTappedPlayButton:(id)sender{
    [self performSegueWithIdentifier:@"playSegueId" sender:self];
}

- (IBAction)didTappedHowButton:(id)sender{
    [self performSegueWithIdentifier:@"howSegueId" sender:self];
}

@end
