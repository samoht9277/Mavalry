#import "Mavalry.h"
#import <spawn.h>

// Check if tweak is set up
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

%group LSnoToday

%hook SBMainDisplayPolicyAggregator

-(BOOL)_allowsCapabilityLockScreenTodayViewWithExplanation:(id*)arg1 {
    return false;
}

-(BOOL)_allowsCapabilityTodayViewWithExplanation:(id*)arg1 {
    return false;
}

%end
%end

%group HSnoToday
%hook SBRootFolderView

-(unsigned long long)_minusPageCount {
    return false;
}

-(void)_layoutSubviewsForTodayView {
    %orig;
    [self todayViewController].view.hidden = false;
}

-(void)beginPageStateTransitionToState:(long long)arg1 animated:(BOOL)arg2 interactive:(BOOL)arg3  {
    if (arg1 == 2) return; 
    %orig;
}

%end
%end

%group HSnoSpotlight
%hook SBRootFolderView

-(void)beginPageStateTransitionToState:(long long)arg1 animated:(BOOL)arg2 interactive:(BOOL)arg3  {
    if (arg1 == 3) return; 
    %orig;
}

%end
%end

%group DNDNotifs
%hook DNDNotificationsService

-(id)initWithClientIdentifier:(id)arg1 {
    return nil;
}
%end
%end

%group HideLabels
%hook SBIconView
- (void)setLabelHidden:(BOOL)arg1 {
	arg1 = YES;
	%orig(arg1);
}
%end
%end

%group PageDots
%hook SBIconListPageControl
- (id)initWithFrame:(CGRect)frame {
	return nil;
}
%end

%hook CSPageControl
- (id)initWithFrame:(CGRect)frame {
	return nil;
}
%end
%end

%group DockBG
%hook SBDockView
- (void)setBackgroundAlpha:(double)arg1 {
	arg1 = 0;
	%orig(arg1);
}

%end
%end

%group FolderBG 
%hook SBFolderBackgroundView
- (id)initWithFrame:(struct CGRect)arg1{
  	return NULL;
}
%end

%hook SBFolderIconImageView
 - (void)setBackgroundView : (UIView *)backgroundView {}
%end
%end

%group OlderNotifs
%hook NCNotificationListSectionRevealHintView
-(void)setFrame:(CGRect)arg1 {
	self.hidden = YES;
	%orig;
}
%end
%end

%group HomeBar
%hook MTLumaDodgePillSettings
- (void)setHeight:(double)arg1 {
	arg1 = 0;
	%orig(arg1);
}

%end
%end

%group CCPercentage
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

		if ([self valueForKey:@"_compensatingGlyphPackageView"]) {
			UIView *compensatingGlyphView = [self valueForKey:@"_compensatingGlyphPackageView"];
			compensatingGlyphView.center = glyphView.center;

		}
	}
}
}
%end
%end

// Loads prefs and inits
%ctor {
	%init;
	loadPrefs();
	CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, (CFNotificationCallback)loadPrefs, CFSTR("com.ajaidan.mavalryprefs.settingschanged"), NULL, CFNotificationSuspensionBehaviorCoalesce);
		if (isEnabled && moonGone) %init(DNDNotifs);
		if (isEnabled && wantsHiddenLabels) %init(HideLabels);
		if (isEnabled && wantsHiddenPageDots) %init(PageDots);
		if (isEnabled && wantsTransparentDock) %init(DockBG);
		if (isEnabled && hideFolderBackground) %init(FolderBG);
		if (isEnabled && wantsOlderNotifs) %init(OlderNotifs);
		if (isEnabled && wantsHomeBar) %init(HomeBar);
		if (isEnabled && wantsCCLabels) %init(CCPercentage);
		if (isEnabled && noTodayHS) %init(HSnoToday);
		if (isEnabled && noTodayLS) %init(LSnoToday);
		if (isEnabled && noSpotlight) %init(HSnoSpotlight);
}
