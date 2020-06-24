#define PLIST_PATH @"/var/mobile/Library/Preferences/com.ajaidan.mavalryprefs.plist"

@interface WGWidgetWrapperView : UIView
@property(nonatomic, assign, readwrite, getter=isHidden) BOOL hidden;
@end

@interface WGWidgetListFooterView : UIView
@property(nonatomic, assign, readwrite, getter=isHidden) BOOL hidden;
@end

@interface SBSearchBar : UIView
@property(nonatomic, assign, readwrite, getter=isHidden) BOOL hidden;
@end

// Haptic generator
UIImpactFeedbackGenerator *hapt;

extern NSString *const kCAFilterDestOut;

@interface CCUIBaseSliderView : UIView
@property(nonatomic, retain) UILabel *percentLabel;
- (float)value;
@end

@interface CALayer (Private)
@property(nonatomic, retain) NSString *compositingFilter;
@property(nonatomic, assign) BOOL allowsGroupOpacity;
@property(nonatomic, assign) BOOL allowsGroupBlending;
@end

@interface NCNotificationListSectionRevealHintView : UIView
@property(nonatomic, assign, readwrite, getter=isHidden) BOOL hidden;
@end

BOOL isEnabled;

// Booleans
BOOL wantsCCLabels, wantsHomeBar, wantsOlderNotifs, wantsTransparentDock, wantsHiddenPageDots, wantsHiddenLabels, hideFolderBackground, noToday, moonGone;

// Values
int CCLabelsSize;

static void loadPrefs()
{
    NSMutableDictionary *prefs = [[NSMutableDictionary alloc] initWithContentsOfFile:PLIST_PATH];
    isEnabled = [prefs objectForKey:@"isEnabled"] ? [[prefs objectForKey:@"isEnabled"] boolValue] : YES;
    wantsCCLabels = [prefs objectForKey:@"wantsCCLabels"] ? [[prefs objectForKey:@"wantsCCLabels"] boolValue] : YES;
    wantsHomeBar = [prefs objectForKey:@"wantsHomeBar"] ? [[prefs objectForKey:@"wantsHomeBar"] boolValue] : YES;
    wantsOlderNotifs = [prefs objectForKey:@"wantsOlderNotifs"] ? [[prefs objectForKey:@"wantsOlderNotifs"] boolValue] : YES;
    wantsTransparentDock = [prefs objectForKey:@"wantsTransparentDock"] ? [[prefs objectForKey:@"wantsTransparentDock"] boolValue] : YES;
    wantsHiddenPageDots = [prefs objectForKey:@"wantsHiddenPageDots"] ? [[prefs objectForKey:@"wantsHiddenPageDots"] boolValue] : YES;
    wantsHiddenLabels = [prefs objectForKey:@"wantsHiddenLabels"] ? [[prefs objectForKey:@"wantsHiddenLabels"] boolValue] : YES;
    hideFolderBackground = [prefs objectForKey:@"hideFolderBackground"] ? [[prefs objectForKey:@"hideFolderBackground"] boolValue] : YES;
    noToday = [prefs objectForKey:@"noToday"] ? [[prefs objectForKey:@"noToday"] boolValue] : YES;
    moonGone = [prefs objectForKey:@"moonGone"] ? [[prefs objectForKey:@"moonGone"] boolValue] : YES;
    CCLabelsSize = [[prefs objectForKey:@"CCLabelsSize"] intValue];
}