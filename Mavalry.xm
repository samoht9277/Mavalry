#import "Mavalry.h"
// contains pref rules + some other stuff

// app label hiding
%hook SBIconView

- (void)setLabelHidden:(BOOL)arg1 {

  if (hideLabels) {
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

// mas pref junk
%ctor {
  loadPrefs();
  CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, (CFNotificationCallback)loadPrefs, CFSTR("io.github.ajaidan.mavalryprefs.settingschanged"), NULL, CFNotificationSuspensionBehaviorCoalesce);

}
