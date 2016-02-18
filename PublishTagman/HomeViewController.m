#import "HomeViewController.h"
#import "UIView+DCAnimationKit.h"

@interface HomeViewController ()

@property (nonatomic, weak) IBOutlet UIButton *playButton;
@property (nonatomic, weak) IBOutlet UIButton *howButton;
@property (nonatomic, weak) IBOutlet UIImageView *headerImage;
@property (nonatomic, weak) IBOutlet UIImageView *logoImage;
@property (nonatomic, weak) IBOutlet NSLayoutConstraint *verticalDistanceGhostConstraint;
@property (nonatomic, weak) IBOutlet NSLayoutConstraint *verticalDistancePacConstraint;

@end

@implementation HomeViewController

- (void)viewDidLoad{
    [self.logoImage expandIntoView:self.view finished:nil];
    [self updateCartoonConstraintsIfNeeded];
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

#pragma mark - Private Methods
- (void) updateCartoonConstraintsIfNeeded{
    if([[UIDevice currentDevice]userInterfaceIdiom] == UIUserInterfaceIdiomPhone){
        if ([[UIScreen mainScreen] bounds].size.height == 667 || [[UIScreen mainScreen] bounds].size.height == 736){
            self.verticalDistanceGhostConstraint.constant = 35;
            self.verticalDistancePacConstraint.constant = 35;
            [self updateViewConstraints];
        }
    }
}

@end
