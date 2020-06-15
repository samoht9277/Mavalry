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

// taptic generator
UIImpactFeedbackGenerator *hapt;

//main switch
BOOL isEnabled;

//bools
BOOL wantsCCLabels, wantsHomeBar, wantsOlderNotifs, wantsTransparentDock, wantsHiddenPageDots, wantsHiddenLabels;

//values
int CCLabelsSize; //cc labels size

static void loadPrefs() {
    NSMutableDictionary *prefs = [[NSMutableDictionary alloc] initWithContentsOfFile:PLIST_PATH];
    isEnabled = [prefs objectForKey:@"isEnabled"] ? [[prefs objectForKey:@"isEnabled"] boolValue] : YES;
    wantsHiddenLabels = [prefs objectForKey:@"wantsHiddenLabels"] ? [[prefs objectForKey:@"wantsHiddenLabels"] boolValue] : YES;
    wantsHiddenPageDots = [prefs objectForKey:@"wantsHiddenPageDots"] ? [[prefs objectForKey:@"wantsHiddenPageDots"] boolValue] : YES;
    wantsTransparentDock = [prefs objectForKey:@"wantsTransparentDock"] ? [[prefs objectForKey:@"wantsTransparentDock"] boolValue] : YES;
    wantsOlderNotifs = [prefs objectForKey:@"wantsOlderNotifs"] ? [[prefs objectForKey:@"wantsOlderNotifs"] boolValue] : YES;
    wantsHomeBar = [prefs objectForKey:@"wantsHomeBar"] ? [[prefs objectForKey:@"wantsHomeBar"] boolValue] : YES;
    wantsCCLabels = [prefs objectForKey:@"wantsCCLabels"] ? [[prefs objectForKey:@"wantsCCLabels"] boolValue] : YES;
    CCLabelsSize = [[prefs objectForKey:@"CCLabelsSize"] intValue];
}
