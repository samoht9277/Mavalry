#line 1 "NoMoreScrollstoTop.xm"
#define PLIST_PATH @"/var/mobile/Library/Preferences/com.ajaidan.mavalryprefs.plist"

BOOL isEnabled;
BOOL scrollsTop;

static void loadPrefs() {
    NSMutableDictionary *prefs = [[NSMutableDictionary alloc] initWithContentsOfFile:PLIST_PATH];
    isEnabled = [prefs objectForKey:@"isEnabled"] ? [[prefs objectForKey:@"isEnabled"] boolValue] : YES;
    scrollsTop = [prefs objectForKey:@"scrollsTop"] ? [[prefs objectForKey:@"scrollsTop"] boolValue] : YES;
}


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

@class UIScrollView; 
static UIScrollView* (*_logos_orig$_ungrouped$UIScrollView$initWithFrame$)(_LOGOS_SELF_TYPE_INIT UIScrollView*, SEL, CGRect) _LOGOS_RETURN_RETAINED; static UIScrollView* _logos_method$_ungrouped$UIScrollView$initWithFrame$(_LOGOS_SELF_TYPE_INIT UIScrollView*, SEL, CGRect) _LOGOS_RETURN_RETAINED; static UIScrollView* (*_logos_orig$_ungrouped$UIScrollView$initWithCoder$)(_LOGOS_SELF_TYPE_INIT UIScrollView*, SEL, id) _LOGOS_RETURN_RETAINED; static UIScrollView* _logos_method$_ungrouped$UIScrollView$initWithCoder$(_LOGOS_SELF_TYPE_INIT UIScrollView*, SEL, id) _LOGOS_RETURN_RETAINED; 

#line 12 "NoMoreScrollstoTop.xm"


static UIScrollView* _logos_method$_ungrouped$UIScrollView$initWithFrame$(_LOGOS_SELF_TYPE_INIT UIScrollView* __unused self, SEL __unused _cmd, CGRect frame) _LOGOS_RETURN_RETAINED {
	if (scrollsTop && isEnabled) {
    	self = _logos_orig$_ungrouped$UIScrollView$initWithFrame$(self, _cmd, frame);
    	self.scrollsToTop = false;
    	return self;
	} else {
		return _logos_orig$_ungrouped$UIScrollView$initWithFrame$(self, _cmd, frame);
	}
}

static UIScrollView* _logos_method$_ungrouped$UIScrollView$initWithCoder$(_LOGOS_SELF_TYPE_INIT UIScrollView* __unused self, SEL __unused _cmd, id arg1) _LOGOS_RETURN_RETAINED {
	if (scrollsTop && isEnabled) {
    	self = _logos_orig$_ungrouped$UIScrollView$initWithCoder$(self, _cmd, arg1);
    	self.scrollsToTop = false;
    	return self;
	} else {
		return _logos_orig$_ungrouped$UIScrollView$initWithCoder$(self, _cmd, arg1);
	}
}





static __attribute__((constructor)) void _logosLocalCtor_1b34b824(int __unused argc, char __unused **argv, char __unused **envp) {
  loadPrefs();
  CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, (CFNotificationCallback)loadPrefs, CFSTR("com.ajaidan.mavalryprefs.settingschanged"), NULL, CFNotificationSuspensionBehaviorCoalesce);

}
static __attribute__((constructor)) void _logosLocalInit() {
{Class _logos_class$_ungrouped$UIScrollView = objc_getClass("UIScrollView"); MSHookMessageEx(_logos_class$_ungrouped$UIScrollView, @selector(initWithFrame:), (IMP)&_logos_method$_ungrouped$UIScrollView$initWithFrame$, (IMP*)&_logos_orig$_ungrouped$UIScrollView$initWithFrame$);MSHookMessageEx(_logos_class$_ungrouped$UIScrollView, @selector(initWithCoder:), (IMP)&_logos_method$_ungrouped$UIScrollView$initWithCoder$, (IMP*)&_logos_orig$_ungrouped$UIScrollView$initWithCoder$);} }
#line 43 "NoMoreScrollstoTop.xm"
