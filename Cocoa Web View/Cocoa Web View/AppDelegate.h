//
//  AppDelegate.h
//  Cocoa Web View
//
//  Created by Nikola Grujic on 29/01/2020.
//

#import <Cocoa/Cocoa.h>
#import <WebKit/WebKit.h>

@interface AppDelegate : NSObject <NSApplicationDelegate, WKUIDelegate, WKNavigationDelegate>

@property (weak) IBOutlet NSWindow *window;
@property (weak) IBOutlet WKWebView *webView;
@property (weak) IBOutlet NSTextField *adressTextField;

- (IBAction)homePage:(id)sender;
- (IBAction)goToPage:(id)sender;
- (IBAction)goBackPage:(id)sender;
- (IBAction)goForwardPage:(id)sender;

- (BOOL)validateUrl:(NSString*)url;
- (void)loadPage:(NSString*)url;

@end

