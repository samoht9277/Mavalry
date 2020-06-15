#line 1 "Mavalry.xm"
#import "Mavalry.h"




#include <substrate.h>
#if defined(__clang__)
#if __has_feature(objc_arc)
#define _LOGOS_SELF_TYPE_NORMAL __unsafe_unretained
#define _LOGOS_SELF_TYPE_INIT __attribute__((ns_consumed))
#define _LOGOS_SELF_CONST const
#define _LOGOS_RETURN_RETAINED __attribute__((ns_returns_retained))
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif

@class CSPageControl; @class CCUIBaseSliderView; @class SBIconView; @class SBVolumeControl; @class MTLumaDodgePillSettings; @class NCNotificationListSectionRevealHintView; @class SBIconListPageControl; @class SBDockView; 
static void (*_logos_orig$_ungrouped$SBIconView$setLabelHidden$)(_LOGOS_SELF_TYPE_NORMAL SBIconView* _LOGOS_SELF_CONST, SEL, BOOL); static void _logos_method$_ungrouped$SBIconView$setLabelHidden$(_LOGOS_SELF_TYPE_NORMAL SBIconView* _LOGOS_SELF_CONST, SEL, BOOL); static SBIconListPageControl* (*_logos_orig$_ungrouped$SBIconListPageControl$initWithFrame$)(_LOGOS_SELF_TYPE_INIT SBIconListPageControl*, SEL, CGRect) _LOGOS_RETURN_RETAINED; static SBIconListPageControl* _logos_method$_ungrouped$SBIconListPageControl$initWithFrame$(_LOGOS_SELF_TYPE_INIT SBIconListPageControl*, SEL, CGRect) _LOGOS_RETURN_RETAINED; static CSPageControl* (*_logos_orig$_ungrouped$CSPageControl$initWithFrame$)(_LOGOS_SELF_TYPE_INIT CSPageControl*, SEL, CGRect) _LOGOS_RETURN_RETAINED; static CSPageControl* _logos_method$_ungrouped$CSPageControl$initWithFrame$(_LOGOS_SELF_TYPE_INIT CSPageControl*, SEL, CGRect) _LOGOS_RETURN_RETAINED; static void (*_logos_orig$_ungrouped$SBDockView$setBackgroundAlpha$)(_LOGOS_SELF_TYPE_NORMAL SBDockView* _LOGOS_SELF_CONST, SEL, double); static void _logos_method$_ungrouped$SBDockView$setBackgroundAlpha$(_LOGOS_SELF_TYPE_NORMAL SBDockView* _LOGOS_SELF_CONST, SEL, double); static void (*_logos_orig$_ungrouped$NCNotificationListSectionRevealHintView$setFrame$)(_LOGOS_SELF_TYPE_NORMAL NCNotificationListSectionRevealHintView* _LOGOS_SELF_CONST, SEL, CGRect); static void _logos_method$_ungrouped$NCNotificationListSectionRevealHintView$setFrame$(_LOGOS_SELF_TYPE_NORMAL NCNotificationListSectionRevealHintView* _LOGOS_SELF_CONST, SEL, CGRect); static void (*_logos_orig$_ungrouped$MTLumaDodgePillSettings$setHeight$)(_LOGOS_SELF_TYPE_NORMAL MTLumaDodgePillSettings* _LOGOS_SELF_CONST, SEL, double); static void _logos_method$_ungrouped$MTLumaDodgePillSettings$setHeight$(_LOGOS_SELF_TYPE_NORMAL MTLumaDodgePillSettings* _LOGOS_SELF_CONST, SEL, double); static void (*_logos_orig$_ungrouped$SBVolumeControl$increaseVolume)(_LOGOS_SELF_TYPE_NORMAL SBVolumeControl* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$SBVolumeControl$increaseVolume(_LOGOS_SELF_TYPE_NORMAL SBVolumeControl* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$_ungrouped$SBVolumeControl$decreaseVolume)(_LOGOS_SELF_TYPE_NORMAL SBVolumeControl* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$SBVolumeControl$decreaseVolume(_LOGOS_SELF_TYPE_NORMAL SBVolumeControl* _LOGOS_SELF_CONST, SEL); static float (*_logos_orig$_ungrouped$SBVolumeControl$volumeStepUp)(_LOGOS_SELF_TYPE_NORMAL SBVolumeControl* _LOGOS_SELF_CONST, SEL); static float _logos_method$_ungrouped$SBVolumeControl$volumeStepUp(_LOGOS_SELF_TYPE_NORMAL SBVolumeControl* _LOGOS_SELF_CONST, SEL); static float (*_logos_orig$_ungrouped$SBVolumeControl$volumeStepDown)(_LOGOS_SELF_TYPE_NORMAL SBVolumeControl* _LOGOS_SELF_CONST, SEL); static float _logos_method$_ungrouped$SBVolumeControl$volumeStepDown(_LOGOS_SELF_TYPE_NORMAL SBVolumeControl* _LOGOS_SELF_CONST, SEL); static CCUIBaseSliderView* (*_logos_orig$_ungrouped$CCUIBaseSliderView$initWithFrame$)(_LOGOS_SELF_TYPE_INIT CCUIBaseSliderView*, SEL, CGRect) _LOGOS_RETURN_RETAINED; static CCUIBaseSliderView* _logos_method$_ungrouped$CCUIBaseSliderView$initWithFrame$(_LOGOS_SELF_TYPE_INIT CCUIBaseSliderView*, SEL, CGRect) _LOGOS_RETURN_RETAINED; static void (*_logos_orig$_ungrouped$CCUIBaseSliderView$layoutSubviews)(_LOGOS_SELF_TYPE_NORMAL CCUIBaseSliderView* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$CCUIBaseSliderView$layoutSubviews(_LOGOS_SELF_TYPE_NORMAL CCUIBaseSliderView* _LOGOS_SELF_CONST, SEL); 

#line 5 "Mavalry.xm"


static void _logos_method$_ungrouped$SBIconView$setLabelHidden$(_LOGOS_SELF_TYPE_NORMAL SBIconView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, BOOL arg1) {

  if (hideLabels && isEnabled) {
    return _logos_orig$_ungrouped$SBIconView$setLabelHidden$(self, _cmd, YES);

  } else {
    return _logos_orig$_ungrouped$SBIconView$setLabelHidden$(self, _cmd, arg1);

  }

}






static SBIconListPageControl* _logos_method$_ungrouped$SBIconListPageControl$initWithFrame$(_LOGOS_SELF_TYPE_INIT SBIconListPageControl* __unused self, SEL __unused _cmd, CGRect frame) _LOGOS_RETURN_RETAINED {

  if (hideDots && isEnabled) {
    return nil; _logos_orig$_ungrouped$SBIconListPageControl$initWithFrame$(self, _cmd, frame);

  } else {
    return _logos_orig$_ungrouped$SBIconListPageControl$initWithFrame$(self, _cmd, frame);

  }

}





static CSPageControl* _logos_method$_ungrouped$CSPageControl$initWithFrame$(_LOGOS_SELF_TYPE_INIT CSPageControl* __unused self, SEL __unused _cmd, CGRect frame) _LOGOS_RETURN_RETAINED {

  if (hideDots && isEnabled) {
    return nil; _logos_orig$_ungrouped$CSPageControl$initWithFrame$(self, _cmd, frame);

  } else {
    return _logos_orig$_ungrouped$CSPageControl$initWithFrame$(self, _cmd, frame);

  }

}






static void _logos_method$_ungrouped$SBDockView$setBackgroundAlpha$(_LOGOS_SELF_TYPE_NORMAL SBDockView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, double arg1) {

  if (transDock && isEnabled) {
    arg1 = 0/10;

  } else {
    return _logos_orig$_ungrouped$SBDockView$setBackgroundAlpha$(self, _cmd, arg1);

  }
  _logos_orig$_ungrouped$SBDockView$setBackgroundAlpha$(self, _cmd, arg1);

}



@interface NCNotificationListSectionRevealHintView : UIView
@property (nonatomic, assign, readwrite, getter = isHidden) BOOL hidden;
@end




static void _logos_method$_ungrouped$NCNotificationListSectionRevealHintView$setFrame$(_LOGOS_SELF_TYPE_NORMAL NCNotificationListSectionRevealHintView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, CGRect arg1) {

  if (olderNotifs && isEnabled) {
	  self.hidden = YES;

  } else {
    return _logos_orig$_ungrouped$NCNotificationListSectionRevealHintView$setFrame$(self, _cmd, arg1);

  }

}






static void _logos_method$_ungrouped$MTLumaDodgePillSettings$setHeight$(_LOGOS_SELF_TYPE_NORMAL MTLumaDodgePillSettings* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, double arg) {

  if (homeBar && isEnabled) {
    _logos_orig$_ungrouped$MTLumaDodgePillSettings$setHeight$(self, _cmd, 0);

  } else {
    return _logos_orig$_ungrouped$MTLumaDodgePillSettings$setHeight$(self, _cmd, arg);

  }

}






static void _logos_method$_ungrouped$SBVolumeControl$increaseVolume(_LOGOS_SELF_TYPE_NORMAL SBVolumeControl* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {

	if (isEnabled && hapticVol) {

		_logos_orig$_ungrouped$SBVolumeControl$increaseVolume(self, _cmd);

		UIImpactFeedbackGenerator *hapt = [[UIImpactFeedbackGenerator alloc] init];
		[hapt prepare];

		if (hapticPref == 1) {
			hapt = [[UIImpactFeedbackGenerator alloc] initWithStyle:UIImpactFeedbackStyleLight]; 

		} else if (hapticPref == 2) {
			hapt = [[UIImpactFeedbackGenerator alloc] initWithStyle:UIImpactFeedbackStyleMedium]; 

		} else if (hapticPref == 3) {
			hapt = [[UIImpactFeedbackGenerator alloc] initWithStyle:UIImpactFeedbackStyleHeavy]; 

		} else if (hapticPref == 4) {
			hapt = [[UIImpactFeedbackGenerator alloc] initWithStyle:UIImpactFeedbackStyleSoft]; 

		} else if (hapticPref == 5) {
			hapt = [[UIImpactFeedbackGenerator alloc] initWithStyle:UIImpactFeedbackStyleRigid]; 

		}

		[hapt impactOccurred];

	} else {
		return _logos_orig$_ungrouped$SBVolumeControl$increaseVolume(self, _cmd);
	}

}

static void _logos_method$_ungrouped$SBVolumeControl$decreaseVolume(_LOGOS_SELF_TYPE_NORMAL SBVolumeControl* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {

	if (isEnabled && hapticVol) {

		_logos_orig$_ungrouped$SBVolumeControl$decreaseVolume(self, _cmd);

		UIImpactFeedbackGenerator *hapt = [[UIImpactFeedbackGenerator alloc] init];
		[hapt prepare];

		if (hapticPref == 1) {
			hapt = [[UIImpactFeedbackGenerator alloc] initWithStyle:UIImpactFeedbackStyleLight]; 

		} else if (hapticPref == 2) {
			hapt = [[UIImpactFeedbackGenerator alloc] initWithStyle:UIImpactFeedbackStyleMedium]; 

		} else if (hapticPref == 3) {
			hapt = [[UIImpactFeedbackGenerator alloc] initWithStyle:UIImpactFeedbackStyleHeavy]; 

		} else if (hapticPref == 4) {
			hapt = [[UIImpactFeedbackGenerator alloc] initWithStyle:UIImpactFeedbackStyleSoft]; 

		} else if (hapticPref == 5) {
			hapt = [[UIImpactFeedbackGenerator alloc] initWithStyle:UIImpactFeedbackStyleRigid]; 

		}

		[hapt impactOccurred];

	} else {
		return _logos_orig$_ungrouped$SBVolumeControl$decreaseVolume(self, _cmd);
	}

}


static float _logos_method$_ungrouped$SBVolumeControl$volumeStepUp(_LOGOS_SELF_TYPE_NORMAL SBVolumeControl* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {

	if (isEnabled && volStep != 0.0) {
		return (volStep); 

	} else {
		return _logos_orig$_ungrouped$SBVolumeControl$volumeStepUp(self, _cmd); 
	}

}

static float _logos_method$_ungrouped$SBVolumeControl$volumeStepDown(_LOGOS_SELF_TYPE_NORMAL SBVolumeControl* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {

	if (isEnabled && volStep != 0.0) {
		return (volStep); 

	} else {
		return _logos_orig$_ungrouped$SBVolumeControl$volumeStepDown(self, _cmd); 
	}

}








__attribute__((used)) static UILabel * _logos_method$_ungrouped$CCUIBaseSliderView$percentLabel(CCUIBaseSliderView * __unused self, SEL __unused _cmd) { return (UILabel *)objc_getAssociatedObject(self, (void *)_logos_method$_ungrouped$CCUIBaseSliderView$percentLabel); }; __attribute__((used)) static void _logos_method$_ungrouped$CCUIBaseSliderView$setPercentLabel(CCUIBaseSliderView * __unused self, SEL __unused _cmd, UILabel * rawValue) { objc_setAssociatedObject(self, (void *)_logos_method$_ungrouped$CCUIBaseSliderView$percentLabel, rawValue, OBJC_ASSOCIATION_RETAIN_NONATOMIC); }

static CCUIBaseSliderView* _logos_method$_ungrouped$CCUIBaseSliderView$initWithFrame$(_LOGOS_SELF_TYPE_INIT CCUIBaseSliderView* __unused self, SEL __unused _cmd, CGRect frame) _LOGOS_RETURN_RETAINED {
	CCUIBaseSliderView *orig = _logos_orig$_ungrouped$CCUIBaseSliderView$initWithFrame$(self, _cmd, frame);
	orig.percentLabel = [[UILabel alloc] init];
	orig.percentLabel.textColor = [UIColor whiteColor];
	orig.percentLabel.text = @"0%";
	orig.percentLabel.center = CGPointMake(self.bounds.size.width*0.5, self.bounds.size.height*0.85);
	[orig addSubview:orig.percentLabel];
	orig.percentLabel.layer.allowsGroupBlending = NO;
	orig.percentLabel.layer.allowsGroupOpacity = YES;
	orig.percentLabel.layer.compositingFilter = kCAFilterDestOut;
	orig.percentLabel.font = [orig.percentLabel.font fontWithSize:(ccLabelsSize)];
	return orig;
}

static void _logos_method$_ungrouped$CCUIBaseSliderView$layoutSubviews(_LOGOS_SELF_TYPE_NORMAL CCUIBaseSliderView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {

	if (isEnabled && ccLabels) {

		_logos_orig$_ungrouped$CCUIBaseSliderView$layoutSubviews(self, _cmd);

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
		return _logos_orig$_ungrouped$CCUIBaseSliderView$layoutSubviews(self, _cmd);
	}

}




static __attribute__((constructor)) void _logosLocalCtor_5813a6c8(int __unused argc, char __unused **argv, char __unused **envp) {
  loadPrefs();
  CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, (CFNotificationCallback)loadPrefs, CFSTR("com.ajaidan.mavalryprefs.settingschanged"), NULL, CFNotificationSuspensionBehaviorCoalesce);

}
static __attribute__((constructor)) void _logosLocalInit() {
{Class _logos_class$_ungrouped$SBIconView = objc_getClass("SBIconView"); MSHookMessageEx(_logos_class$_ungrouped$SBIconView, @selector(setLabelHidden:), (IMP)&_logos_method$_ungrouped$SBIconView$setLabelHidden$, (IMP*)&_logos_orig$_ungrouped$SBIconView$setLabelHidden$);Class _logos_class$_ungrouped$SBIconListPageControl = objc_getClass("SBIconListPageControl"); MSHookMessageEx(_logos_class$_ungrouped$SBIconListPageControl, @selector(initWithFrame:), (IMP)&_logos_method$_ungrouped$SBIconListPageControl$initWithFrame$, (IMP*)&_logos_orig$_ungrouped$SBIconListPageControl$initWithFrame$);Class _logos_class$_ungrouped$CSPageControl = objc_getClass("CSPageControl"); MSHookMessageEx(_logos_class$_ungrouped$CSPageControl, @selector(initWithFrame:), (IMP)&_logos_method$_ungrouped$CSPageControl$initWithFrame$, (IMP*)&_logos_orig$_ungrouped$CSPageControl$initWithFrame$);Class _logos_class$_ungrouped$SBDockView = objc_getClass("SBDockView"); MSHookMessageEx(_logos_class$_ungrouped$SBDockView, @selector(setBackgroundAlpha:), (IMP)&_logos_method$_ungrouped$SBDockView$setBackgroundAlpha$, (IMP*)&_logos_orig$_ungrouped$SBDockView$setBackgroundAlpha$);Class _logos_class$_ungrouped$NCNotificationListSectionRevealHintView = objc_getClass("NCNotificationListSectionRevealHintView"); MSHookMessageEx(_logos_class$_ungrouped$NCNotificationListSectionRevealHintView, @selector(setFrame:), (IMP)&_logos_method$_ungrouped$NCNotificationListSectionRevealHintView$setFrame$, (IMP*)&_logos_orig$_ungrouped$NCNotificationListSectionRevealHintView$setFrame$);Class _logos_class$_ungrouped$MTLumaDodgePillSettings = objc_getClass("MTLumaDodgePillSettings"); MSHookMessageEx(_logos_class$_ungrouped$MTLumaDodgePillSettings, @selector(setHeight:), (IMP)&_logos_method$_ungrouped$MTLumaDodgePillSettings$setHeight$, (IMP*)&_logos_orig$_ungrouped$MTLumaDodgePillSettings$setHeight$);Class _logos_class$_ungrouped$SBVolumeControl = objc_getClass("SBVolumeControl"); MSHookMessageEx(_logos_class$_ungrouped$SBVolumeControl, @selector(increaseVolume), (IMP)&_logos_method$_ungrouped$SBVolumeControl$increaseVolume, (IMP*)&_logos_orig$_ungrouped$SBVolumeControl$increaseVolume);MSHookMessageEx(_logos_class$_ungrouped$SBVolumeControl, @selector(decreaseVolume), (IMP)&_logos_method$_ungrouped$SBVolumeControl$decreaseVolume, (IMP*)&_logos_orig$_ungrouped$SBVolumeControl$decreaseVolume);MSHookMessageEx(_logos_class$_ungrouped$SBVolumeControl, @selector(volumeStepUp), (IMP)&_logos_method$_ungrouped$SBVolumeControl$volumeStepUp, (IMP*)&_logos_orig$_ungrouped$SBVolumeControl$volumeStepUp);MSHookMessageEx(_logos_class$_ungrouped$SBVolumeControl, @selector(volumeStepDown), (IMP)&_logos_method$_ungrouped$SBVolumeControl$volumeStepDown, (IMP*)&_logos_orig$_ungrouped$SBVolumeControl$volumeStepDown);Class _logos_class$_ungrouped$CCUIBaseSliderView = objc_getClass("CCUIBaseSliderView"); MSHookMessageEx(_logos_class$_ungrouped$CCUIBaseSliderView, @selector(initWithFrame:), (IMP)&_logos_method$_ungrouped$CCUIBaseSliderView$initWithFrame$, (IMP*)&_logos_orig$_ungrouped$CCUIBaseSliderView$initWithFrame$);MSHookMessageEx(_logos_class$_ungrouped$CCUIBaseSliderView, @selector(layoutSubviews), (IMP)&_logos_method$_ungrouped$CCUIBaseSliderView$layoutSubviews, (IMP*)&_logos_orig$_ungrouped$CCUIBaseSliderView$layoutSubviews);{ char _typeEncoding[1024]; sprintf(_typeEncoding, "%s@:", @encode(UILabel *)); class_addMethod(_logos_class$_ungrouped$CCUIBaseSliderView, @selector(percentLabel), (IMP)&_logos_method$_ungrouped$CCUIBaseSliderView$percentLabel, _typeEncoding); sprintf(_typeEncoding, "v@:%s", @encode(UILabel *)); class_addMethod(_logos_class$_ungrouped$CCUIBaseSliderView, @selector(setPercentLabel:), (IMP)&_logos_method$_ungrouped$CCUIBaseSliderView$setPercentLabel, _typeEncoding); } } }
#line 276 "Mavalry.xm"
