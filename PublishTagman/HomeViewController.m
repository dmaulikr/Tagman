#import "HomeViewController.h"
#import "UIView+DCAnimationKit.h"

@interface HomeViewController ()

@property (nonatomic, weak) IBOutlet UIButton *playButton;
@property (nonatomic, weak) IBOutlet UIButton *howButton;
@property (nonatomic, weak) IBOutlet UIImageView *headerImage;
@property (nonatomic, weak) IBOutlet UIImageView *logoImage;

@end

@implementation HomeViewController

- (void) viewDidAppear:(BOOL)animated{
    [self.logoImage expandIntoView:self.view finished:nil];
}

- (IBAction)didTappedPlayButton:(id)sender{
    [self performSegueWithIdentifier:@"playSegueId" sender:self];
}

- (IBAction)didTappedHowButton:(id)sender{
    [self performSegueWithIdentifier:@"howSegueId" sender:self];
}

@end
