#import "PlayViewController.h"
#import "ScoreViewController.h"
#import <iAd/iAd.h>

@interface PlayViewController () <UIAccelerometerDelegate, ADBannerViewDelegate>{
    NSInteger score;
    NSInteger countdownToDecrease;
    BOOL _bannerIsVisible;
}

@property (nonatomic, weak) IBOutlet UILabel *liveScoreLabel;
@property (nonatomic, weak) IBOutlet UIImageView *cartoonImage;
@property (nonatomic, weak) IBOutlet ADBannerView *bannerView;

@end

@implementation PlayViewController

- (void) viewWillAppear:(BOOL)animated{
    score = 0;
    self.liveScoreLabel.text = [NSString stringWithFormat:@"%i", score];
    countdownToDecrease = 100;
}

- (void)viewDidAppear:(BOOL)animated {
    [self startAccelerometer];
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    ScoreViewController *scoreViewController = [[ScoreViewController alloc] init];
    scoreViewController = segue.destinationViewController;
    scoreViewController.score = [NSString stringWithFormat:@"%i", score];
}

#pragma mark - IBAction
- (IBAction)didTappedFinishButton:(id)sender{
    [self stopAccelerometer];
    [self performSegueWithIdentifier:@"scoreSegueId" sender:self];
}

#pragma mark - Private Methods
- (void)startAccelerometer {
    UIAccelerometer *accelerometer = [UIAccelerometer sharedAccelerometer];
    accelerometer.delegate = self;
    accelerometer.updateInterval = 0.01;
}

- (void)stopAccelerometer {
    UIAccelerometer *accelerometer = [UIAccelerometer sharedAccelerometer];
    accelerometer.delegate = nil;
}

- (void)accelerometer:(UIAccelerometer *)accelerometer didAccelerate:(UIAcceleration *)acceleration{
    double const kThreshold = 2.0;
    if (fabs(acceleration.x) > kThreshold || fabs(acceleration.y) > kThreshold || fabs(acceleration.z) > kThreshold) {
        score += 1;
        self.cartoonImage.image = [UIImage imageNamed:@"bigGhost1"];
    }
    else{
        countdownToDecrease -= 1;
        if (countdownToDecrease <= 0) {
            score -= 10;
            countdownToDecrease = 100;
            self.cartoonImage.image = [UIImage imageNamed:@"bigGhost3"];
        }
    }
    self.liveScoreLabel.text = [NSString stringWithFormat:@"%i", score];
}

#pragma mark - iAds
- (void)bannerViewDidLoadAd:(ADBannerView *)banner{
    if (!_bannerIsVisible){
        [UIView beginAnimations:@"animateAdBannerOn" context:NULL];
        [UIView commitAnimations];
        _bannerIsVisible = YES;
    }
}

- (void)bannerView:(ADBannerView *)banner didFailToReceiveAdWithError:(NSError *)error{
    if (_bannerIsVisible){
        [UIView beginAnimations:@"animateAdBannerOff" context:NULL];
        [UIView commitAnimations];
        _bannerIsVisible = NO;
    }
}

@end
