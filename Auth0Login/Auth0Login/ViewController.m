//
//  ViewController.m
//  Auth0Login
//
//  Created by Weien Wang on 7/4/16.
//  Copyright © 2016 Weien Wang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIWebViewDelegate>
@property (strong, nonatomic) IBOutlet UIView *headerContainer;
@property (strong, nonatomic) IBOutlet UIImageView *headerImage;
@property (strong, nonatomic) IBOutlet UILabel *headerText;
@property (strong, nonatomic) IBOutlet UILabel *usernameLabel;
@property (strong, nonatomic) IBOutlet UILabel *passwordLabel;
@property (strong, nonatomic) IBOutlet UITextField *usernameField;
@property (strong, nonatomic) IBOutlet UITextField *passwordField;
@property (strong, nonatomic) IBOutlet UIButton *sendButton;
@property (strong, nonatomic) IBOutlet UIView *footerLine;
@property (strong, nonatomic) IBOutlet UIButton *footerButton;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    {{ //oauth/ro
        NSString* username = nil;
        NSString* password = nil;
        NSString* post = [NSString stringWithFormat:@"client_id=tSKVxuMzRm4MfmnnXD1E85JONlnEgHW8&username=%@&password=%@&connection=Username-Password-Authentication&grant_type=password&scope=openid", username, password];
        NSData* postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
        NSString* postLength = [@([postData length]) stringValue];
        
        NSMutableURLRequest* request = [NSMutableURLRequest new];
        request.URL = [NSURL URLWithString:@"https://weien.auth0.com/oauth/ro"];
        request.HTTPMethod = @"POST";
        [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
        [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
        request.HTTPBody = postData;
        
        NSURLSession* urlSession = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
        [[urlSession dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
            NSString *requestReply = [[NSString alloc] initWithData:data encoding:NSASCIIStringEncoding];
            NSLog(@"RequestReply: %@, Response: %@, Error: %@", requestReply, response, error);
        }] resume];
    }}
}

- (IBAction)sendButtonTapped:(id)sender {
}

- (IBAction)footerButtonTapped:(id)sender {
}

@end
