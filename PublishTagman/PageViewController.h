#import <UIKit/UIKit.h>
#import "PageContentViewController.h"

@interface PageViewController : UIPageViewController <UIPageViewControllerDataSource>

@property (strong, nonatomic) UIPageViewController *pageViewController;
@property (strong, nonatomic) NSArray *pageTitles;
@property (strong, nonatomic) NSArray *pageImages;


@end
