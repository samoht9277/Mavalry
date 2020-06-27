#import "BRUHSubtitleCell.h"
 
@implementation BRUHSubtitleCell
-(id)initWithStyle:(long long)style reuseIdentifier:(id)arg2 specifier:(id)specifier {
    self = [super initWithStyle:3 reuseIdentifier:arg2 specifier:specifier];
 
    [[self textLabel] setText:[specifier propertyForKey:@"label"]];
    [[self detailTextLabel] setText:[specifier propertyForKey:@"details"]];
    return self;
}
@end