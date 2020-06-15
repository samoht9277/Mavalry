#import "Mavalry.h"

// app label hiding
%hook SBIconView

- (void)setLabelHidden:(BOOL)arg1 {

  if (wantsHiddenLabels && isEnabled) {
    return %orig(YES);

  } else {
    return %orig;

  }

}

%end

// page dots hiding
%hook SBIconListPageControl

- (id)initWithFrame:(CGRect)frame {

  if (wantsHiddenPageDots && isEnabled) {
    return nil; %orig;

  } else {
    return %orig;

  }

}

%end

%hook CSPageControl

- (id)initWithFrame:(CGRect)frame {
	if (wantsHiddenPageDots && isEnabled) {
    	return nil; %orig;
	
	} else {
    	return %orig;
	}

}

%end

// begin hiding dock bg
%hook SBDockView

- (void)setBackgroundAlpha:(double)arg1 {

	if (wantsTransparentDock && isEnabled) {
    	arg1 = 0/10;
	
	} else {
    	return %orig;
	}

  %orig(arg1);

}

%end

@interface NCNotificationListSectionRevealHintView : UIView
@property (nonatomic, assign, readwrite, getter = isHidden) BOOL hidden;
@end

//no longer notifications hiding
%hook NCNotificationListSectionRevealHintView

-(void)setFrame:(CGRect)arg1 {

	if (wantsOlderNotifs && isEnabled) {
		self.hidden = YES;
	
	} else {
    	return %orig;
	}

}

%end

//wantsHomeBar hiding
%hook MTLumaDodgePillSettings

- (void)setHeight: (double)arg {

	if (wantsHomeBar && isEnabled) {
    	%orig(0);
	
	} else {
    	return %orig;
	}

}

%end

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

//haptics and steps
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
		return (volumeStep);

	} else {
		return %orig;
	}

}

- (float)volumeStepDown {

	if (isEnabled && volumeStep != 0.0) {
		return (volumeStep);

	} else {
		return %orig;
	}

}

%end

//CC percentage labels
%hook CCUIBaseSliderView

	%property (nonatomic, retain) UILabel *percentLabel;

- (id)initWithFrame:(CGRect)frame {
	CCUIBaseSliderView *orig = %orig;
	orig.percentLabel = [[UILabel alloc] init];
	orig.percentLabel.textColor = [UIColor whiteColor];
	orig.percentLabel.text = @"0%";
	orig.percentLabel.center = CGPointMake(self.bounds.size.width*0.5, self.bounds.size.height*0.85);
	[orig addSubview:orig.percentLabel];
	orig.percentLabel.layer.allowsGroupBlending = NO;
	orig.percentLabel.layer.allowsGroupOpacity = YES;
	orig.percentLabel.layer.compositingFilter = kCAFilterDestOut;
	orig.percentLabel.font = [orig.percentLabel.font fontWithSize:(CCLabelsSize)];
	return orig;
}

- (void)layoutSubviews {

	if (isEnabled && wantsCCLabels) {

		%orig;

		if ([self valueForKey:@"_glyphPackageView"]) {
			UIView *glyphView = (UIView *)[self valueForKey:@"_glyphPackageView"];
			glyphView.center = CGPointMake(self.bounds.size.width*0.5,self.bounds.size.height*0.5);
			if (self.percentLabel) {
				if ([self.percentLabel superview] != glyphView) {
					if ([self.percentLabel superview]) [self.percentLabel removeFromSuperview];
					[glyphView addSubview:self.percentLabel];
				}

				if ([self.percentLabel superview] == glyphView) {
					self.percentLabel.layer.allowsGroupBlending = NO;
					self.percentLabel.layer.allowsGroupOpacity = YES;
					self.percentLabel.layer.compositingFilter = kCAFilterDestOut;
					self.percentLabel.text = [[NSString stringWithFormat:@"%.f", [self value]*100] stringByAppendingString:@"%"];
					[self.percentLabel sizeToFit];
					self.percentLabel.center = [self convertPoint:CGPointMake(self.bounds.size.width*0.5, self.bounds.size.height*0.85) toView:glyphView];

				}

			}

			if ([self valueForKey:@"_compensatingGlyphPackageView"]) {
				UIView *compensatingGlyphView = [self valueForKey:@"_compensatingGlyphPackageView"];
				compensatingGlyphView.center = glyphView.center;

			}

		}

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
