#define PLIST_PATH @"/var/mobile/Library/Preferences/com.ajaidan.mavalryprefs.plist"

// taptic generator
UIImpactFeedbackGenerator *hapt;

//prefs
float hapticStrength;
float volumeStep;
BOOL wantsHapticVol;
static void loadPrefs() {
    NSMutableDictionary *prefs = [[NSMutableDictionary alloc] initWithContentsOfFile:PLIST_PATH];
    hapticStrength = [[prefs objectForKey:@"hapticStrength"] floatValue];
    volumeStep = [[prefs objectForKey:@"volumeStep"] floatValue];
	wantsHapticVol = [prefs objectForKey:@"wantsHapticVol"] ? [[prefs objectForKey:@"wantsHapticVol"] boolValue] : YES;
}