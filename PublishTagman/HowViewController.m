#import "HowViewController.h"
#import "PageContentViewController.h"

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

- (IBAction)didTappedToStart:(id)sender{
    [self performSegueWithIdentifier:@"startSegueId" sender:self];
}

- (void) updatePageControlConstraintIfNeeded{
    if([[UIDevice currentDevice]userInterfaceIdiom] == UIUserInterfaceIdiomPhone){
        if ([[UIScreen mainScreen] bounds].size.height == 667 || [[UIScreen mainScreen] bounds].size.height == 736){
            self.verticalPageControlConstraint.constant = -50;
            [self updateViewConstraints];
        }
    }
}

@end
