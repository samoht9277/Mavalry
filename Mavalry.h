#define PLIST_PATH @"/var/mobile/Library/Preferences/com.ajaidan.mavalryprefs.plist"

//cc stuff
extern NSString* const kCAFilterDestOut;

@interface CCUIBaseSliderView : UIView
@property (nonatomic, retain) UILabel *percentLabel;
- (float)value;
@end

@interface CALayer (Private)
@property (nonatomic, retain) NSString *compositingFilter;
@property (nonatomic, assign) BOOL allowsGroupOpacity;
@property (nonatomic, assign) BOOL allowsGroupBlending;
@end

BOOL isEnabled;
BOOL hideLabels;
BOOL hideDots;
BOOL transDock;
BOOL olderNotifs;
BOOL homeBar;
BOOL ccLabels;
int ccLabelsSize;
static void loadPrefs() {
    NSMutableDictionary *prefs = [[NSMutableDictionary alloc] initWithContentsOfFile:PLIST_PATH];
    isEnabled = [prefs objectForKey:@"isEnabled"] ? [[prefs objectForKey:@"isEnabled"] boolValue] : YES;
    hideLabels = [prefs objectForKey:@"hideLabels"] ? [[prefs objectForKey:@"hideLabels"] boolValue] : YES;
    hideDots = [prefs objectForKey:@"hideDots"] ? [[prefs objectForKey:@"hideDots"] boolValue] : YES;
    transDock = [prefs objectForKey:@"transDock"] ? [[prefs objectForKey:@"transDock"] boolValue] : YES;
    olderNotifs = [prefs objectForKey:@"olderNotifs"] ? [[prefs objectForKey:@"olderNotifs"] boolValue] : YES;
    homeBar = [prefs objectForKey:@"homeBar"] ? [[prefs objectForKey:@"homeBar"] boolValue] : YES;
    ccLabels = [prefs objectForKey:@"ccLabels"] ? [[prefs objectForKey:@"ccLabels"] boolValue] : YES;
    ccLabelsSize = [[prefs objectForKey:@"ccLabelsSize"] intValue];
}
