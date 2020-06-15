#include "BRUHRootListController.h"
#import <Preferences/PSSpecifier.h>
#import <AudioToolbox/AudioServices.h>

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

-(void)respring {
  AudioServicesPlaySystemSound(1520);
  system("killall -9 backboardd");
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

-(void)dismissViewControllerAnimated

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

-(void)setupWelcomeController { //This is an example method.

    // Create the OBWelcomeView with a title, a desription text, and an icon if you wish. Any of this can be nil if it doesn't apply to your view.
    welcomeController = [[OBWelcomeController alloc] initWithTitle:@"OBWelcomeController Example" detailText:@"This is some text to welcome you. Please take off your shoes before entering." icon:[UIImage systemImageNamed:@"gear"]];

    // Create a bulleted item with a title, description, and icon. Any of the parameters can be set to nil if you wish. You can have as little or as many of these as you wish. The view automatically compensates for adjustments.
    // As written here, systemImageNamed is an iOS 13 feature. It is available in the UIKitCore framework publically. You are welcome to use your own images just as usual. Make sure you set them up with UIImageRenderingModeAlwaysTemplate to allow proper coloring.
    [welcomeController addBulletedListItemWithTitle:@"Point One" description:@"Something important may go here, or it may not even be important. Who cares, amirite?" image:[UIImage systemImageNamed:@"1.circle.fill"]];
    [welcomeController addBulletedListItemWithTitle:@"Point Two" description:@"It's a bird! Wait, no! It's a plane! Haha, just kidding, it's an OBWelcomeController." image:[UIImage systemImageNamed:@"2.circle.fill"]];
    [welcomeController addBulletedListItemWithTitle:@"Point Three" description:@"Do people even read these? Like, people don't read the Terms & Conditions, so why would this be any different?" image:[UIImage systemImageNamed:@"3.circle.fill"]];

    // Create your button here, set some properties, and add it to the controller.
    OBBoldTrayButton* continueButton = [OBBoldTrayButton buttonWithType:1];
    [continueButton addTarget:self action:@selector(dismissWelcomeController) forControlEvents:UIControlEventTouchUpInside];
    [continueButton setTitle:@"Continue" forState:UIControlStateNormal];
    [continueButton setClipsToBounds:YES]; // There seems to be an internal issue with the properties, so you may need to force this to YES like so.
    [continueButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal]; // There seems to be an internal issue with the properties, so you may need to force this to be [UIColor whiteColor] like so.
    [continueButton.layer setCornerRadius:15]; // Set your button's corner radius. This can be whatever. If this doesn't work, make sure you make setClipsToBounds to YES.
    [welcomeController.buttonTray addButton:continueButton];

    //The caption text goes right above the buttons, sort of like as a thank you or disclaimer. This is optional, and can be excluded from your project.
    [welcomeController.buttonTray addCaptionText:@"Thank you for using this tutorial on how to use an OBWelcomeView."];

    welcomeController.modalPresentationStyle = UIModalPresentationPageSheet; // The same style stock iOS uses.
    welcomeController.modalInPresentation = YES; //Set this to yes if you don't want the user to dismiss this on a down swipe.
    welcomeController.view.tintColor = [UIColor systemGreenColor]; // If you want a different tint color. If you don't set this, the controller will take the default color.
    [self presentViewController:welcomeController animated:YES completion:nil]; // Don't forget to present it!
}

-(void)dismissWelcomeController { // Say goodbye to your controller. :(
    [welcomeController dismissViewControllerAnimated:YES completion:nil];
}
