#import "PlayViewController.h"
#import <CoreMotion/CoreMotion.h>
#import "ScoreViewController.h"

@interface PlayViewController () <UIAccelerometerDelegate>{
    NSInteger score;
    NSInteger countdownToDecrease;
}

@property (nonatomic, weak) IBOutlet UILabel *liveScoreLabel;

@end

@implementation PlayViewController

- (void)viewDidAppear:(BOOL)animated {
    score = 0;
    countdownToDecrease = 100;
    [self startAccelerometer];
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    ScoreViewController *scoreViewController = [[ScoreViewController alloc] init];
    scoreViewController = segue.destinationViewController;
    scoreViewController.score = [NSString stringWithFormat:@"%li", score];
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
        self.liveScoreLabel.text = [NSString stringWithFormat:@"%li", score];
    }
    else{
        countdownToDecrease -= 1;
        if (countdownToDecrease <= 0) {
            score -= 10;
            countdownToDecrease = 100;
            self.liveScoreLabel.text = [NSString stringWithFormat:@"%li", score];
        }
    }
}

#pragma mark - IBAction
- (IBAction)didTappedFinishButton:(id)sender{
    [self stopAccelerometer];
    [self performSegueWithIdentifier:@"scoreSegueId" sender:self];
}


@end
