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

BOOL isEnabled; //general tweak switch
BOOL hideLabels; //hide app labels switch
BOOL hideDots; //hide page dots switch
BOOL transDock; //hide dock background switch
BOOL olderNotifs; //hide older notifications switch
BOOL homeBar; //hide home bar switch
BOOL ccLabels; //enables-disables cc percentage labels
int ccLabelsSize; //cc labels size
BOOL hapticVol; //enables-disables haptics when volume buttons are pressed
float hapticPref; //haptics strength
float volStep; //volume percentage steps

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
    hapticVol = [prefs objectForKey:@"hapticVol"] ? [[prefs objectForKey:@"hapticVol"] boolValue] : YES;
    hapticPref = [[prefs objectForKey:@"hapticPref"] floatValue];
    volStep = [[prefs objectForKey:@"volStep"] floatValue];
}
