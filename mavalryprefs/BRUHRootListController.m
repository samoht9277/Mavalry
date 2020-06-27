#include "BRUHRootListController.h"
#import <Foundation/Foundation.h>
#import <Preferences/PSSpecifier.h>
#import <Preferences/PSSwitchTableCell.h>
#import <AudioToolbox/AudioServices.h>
#import <SpringBoard/SpringBoard.h>
#import <SpringBoardServices/SBSRestartRenderServerAction.h>
#import <FrontBoardServices/FBSSystemService.h>
#import <Preferences/PreferencesAppController.h>

@interface BRUHSwitchCell : PSSwitchTableCell
-(UIColor *)colorFromHex:(NSString *)hex withAlpha:(CGFloat)alpha;
@end

@implementation BRUHSwitchCell {
  UIColor *_switchColor;
}

  -(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)identifier specifier:(PSSpecifier *)specifier {
    self = [super initWithStyle:style reuseIdentifier:identifier specifier:specifier];

    if(self) {
      ((UISwitch *)self.control).onTintColor = [self colorFromHex:[specifier propertyForKey:@"switchColor"] withAlpha:[[specifier propertyForKey:@"switchColorAlpha"] floatValue]];
    }

    return self;
  }

  -(UIColor *)colorFromHex:(NSString *)hex withAlpha:(CGFloat)alpha {   
    unsigned rgbValue = 0;
    NSScanner *scanner = [NSScanner scannerWithString:hex];
    [scanner setCharactersToBeSkipped:[NSCharacterSet characterSetWithCharactersInString:@"#"]];
    [scanner scanHexInt:&rgbValue];

    return [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16)) / 255.0 green:((float)((rgbValue & 0x00FF00) >> 8)) / 255.0 blue:((float)((rgbValue & 0x0000FF) >> 0)) / 255.0 alpha:alpha];
  }
@end

@interface OBButtonTray : UIView
- (void)addButton:(id)arg1;
- (void)addCaptionText:(id)arg1;;
@end

@interface OBBoldTrayButton : UIButton
-(void)setTitle:(id)arg1 forState:(unsigned long long)arg2;
+(id)buttonWithType:(long long)arg1;
@end

@interface OBWelcomeController : UIViewController
- (OBButtonTray *)buttonTray;
- (id)initWithTitle:(id)arg1 detailText:(id)arg2 icon:(id)arg3;
- (void)addBulletedListItemWithTitle:(id)arg1 description:(id)arg2 image:(id)arg3;
@end

OBWelcomeController *welcomeController; // Declaring this here outside of a method will allow the use of it later, such as dismissing.

@implementation SB

- (id)readPreferenceValue:(PSSpecifier*)specifier {
	NSString *path = [NSString stringWithFormat:@"/User/Library/Preferences/%@.plist", specifier.properties[@"defaults"]];
	NSMutableDictionary *settings = [NSMutableDictionary dictionary];
	[settings addEntriesFromDictionary:[NSDictionary dictionaryWithContentsOfFile:path]];
	return (settings[specifier.properties[@"key"]]) ?: specifier.properties[@"default"];
}

- (void)setPreferenceValue:(id)value specifier:(PSSpecifier*)specifier {
	NSString *path = [NSString stringWithFormat:@"/User/Library/Preferences/%@.plist", specifier.properties[@"defaults"]];
	NSMutableDictionary *settings = [NSMutableDictionary dictionary];
	[settings addEntriesFromDictionary:[NSDictionary dictionaryWithContentsOfFile:path]];
	[settings setObject:value forKey:specifier.properties[@"key"]];
	[settings writeToFile:path atomically:YES];
	CFStringRef notificationName = (__bridge CFStringRef)specifier.properties[@"PostNotification"];
	if (notificationName) {
		CFNotificationCenterPostNotification(CFNotificationCenterGetDarwinNotifyCenter(), notificationName, NULL, NULL, YES);
	}
}

- (id)specifiers {
	if(_specifiers == nil) {
		_specifiers = [self loadSpecifiersFromPlistName:@"SB" target:self];
	}
	return _specifiers;
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    UIColor *tintColor = [UIColor colorWithRed: 0.60 green: 0.21 blue: 0.77 alpha: 1.00];
    [[[[self navigationController] navigationController] navigationBar] setTintColor:tintColor];
}

-(void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [UIView animateWithDuration:1.0 animations:^{
        [[[[self navigationController] navigationController] navigationBar] setTintColor:nil];
    }];
}

@end

@implementation Lockscreen

- (id)readPreferenceValue:(PSSpecifier*)specifier {
	NSString *path = [NSString stringWithFormat:@"/User/Library/Preferences/%@.plist", specifier.properties[@"defaults"]];
	NSMutableDictionary *settings = [NSMutableDictionary dictionary];
	[settings addEntriesFromDictionary:[NSDictionary dictionaryWithContentsOfFile:path]];
	return (settings[specifier.properties[@"key"]]) ?: specifier.properties[@"default"];
}

- (void)setPreferenceValue:(id)value specifier:(PSSpecifier*)specifier {
	NSString *path = [NSString stringWithFormat:@"/User/Library/Preferences/%@.plist", specifier.properties[@"defaults"]];
	NSMutableDictionary *settings = [NSMutableDictionary dictionary];
	[settings addEntriesFromDictionary:[NSDictionary dictionaryWithContentsOfFile:path]];
	[settings setObject:value forKey:specifier.properties[@"key"]];
	[settings writeToFile:path atomically:YES];
	CFStringRef notificationName = (__bridge CFStringRef)specifier.properties[@"PostNotification"];
	if (notificationName) {
		CFNotificationCenterPostNotification(CFNotificationCenterGetDarwinNotifyCenter(), notificationName, NULL, NULL, YES);
	}
}

- (id)specifiers {
	if(_specifiers == nil) {
		_specifiers = [self loadSpecifiersFromPlistName:@"Lockscreen" target:self];
	}
	return _specifiers;
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    UIColor *tintColor = [UIColor colorWithRed: 0.60 green: 0.21 blue: 0.77 alpha: 1.00];
    [[[[self navigationController] navigationController] navigationBar] setTintColor:tintColor];
}

-(void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [UIView animateWithDuration:1.0 animations:^{
        [[[[self navigationController] navigationController] navigationBar] setTintColor:nil];
    }];
}

@end

@implementation CC

- (id)readPreferenceValue:(PSSpecifier*)specifier {
	NSString *path = [NSString stringWithFormat:@"/User/Library/Preferences/%@.plist", specifier.properties[@"defaults"]];
	NSMutableDictionary *settings = [NSMutableDictionary dictionary];
	[settings addEntriesFromDictionary:[NSDictionary dictionaryWithContentsOfFile:path]];
	return (settings[specifier.properties[@"key"]]) ?: specifier.properties[@"default"];
}

- (void)setPreferenceValue:(id)value specifier:(PSSpecifier*)specifier {
	NSString *path = [NSString stringWithFormat:@"/User/Library/Preferences/%@.plist", specifier.properties[@"defaults"]];
	NSMutableDictionary *settings = [NSMutableDictionary dictionary];
	[settings addEntriesFromDictionary:[NSDictionary dictionaryWithContentsOfFile:path]];
	[settings setObject:value forKey:specifier.properties[@"key"]];
	[settings writeToFile:path atomically:YES];
	CFStringRef notificationName = (__bridge CFStringRef)specifier.properties[@"PostNotification"];
	if (notificationName) {
		CFNotificationCenterPostNotification(CFNotificationCenterGetDarwinNotifyCenter(), notificationName, NULL, NULL, YES);
	}
}

- (id)specifiers {
	if(_specifiers == nil) {
		_specifiers = [self loadSpecifiersFromPlistName:@"CC" target:self];
	}
	return _specifiers;
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    UIColor *tintColor = [UIColor colorWithRed: 0.60 green: 0.21 blue: 0.77 alpha: 1.00];
    [[[[self navigationController] navigationController] navigationBar] setTintColor:tintColor];
}

-(void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [UIView animateWithDuration:1.0 animations:^{
        [[[[self navigationController] navigationController] navigationBar] setTintColor:nil];
    }];
}

@end

@implementation Applications

- (id)readPreferenceValue:(PSSpecifier*)specifier {
	NSString *path = [NSString stringWithFormat:@"/User/Library/Preferences/%@.plist", specifier.properties[@"defaults"]];
	NSMutableDictionary *settings = [NSMutableDictionary dictionary];
	[settings addEntriesFromDictionary:[NSDictionary dictionaryWithContentsOfFile:path]];
	return (settings[specifier.properties[@"key"]]) ?: specifier.properties[@"default"];
}

- (void)setPreferenceValue:(id)value specifier:(PSSpecifier*)specifier {
	NSString *path = [NSString stringWithFormat:@"/User/Library/Preferences/%@.plist", specifier.properties[@"defaults"]];
	NSMutableDictionary *settings = [NSMutableDictionary dictionary];
	[settings addEntriesFromDictionary:[NSDictionary dictionaryWithContentsOfFile:path]];
	[settings setObject:value forKey:specifier.properties[@"key"]];
	[settings writeToFile:path atomically:YES];
	CFStringRef notificationName = (__bridge CFStringRef)specifier.properties[@"PostNotification"];
	if (notificationName) {
		CFNotificationCenterPostNotification(CFNotificationCenterGetDarwinNotifyCenter(), notificationName, NULL, NULL, YES);
	}
}

- (id)specifiers {
	if(_specifiers == nil) {
		_specifiers = [self loadSpecifiersFromPlistName:@"Applications" target:self];
	}
	return _specifiers;
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    UIColor *tintColor = [UIColor colorWithRed: 0.60 green: 0.21 blue: 0.77 alpha: 1.00];
    [[[[self navigationController] navigationController] navigationBar] setTintColor:tintColor];
}

-(void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [UIView animateWithDuration:1.0 animations:^{
        [[[[self navigationController] navigationController] navigationBar] setTintColor:nil];
    }];
}

@end

@implementation Reddit

- (id)readPreferenceValue:(PSSpecifier*)specifier {
	NSString *path = [NSString stringWithFormat:@"/User/Library/Preferences/%@.plist", specifier.properties[@"defaults"]];
	NSMutableDictionary *settings = [NSMutableDictionary dictionary];
	[settings addEntriesFromDictionary:[NSDictionary dictionaryWithContentsOfFile:path]];
	return (settings[specifier.properties[@"key"]]) ?: specifier.properties[@"default"];
}

- (void)setPreferenceValue:(id)value specifier:(PSSpecifier*)specifier {
	NSString *path = [NSString stringWithFormat:@"/User/Library/Preferences/%@.plist", specifier.properties[@"defaults"]];
	NSMutableDictionary *settings = [NSMutableDictionary dictionary];
	[settings addEntriesFromDictionary:[NSDictionary dictionaryWithContentsOfFile:path]];
	[settings setObject:value forKey:specifier.properties[@"key"]];
	[settings writeToFile:path atomically:YES];
	CFStringRef notificationName = (__bridge CFStringRef)specifier.properties[@"PostNotification"];
	if (notificationName) {
		CFNotificationCenterPostNotification(CFNotificationCenterGetDarwinNotifyCenter(), notificationName, NULL, NULL, YES);
	}
}

- (id)specifiers {
	if(_specifiers == nil) {
		_specifiers = [self loadSpecifiersFromPlistName:@"Reddit" target:self];
	}
	return _specifiers;
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    UIColor *tintColor = [UIColor colorWithRed: 0.60 green: 0.21 blue: 0.77 alpha: 1.00];
    [[[[self navigationController] navigationController] navigationBar] setTintColor:tintColor];
}

-(void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [UIView animateWithDuration:1.0 animations:^{
        [[[[self navigationController] navigationController] navigationBar] setTintColor:nil];
    }];
}

@end

@implementation Haptics

- (id)readPreferenceValue:(PSSpecifier*)specifier {
	NSString *path = [NSString stringWithFormat:@"/User/Library/Preferences/%@.plist", specifier.properties[@"defaults"]];
	NSMutableDictionary *settings = [NSMutableDictionary dictionary];
	[settings addEntriesFromDictionary:[NSDictionary dictionaryWithContentsOfFile:path]];
	return (settings[specifier.properties[@"key"]]) ?: specifier.properties[@"default"];
}

- (void)setPreferenceValue:(id)value specifier:(PSSpecifier*)specifier {
	NSString *path = [NSString stringWithFormat:@"/User/Library/Preferences/%@.plist", specifier.properties[@"defaults"]];
	NSMutableDictionary *settings = [NSMutableDictionary dictionary];
	[settings addEntriesFromDictionary:[NSDictionary dictionaryWithContentsOfFile:path]];
	[settings setObject:value forKey:specifier.properties[@"key"]];
	[settings writeToFile:path atomically:YES];
	CFStringRef notificationName = (__bridge CFStringRef)specifier.properties[@"PostNotification"];
	if (notificationName) {
		CFNotificationCenterPostNotification(CFNotificationCenterGetDarwinNotifyCenter(), notificationName, NULL, NULL, YES);
	}
}

- (id)specifiers {
	if(_specifiers == nil) {
		_specifiers = [self loadSpecifiersFromPlistName:@"Haptics" target:self];
	}
	return _specifiers;
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    UIColor *tintColor = [UIColor colorWithRed: 0.60 green: 0.21 blue: 0.77 alpha: 1.00];
    [[[[self navigationController] navigationController] navigationBar] setTintColor:tintColor];
}

-(void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [UIView animateWithDuration:1.0 animations:^{
        [[[[self navigationController] navigationController] navigationBar] setTintColor:nil];
    }];
}

@end

@implementation Creds

- (id)readPreferenceValue:(PSSpecifier*)specifier {
	NSString *path = [NSString stringWithFormat:@"/User/Library/Preferences/%@.plist", specifier.properties[@"defaults"]];
	NSMutableDictionary *settings = [NSMutableDictionary dictionary];
	[settings addEntriesFromDictionary:[NSDictionary dictionaryWithContentsOfFile:path]];
	return (settings[specifier.properties[@"key"]]) ?: specifier.properties[@"default"];
}

- (void)setPreferenceValue:(id)value specifier:(PSSpecifier*)specifier {
	NSString *path = [NSString stringWithFormat:@"/User/Library/Preferences/%@.plist", specifier.properties[@"defaults"]];
	NSMutableDictionary *settings = [NSMutableDictionary dictionary];
	[settings addEntriesFromDictionary:[NSDictionary dictionaryWithContentsOfFile:path]];
	[settings setObject:value forKey:specifier.properties[@"key"]];
	[settings writeToFile:path atomically:YES];
	CFStringRef notificationName = (__bridge CFStringRef)specifier.properties[@"PostNotification"];
	if (notificationName) {
		CFNotificationCenterPostNotification(CFNotificationCenterGetDarwinNotifyCenter(), notificationName, NULL, NULL, YES);
	}
}

- (id)specifiers {
	if(_specifiers == nil) {
		_specifiers = [self loadSpecifiersFromPlistName:@"Creds" target:self];
	}
	return _specifiers;
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    UIColor *tintColor = [UIColor colorWithRed: 0.60 green: 0.21 blue: 0.77 alpha: 1.00];
    [[[[self navigationController] navigationController] navigationBar] setTintColor:tintColor];
}

-(void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [UIView animateWithDuration:1.0 animations:^{
        [[[[self navigationController] navigationController] navigationBar] setTintColor:nil];
    }];
}

@end

@implementation BRUHRootListController

- (id)readPreferenceValue:(PSSpecifier*)specifier {
	NSString *path = [NSString stringWithFormat:@"/User/Library/Preferences/%@.plist", specifier.properties[@"defaults"]];
	NSMutableDictionary *settings = [NSMutableDictionary dictionary];
	[settings addEntriesFromDictionary:[NSDictionary dictionaryWithContentsOfFile:path]];
	return (settings[specifier.properties[@"key"]]) ?: specifier.properties[@"default"];
}

- (void)setPreferenceValue:(id)value specifier:(PSSpecifier*)specifier {
	NSString *path = [NSString stringWithFormat:@"/User/Library/Preferences/%@.plist", specifier.properties[@"defaults"]];
	NSMutableDictionary *settings = [NSMutableDictionary dictionary];
	[settings addEntriesFromDictionary:[NSDictionary dictionaryWithContentsOfFile:path]];
	[settings setObject:value forKey:specifier.properties[@"key"]];
	[settings writeToFile:path atomically:YES];
	CFStringRef notificationName = (__bridge CFStringRef)specifier.properties[@"PostNotification"];
	if (notificationName) {
		CFNotificationCenterPostNotification(CFNotificationCenterGetDarwinNotifyCenter(), notificationName, NULL, NULL, YES);
	}
}

- (void)respring {
	NSURL *returnURL = [NSURL URLWithString:@"prefs:root=Mavalry"]; 
    SBSRelaunchAction *restartAction;
    restartAction = [NSClassFromString(@"SBSRelaunchAction") actionWithReason:@"RestartRenderServer" options:SBSRelaunchActionOptionsFadeToBlackTransition targetURL:returnURL];
    [[NSClassFromString(@"FBSSystemService") sharedService] sendActions:[NSSet setWithObject:restartAction] withResult:nil];
}

- (void)respringPrompt {
	AudioServicesPlaySystemSound(1520);
	UIAlertController *respringAlert = [UIAlertController alertControllerWithTitle:@"Mavalry"
	message:@"Do you want to respring?"
	preferredStyle:UIAlertControllerStyleActionSheet];

	UIAlertAction *confirmAction = [UIAlertAction actionWithTitle:@"Confirm" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * action) {
		[self respring];
	}];

	UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Decline" style:UIAlertActionStyleCancel handler:nil];

	[respringAlert addAction:confirmAction];
	[respringAlert addAction:cancelAction];

	AudioServicesPlaySystemSound(1520);
	[self presentViewController:respringAlert animated:YES completion:nil];
}


- (void)confirmPrompt {
	AudioServicesPlaySystemSound(1520);
	UIAlertController *confirmAlert = [UIAlertController alertControllerWithTitle:@"Mavalry"
	message:@"Mavalry now needs to respring to enact the tweak changes."
	preferredStyle:UIAlertControllerStyleActionSheet];

	UIAlertAction *confirmAction = [UIAlertAction actionWithTitle:@"Confirm" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * action) {
		[self  respring];
	}];

	[confirmAlert addAction:confirmAction];

	AudioServicesPlaySystemSound(1520);
	[self presentViewController:confirmAlert animated:YES completion:nil];
}

- (void)sourceLink {
	AudioServicesPlaySystemSound(1520);
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://github.com/ajaidan/mavalry"] options:@{} completionHandler:nil];
}

- (void)donate {
	AudioServicesPlaySystemSound(1520);
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://paypal.me/ajaidan"] options:@{} completionHandler:nil];
}

- (void)discord {
	AudioServicesPlaySystemSound(1520);
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://discord.gg/w8pvXJd"] options:@{} completionHandler:nil];
}


- (NSArray *)specifiers {
	if (!_specifiers) {
		_specifiers = [self loadSpecifiersFromPlistName:@"Root" target:self];
	}
	return _specifiers;
}

- (void)save{
	[self.view endEditing:YES];
}

-(void)setupWelcomeController {
	welcomeController = [[OBWelcomeController alloc] initWithTitle:@"Mavalry" detailText:@"The ultimate iOS customization tweak." icon:[UIImage imageWithContentsOfFile:@"/Library/PreferenceBundles/mavalryprefs.bundle/WelcomeIcon.png"]];

	[welcomeController addBulletedListItemWithTitle:@"Simple" description:@"Made with simplicity in mind." image:[UIImage systemImageNamed:@"gear"]];
	[welcomeController addBulletedListItemWithTitle:@"Elegant" description:@"Built to fullfill its purpose easily." image:[UIImage systemImageNamed:@"gear"]];
	[welcomeController addBulletedListItemWithTitle:@"Optimized" description:@"Extensively tested for battery drain." image:[UIImage systemImageNamed:@"gear"]];
	[welcomeController.buttonTray addCaptionText:@"Made with ❤️ by ajaidan0."];

	OBBoldTrayButton* continueButton = [OBBoldTrayButton buttonWithType:1];
	[continueButton addTarget:self action:@selector(dismissWelcomeController) forControlEvents:UIControlEventTouchUpInside];
	[continueButton setTitle:@"Continue" forState:UIControlStateNormal];
	[continueButton setClipsToBounds:YES]; // There seems to be an internal issue with the properties, so you may need to force this to YES like so.
	[continueButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal]; // There seems to be an internal issue with the properties, so you may need to force this to be [UIColor whiteColor] like so.
	[continueButton.layer setCornerRadius:15]; // Set your button's corner radius. This can be whatever. If this doesn't work, make sure you make setClipsToBounds to YES.
	[welcomeController.buttonTray addButton:continueButton];

	welcomeController.modalPresentationStyle = UIModalPresentationPageSheet; // The same style stock iOS uses.
	welcomeController.modalInPresentation = YES; //Set this to yes if you don't want the user to dismiss this on a down swipe.
	welcomeController.view.tintColor = [UIColor colorWithRed: 0.60 green: 0.21 blue: 0.77 alpha: 1.00];
	[self presentViewController:welcomeController animated:YES completion:nil]; // Don't forget to present it!
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    UIColor *tintColor = [UIColor colorWithRed: 0.60 green: 0.21 blue: 0.77 alpha: 1.00];
    [[[[self navigationController] navigationController] navigationBar] setTintColor:tintColor];
}

-(void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [UIView animateWithDuration:1.0 animations:^{
        [[[[self navigationController] navigationController] navigationBar] setTintColor:nil];
    }];
} 

-(void)viewDidLoad {
	[super viewDidLoad];
	UIBarButtonItem *respringButton = [[UIBarButtonItem alloc]
                                   initWithTitle:@"Apply"
                                   style:UIBarButtonItemStylePlain
                                   target:self
                                   action:@selector(respringPrompt)];
	self.navigationItem.rightBarButtonItem = respringButton;
	NSString *path = @"/var/mobile/Library/Preferences/com.ajaidan.mavalryprefs.plist";
	NSMutableDictionary *settings = [NSMutableDictionary dictionary];
	[settings addEntriesFromDictionary:[NSDictionary dictionaryWithContentsOfFile:path]];
	NSNumber *didShowOBWelcomeController = [settings valueForKey:@"didShowOBWelcomeController"] ?: @0;
	if([didShowOBWelcomeController isEqual:@0]){
		[self setupWelcomeController];
	}
}

-(void)dismissWelcomeController {
	NSString *path = @"/var/mobile/Library/Preferences/com.ajaidan.mavalryprefs.plist";
	NSMutableDictionary *settings = [NSMutableDictionary dictionary];
	[settings addEntriesFromDictionary:[NSDictionary dictionaryWithContentsOfFile:path]];
	[settings setObject:@1 forKey:@"didShowOBWelcomeController"];
	[settings writeToFile:path atomically:YES];
	AudioServicesPlaySystemSound(1520);
	[welcomeController dismissViewControllerAnimated:YES completion:nil];
	[self confirmPrompt];
}
@end