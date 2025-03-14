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
- (IBAction)pressInverse:(id)sender;
- (IBAction)pressSqrt:(id)sender;
- (IBAction)pressSin:(id)sender;
- (IBAction)pressCos:(id)sender;
- (IBAction)pressMemoryStore:(id)sender;
- (IBAction)pressMemoryRecall:(id)sender;
- (IBAction)pressMemoryAdd:(id)sender;
- (IBAction)clear:(id)sender;


@end

