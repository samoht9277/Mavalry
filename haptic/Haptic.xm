#define PLIST_PATH @"/var/mobile/Library/Preferences/com.ajaidan.mavalryprefs.plist"

// taptic generator
UIImpactFeedbackGenerator *hapt;

//prefs
float hapticPref;
float volumePref;
BOOL isEnabled;
BOOL wantsHapticVol;
static void loadPrefs() {
    NSMutableDictionary *prefs = [[NSMutableDictionary alloc] initWithContentsOfFile:PLIST_PATH];
    hapticPref = [[prefs objectForKey:@"hapticPref"] floatValue];
    volumePref = [[prefs objectForKey:@"volumePref"] floatValue];
	isEnabled = [prefs objectForKey:@"isEnabled"] ? [[prefs objectForKey:@"isEnabled"] boolValue] : YES;
    wantsHapticVol = [prefs objectForKey:@"wantsHapticVol"] ? [[prefs objectForKey:@"wantsHapticVol"] boolValue] : YES;
}

%hook SBVolumeControl 

- (void)increaseVolume {
	
	if (isEnabled && wantsHapticVol) {

		%orig;

		UIImpactFeedbackGenerator *hapt = [[UIImpactFeedbackGenerator alloc] init];
		[hapt prepare];

		if (hapticPref == 1) {
			hapt = [[UIImpactFeedbackGenerator alloc] initWithStyle:UIImpactFeedbackStyleMedium]; //Medium feedback

		} else if (hapticPref == 2) {
			hapt = [[UIImpactFeedbackGenerator alloc] initWithStyle:UIImpactFeedbackStyleMedium]; //Medium feedback

		} else if (hapticPref == 3) {
			hapt = [[UIImpactFeedbackGenerator alloc] initWithStyle:UIImpactFeedbackStyleHeavy]; //Heavy feedback

		} else if (hapticPref == 4) {
			hapt = [[UIImpactFeedbackGenerator alloc] initWithStyle:UIImpactFeedbackStyleSoft]; //Soft feedback

		} else if (hapticPref == 5) {
			hapt = [[UIImpactFeedbackGenerator alloc] initWithStyle:UIImpactFeedbackStyleRigid]; //Rigid feedback

		}
			
		[hapt impactOccurred];

	} else {
		return %orig;
	}
	
}

- (void)decreaseVolume {
	
	if (isEnabled && wantsHapticVol) {

		%orig;

		UIImpactFeedbackGenerator *hapt = [[UIImpactFeedbackGenerator alloc] init];
		[hapt prepare];

		if (hapticPref == 1) {
			hapt = [[UIImpactFeedbackGenerator alloc] initWithStyle:UIImpactFeedbackStyleLight]; //Light feedback

		} else if (hapticPref == 2) {
			hapt = [[UIImpactFeedbackGenerator alloc] initWithStyle:UIImpactFeedbackStyleMedium]; //Medium feedback

		} else if (hapticPref == 3) {
			hapt = [[UIImpactFeedbackGenerator alloc] initWithStyle:UIImpactFeedbackStyleHeavy]; //Heavy feedback

		} else if (hapticPref == 4) {
			hapt = [[UIImpactFeedbackGenerator alloc] initWithStyle:UIImpactFeedbackStyleSoft]; //Soft feedback

		} else if (hapticPref == 5) {
			hapt = [[UIImpactFeedbackGenerator alloc] initWithStyle:UIImpactFeedbackStyleRigid]; //Rigid feedback

		}
			
		[hapt impactOccurred];

	} else {
		return %orig;
	}
	
}

- (float)volumeStepUp {

	if (isEnabled && wantsHapticVol && volumePref != 0.0) {
		return (volumePref); //possible values from 0.01 -> 1.0

	} else {
		return %orig; // orig returns 0.6
	}
	
}

- (float)volumeStepDown {

	if (isEnabled && wantsHapticVol && volumePref != 0.0) {
		return (volumePref); //possible values from 0.01 -> 1.0

	} else {
		return %orig; // orig returns 0.6
	}
	
}
%end

%ctor {
    loadPrefs();
    CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, (CFNotificationCallback)loadPrefs, CFSTR("com.ajaidan.mavalryprefs.settingschanged"), NULL, CFNotificationSuspensionBehaviorCoalesce);
}