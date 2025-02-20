//
//  AppDelegate.h
//  AppCalculadora2
//
//  Created by Miriam Sanchez on 11/02/25.
//

#import <Cocoa/Cocoa.h>

@interface AppDelegate : NSObject <NSApplicationDelegate>
@property (weak) IBOutlet NSTextField *display;

- (IBAction)pressEqual:(id)sender;
- (IBAction)pressOp:(id)sender;
- (IBAction)pressDigit:(id)sender;


@end

