//
//  AppDelegate.m
//  Cocoa Web View
//
//  Created by Nikola Grujic on 29/01/2020.
//

#import "AppDelegate.h"

@implementation AppDelegate

- (void)awakeFromNib
{
    [self homePage:self];
}

#pragma mark Action methods

- (IBAction)homePage:(id)sender
{
    [self loadPage:@"https://www.google.com"];
}

- (IBAction)goToPage:(id)sender
{
    NSString * url = [NSString stringWithFormat:@"%@%@", @"https://", [_adressTextField stringValue]];
    
    if (![self validateUrl:url])
    {
        return;
    }
    
    [self loadPage:url];
}

- (IBAction)goBackPage:(id)sender
{
    if (![_webView canGoBack])
    {
        return;
    }
    
    [_webView goBack];
}

- (IBAction)goForwardPage:(id)sender
{
    if (![_webView canGoForward])
    {
        return;
    }
    
    [_webView goForward];
}

#pragma mark Helper methods

- (BOOL)validateUrl:(NSString*)url;
{
    NSString *urlRegEx = @"(http|https)://((\\w)*|([0-9]*)|([-|_])*)+([\\.|/]((\\w)*|([0-9]*)|([-|_])*))+";
    NSPredicate *urlTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", urlRegEx];
    return [urlTest evaluateWithObject:url];
}

- (void)loadPage:(NSString*)url
{
    [_webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:url]]];
}

@end
