//
//
// HV,
// tweak made by samoht.
// 
//

#import "HV.h"
#import "Mavalry.h"

%hook SBVolumeControl 

- (void)increaseVolume {
	
	if (isEnabled && wantsHapticVol) {

		%orig;

		UIImpactFeedbackGenerator *hapt = [[UIImpactFeedbackGenerator alloc] init];
		[hapt prepare];

		if (hapticStrength == 1) {
			hapt = [[UIImpactFeedbackGenerator alloc] initWithStyle:UIImpactFeedbackStyleLight]; //Light feedback

		} else if (hapticStrength == 2) {
			hapt = [[UIImpactFeedbackGenerator alloc] initWithStyle:UIImpactFeedbackStyleMedium]; //Medium feedback

		} else if (hapticStrength == 3) {
			hapt = [[UIImpactFeedbackGenerator alloc] initWithStyle:UIImpactFeedbackStyleHeavy]; //Heavy feedback

		} else if (hapticStrength == 4) {
			hapt = [[UIImpactFeedbackGenerator alloc] initWithStyle:UIImpactFeedbackStyleSoft]; //Soft feedback

		} else if (hapticStrength == 5) {
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

		if (hapticStrength == 1) {
			hapt = [[UIImpactFeedbackGenerator alloc] initWithStyle:UIImpactFeedbackStyleLight]; //Light feedback

		} else if (hapticStrength == 2) {
			hapt = [[UIImpactFeedbackGenerator alloc] initWithStyle:UIImpactFeedbackStyleMedium]; //Medium feedback

		} else if (hapticStrength == 3) {
			hapt = [[UIImpactFeedbackGenerator alloc] initWithStyle:UIImpactFeedbackStyleHeavy]; //Heavy feedback

		} else if (hapticStrength == 4) {
			hapt = [[UIImpactFeedbackGenerator alloc] initWithStyle:UIImpactFeedbackStyleSoft]; //Soft feedback

		} else if (hapticStrength == 5) {
			hapt = [[UIImpactFeedbackGenerator alloc] initWithStyle:UIImpactFeedbackStyleRigid]; //Rigid feedback

		}
			
		[hapt impactOccurred];

	} else {
		return %orig;
	}
	
}

- (float)volumeStepUp {

	if (isEnabled && volumeStep != 0.0) {
		return (volumeStep); //possible values from 0.01 -> 1.0

	} else {
		return %orig; // orig returns 0.6
	}
	
}

- (float)volumeStepDown {

	if (isEnabled && volumeStep != 0.0) {
		return (volumeStep); //possible values from 0.01 -> 1.0

	} else {
		return %orig; // orig returns 0.6
	}
	
}


%end

%ctor {
    loadPrefs();
    CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, (CFNotificationCallback)loadPrefs, CFSTR("com.ajaidan.mavalryprefs.settingschanged"), NULL, CFNotificationSuspensionBehaviorCoalesce);

}