#import "HowViewController.h"
#import "PageContentViewController.h"
#import <iAd/iAd.h>

@interface HowViewController ()

@property (nonatomic, weak) IBOutlet NSLayoutConstraint *verticalPageControlConstraint;
@property (nonatomic, weak) IBOutlet UIPageControl *pageControl;

@end

@implementation HowViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self updatePageControlConstraintIfNeeded];
    [self.pageControl setCurrentPageIndicatorTintColor:[UIColor lightGrayColor]];
    [self.pageControl setPageIndicatorTintColor:[UIColor lightGrayColor]];
}

#pragma mark - IBAction
- (IBAction)didTappedToStart:(id)sender{
    [self performSegueWithIdentifier:@"startSegueId" sender:self];
}

#pragma mark - Private Methods
- (void) updatePageControlConstraintIfNeeded{
    if([[UIDevice currentDevice]userInterfaceIdiom] == UIUserInterfaceIdiomPhone){
        if ([[UIScreen mainScreen] bounds].size.height == 667 || [[UIScreen mainScreen] bounds].size.height == 736){
            self.verticalPageControlConstraint.constant = -50;
            [self updateViewConstraints];
        }
    }
}

@end
