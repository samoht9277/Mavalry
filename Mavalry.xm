#import "Mavalry.h"
#import <spawn.h>

%hook DNDNotificationsService

-(id)initWithClientIdentifier:(id)arg1 {
	if (isEnabled && moonGone) {
    	return nil;
  	} else {
	  return %orig;
	}
}
%end

%hook SBLockScreenManager

- (void)lockScreenViewControllerDidDismiss {
	NSString *path = @"/var/mobile/Library/Preferences/com.ajaidan.mavalryprefs.plist";
	NSMutableDictionary *settings = [NSMutableDictionary dictionary];
	[settings addEntriesFromDictionary:[NSDictionary dictionaryWithContentsOfFile:path]];
	NSNumber *didShowOBWelcomeController = [settings valueForKey:@"didShowOBWelcomeController"] ?: @0;
	if([didShowOBWelcomeController isEqual:@0]) {
		[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"App-prefs:Mavalry"] options:@{} completionHandler:nil];
	} else {
		return %orig;
	}
}
%end

%hook SBRootFolderView

-(BOOL)isTodayViewPageHidden {
	if (isEnabled && noToday) {
		return true;
		%orig;
	} else {
		return %orig;
	}
}
%end

// credit to Dave van Wijk

%hook WGWidgetWrapperView
-(void)layoutSubviews {
	if (isEnabled && noToday) {
		self.hidden = true;
		%orig;
	} else {
		return %orig;
	}
}
%end

%hook SBSearchBar
-(void)layoutSubviews {
	if (isEnabled && noToday) {
		self.hidden = true;
		%orig;
	} else {
		return %orig;
	}
}
%end

%hook WGWidgetListFooterView
-(void)layoutSubviews {
	if (isEnabled && noToday) {
		self.hidden = true;
		%orig;
	} else {
		return %orig;
	}
}
%end

// App label hiding
%hook SBIconView
- (void)setLabelHidden:(BOOL)arg1 {
	if (wantsHiddenLabels && isEnabled) {
		arg1 = YES;
		%orig(arg1);
	} else {
		return %orig;
	}
}
%end

// Page dots hiding
%hook SBIconListPageControl
- (id)initWithFrame:(CGRect)frame {
	if (wantsHiddenPageDots && isEnabled) {
		return nil;

	}
	return %orig;
}

%end

%hook CSPageControl
- (id)initWithFrame:(CGRect)frame {
	if (wantsHiddenPageDots && isEnabled) {
		return nil;
	} else {
		return %orig;
	}
}
%end

// Begin hiding dock BG
%hook SBDockView
- (void)setBackgroundAlpha:(double)arg1 {
	if (wantsTransparentDock && isEnabled) {
		arg1 = 0;
	}
	%orig(arg1);
}

%end

// Hide folder backgrounds  
%hook SBFolderBackgroundView
- (id)initWithFrame:(struct CGRect)arg1{
	if(hideFolderBackground && isEnabled) {
  		return NULL;
	} else {
		return %orig;
	}
}
%end

%hook SBFolderIconImageView
 - (void)setBackgroundView : (UIView *)backgroundView {
	if(hideFolderBackground && isEnabled) {
	} else {
		return %orig;
	}
}
%end

// No older notifications hiding
%hook NCNotificationListSectionRevealHintView
-(void)setFrame:(CGRect)arg1 {
	if (wantsOlderNotifs && isEnabled) {
		self.hidden = YES;
	}
	%orig;
}

%end

// Hide homebar
%hook MTLumaDodgePillSettings
- (void)setHeight:(double)arg1 {
	if (wantsHomeBar && isEnabled) {
		arg1 = 0;
	}
	%orig(arg1);
}

%end

// CC percentage labels : Credit to Andy Wiik
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
	%orig;

	if (isEnabled && wantsCCLabels) {
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
	}
}
%end

// Loads prefs
%ctor {
	loadPrefs();
	CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, (CFNotificationCallback)loadPrefs, CFSTR("com.ajaidan.mavalryprefs.settingschanged"), NULL, CFNotificationSuspensionBehaviorCoalesce);
}
