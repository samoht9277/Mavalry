#include "BRUHRootListController.h"
#import <Preferences/PSSpecifier.h>
#import <AudioToolbox/AudioServices.h>
#import "NSTask.h"

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

@implementation SpringBoard

- (id)specifiers {
    if(_specifiers == nil) {
        _specifiers = [self loadSpecifiersFromPlistName:@"SpringBoard" target:self];
    }
    return _specifiers;
}

@end

@implementation Lockscreen

- (id)specifiers {
    if(_specifiers == nil) {
        _specifiers = [self loadSpecifiersFromPlistName:@"Lockscreen" target:self];
    }
    return _specifiers;
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
    AudioServicesPlaySystemSound(1520);
    NSTask *t = [[NSTask alloc] init];
    [t setLaunchPath:@"/usr/bin/killall"];
    [t setArguments:[NSArray arrayWithObjects:@"backboardd", nil]];
    [t launch];
}

- (void)sourceLink {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://github.com/ajaidan/mavalry"] options:@{} completionHandler:nil];
    AudioServicesPlaySystemSound(1520);
}

- (NSArray *)specifiers {
	if (!_specifiers) {
		_specifiers = [self loadSpecifiersFromPlistName:@"Root" target:self];
	}

	return _specifiers;
}

-(void)dismissViewControllerAnimated {

}
-(void)setupWelcomeController { //This is an example method.

    // Create the OBWelcomeView with a title, a desription text, and an icon if you wish. Any of this can be nil if it doesn't apply to your view.
    welcomeController = [[OBWelcomeController alloc] initWithTitle:@"Mavalry" detailText:@"The ultimate SpringBoard customization tweak." icon:[UIImage imageWithContentsOfFile:@"/Library/PreferenceBundles/mavalryprefs.bundle/icon.png"]];

    // Create a bulleted item with a title, description, and icon. Any of the parameters can be set to nil if you wish. You can have as little or as many of these as you wish. The view automatically compensates for adjustments.
    // As written here, systemImageNamed is an iOS 13 feature. It is available in the UIKitCore framework publically. You are welcome to use your own images just as usual. Make sure you set them up with UIImageRenderingModeAlwaysTemplate to allow proper coloring.
    [welcomeController addBulletedListItemWithTitle:@"Simple" description:@"Made with simplicity in mind." image:[UIImage systemImageNamed:@"gear"]];
    [welcomeController addBulletedListItemWithTitle:@"Elegant" description:@"Built to fullfill its purpose easily." image:[UIImage systemImageNamed:@"gear"]];
    [welcomeController addBulletedListItemWithTitle:@"Optimized" description:@"Extensively tested for battery drain." image:[UIImage systemImageNamed:@"gear"]];
    [welcomeController.buttonTray addCaptionText:@"made with ❤️ by Jaidan A and samoht"];


    // Create your button here, set some properties, and add it to the controller.
    OBBoldTrayButton* continueButton = [OBBoldTrayButton buttonWithType:1];
    [continueButton addTarget:self action:@selector(dismissWelcomeController) forControlEvents:UIControlEventTouchUpInside];
    [continueButton setTitle:@"Continue" forState:UIControlStateNormal];
    [continueButton setClipsToBounds:YES]; // There seems to be an internal issue with the properties, so you may need to force this to YES like so.
    [continueButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal]; // There seems to be an internal issue with the properties, so you may need to force this to be [UIColor whiteColor] like so.
    [continueButton.layer setCornerRadius:15]; // Set your button's corner radius. This can be whatever. If this doesn't work, make sure you make setClipsToBounds to YES.
    [welcomeController.buttonTray addButton:continueButton];

    welcomeController.modalPresentationStyle = UIModalPresentationPageSheet; // The same style stock iOS uses.
    welcomeController.modalInPresentation = YES; //Set this to yes if you don't want the user to dismiss this on a down swipe.
    [self presentViewController:welcomeController animated:YES completion:nil]; // Don't forget to present it!
}

-(void)viewDidLoad {
  [super viewDidLoad];
  [self setupWelcomeController];
}

-(void)dismissWelcomeController { // Say goodbye to your controller. :(
    [welcomeController dismissViewControllerAnimated:YES completion:nil];
}
@end
