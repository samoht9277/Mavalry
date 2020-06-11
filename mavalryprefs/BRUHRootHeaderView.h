#import <Preferences/PSHeaderFooterView.h>

@interface BRUHRootHeaderView : UITableViewHeaderFooterView <PSHeaderFooterView>
{
	UIImageView* _headerImageView;
	CGFloat _currentWidth;
	CGFloat _aspectRatio;
}

@end