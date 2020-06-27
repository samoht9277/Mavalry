#define PLIST_PATH @"/var/mobile/Library/Preferences/com.ajaidan.mavalryprefs.plist"

// taptic generator
UIImpactFeedbackGenerator *hapt;

//prefs
float hapticPref;
float screenshotPref;
float volumePref;
BOOL isEnabled;
BOOL wantsHapticVol;
BOOL wantsHapticScreenshot;
static void loadPrefs() {
    NSMutableDictionary *prefs = [[NSMutableDictionary alloc] initWithContentsOfFile:PLIST_PATH];
    hapticPref = [[prefs objectForKey:@"hapticPref"] floatValue];
	screenshotPref = [[prefs objectForKey:@"screenshotPref"] floatValue];
	volumePref = [[prefs objectForKey:@"volumePref"] floatValue];
	isEnabled = [prefs objectForKey:@"isEnabled"] ? [[prefs objectForKey:@"isEnabled"] boolValue] : YES;
    wantsHapticVol = [prefs objectForKey:@"wantsHapticVol"] ? [[prefs objectForKey:@"wantsHapticVol"] boolValue] : YES;
	wantsHapticScreenshot = [prefs objectForKey:@"wantsHapticScreenshot"] ? [[prefs objectForKey:@"wantsHapticScreenshot"] boolValue] : YES;
}

%group Screenshot
%hook SpringBoard
-(void)takeScreenshot {

	%orig;

	UIImpactFeedbackGenerator *hapt = [[UIImpactFeedbackGenerator alloc] init];
	[hapt prepare];

	if (screenshotPref == 1) {
		hapt = [[UIImpactFeedbackGenerator alloc] initWithStyle:UIImpactFeedbackStyleMedium]; //Medium feedback

	} else if (screenshotPref == 2) {
		hapt = [[UIImpactFeedbackGenerator alloc] initWithStyle:UIImpactFeedbackStyleMedium]; //Medium feedback

	} else if (screenshotPref == 3) {
		hapt = [[UIImpactFeedbackGenerator alloc] initWithStyle:UIImpactFeedbackStyleHeavy]; //Heavy feedback

	} else if (screenshotPref == 4) {
		hapt = [[UIImpactFeedbackGenerator alloc] initWithStyle:UIImpactFeedbackStyleSoft]; //Soft feedback

	} else if (screenshotPref == 5) {
		hapt = [[UIImpactFeedbackGenerator alloc] initWithStyle:UIImpactFeedbackStyleRigid]; //Rigid feedback

	}
			
	[hapt impactOccurred];
}
%end
%end

%group HapticVolume
%hook SBVolumeControl 

- (void)increaseVolume {

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
	
}

- (void)decreaseVolume {

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
	
}
%end
%end

%group VolumeStep
%hook SBVolumeControl
- (float)volumeStepUp {
    return (volumePref); //possible values from 0.01 -> 1.0 
}

- (float)volumeStepDown {
    return (volumePref);
}
%end
%end

%ctor {
    loadPrefs();
    CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, (CFNotificationCallback)loadPrefs, CFSTR("com.ajaidan.mavalryprefs.settingschanged"), NULL, CFNotificationSuspensionBehaviorCoalesce);
		if (isEnabled && wantsHapticScreenshot) %init(Screenshot);
		if (isEnabled && wantsHapticVol) %init(HapticVolume);
		if (isEnabled && volumePref != 0.0) %init(VolumeStep);
}