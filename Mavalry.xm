#import "Mavalry.h"
// contains pref rules + some other stuff

// app label hiding
%hook SBIconView

- (void)setLabelHidden:(BOOL)arg1 {

  if (hideLabels && isEnabled) {
    return %orig(YES);

  } else {
    return %orig;
  }

}

%end

// page dots hiding
%hook SBIconListPageControl

- (id)initWithFrame:(CGRect)frame {

  if (hideDots && isEnabled) {
    return nil; %orig;

  } else {
    return %orig;

  }

}

%end

%hook CSPageControl

- (id)initWithFrame:(CGRect)frame {

  if (hideDots && isEnabled) {
    return nil; %orig;

  } else {
    return %orig;

  }

}

%end

// begin hiding dock bg
%hook SBDockView

- (void)setBackgroundAlpha:(double)arg1 {

  if (transDock && isEnabled) {
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

%hook NCNotificationListSectionRevealHintView

  -(void)setFrame:(CGRect)arg1 {
    if (olderNotifs && isEnabled) {
	   self.hidden = YES;
    }else {
      return %orig;
    }
  }
%end

%hook MTLumaDodgePillSettings

- (void)setHeight: (double)arg {

  if (homeBar && isEnabled) {
    {
	     %orig(0);
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
