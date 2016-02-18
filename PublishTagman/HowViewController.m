#import "HowViewController.h"
#import "PageContentViewController.h"

@interface HowViewController ()

@end

@implementation HowViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)didTappedToStart:(id)sender{
    [self performSegueWithIdentifier:@"" sender:self];
}

@end
