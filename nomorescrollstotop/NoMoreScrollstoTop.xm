#define PLIST_PATH @"/var/mobile/Library/Preferences/com.ajaidan.mavalryprefs.plist"

BOOL isEnabled;
BOOL scrollsTop;

static void loadPrefs() {
    NSMutableDictionary *prefs = [[NSMutableDictionary alloc] initWithContentsOfFile:PLIST_PATH];
    isEnabled = [prefs objectForKey:@"isEnabled"] ? [[prefs objectForKey:@"isEnabled"] boolValue] : YES;
    scrollsTop = [prefs objectForKey:@"scrollsTop"] ? [[prefs objectForKey:@"scrollsTop"] boolValue] : YES;
}

%hook UIScrollView

-(id)initWithFrame:(CGRect)frame {
	if (scrollsTop && isEnabled) {
    	self = %orig;
    	self.scrollsToTop = false;
    	return self;
	} else {
		return %orig;
	}
}

-(id)initWithCoder:(id)arg1 {
	if (scrollsTop && isEnabled) {
    	self = %orig;
    	self.scrollsToTop = false;
    	return self;
	} else {
		return %orig;
	}
}

%end


// mas pref junk
%ctor {
  loadPrefs();
  CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, (CFNotificationCallback)loadPrefs, CFSTR("com.ajaidan.mavalryprefs.settingschanged"), NULL, CFNotificationSuspensionBehaviorCoalesce);

}
