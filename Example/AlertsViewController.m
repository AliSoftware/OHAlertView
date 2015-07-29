//
//  AlertsViewController.m
//  OHAlertsExample
//
//  Created by Olivier Halligon on 29/07/2015.
//
//

#import "AlertsViewController.h"
#import "OHAlertView.h"

@interface AlertsViewController ()
@property (nonatomic, retain) IBOutlet UILabel *status;
@end

@implementation AlertsViewController


-(IBAction)showAlert1
{
    [OHAlertView showAlertWithTitle:@"Alert Demo"
                            message:@"Welcome to this sample"
                       cancelButton:nil
                       otherButtons:@[@"Thanks!"]
                      buttonHandler:^(OHAlertView* alert, NSInteger buttonIndex)
     {
         self.status.text = @"Welcome !";
     }];
}

/////////////////////////////////////////////////////////////////////////////


-(IBAction)showAlert2
{
    [OHAlertView showAlertWithTitle:@"Your order"
                            message:@"Want some ice cream?"
                       cancelButton:@"No thanks"
                       otherButtons:@[@"Yes please!"]
                      buttonHandler:^(OHAlertView *alert, NSInteger buttonIndex)
     {
         NSLog(@"button tapped: %ld",(long)buttonIndex);
         
         if (buttonIndex == alert.cancelButtonIndex)
         {
             self.status.text = @"Your order has been cancelled";
         }
         else
         {
             NSArray* flavors = [NSArray arrayWithObjects:@"chocolate",@"vanilla",@"strawberry",@"coffee",nil];
             [OHAlertView showAlertWithTitle:@"Flavor"
                                     message:@"Which flavor do you prefer?"
                                cancelButton:@"Cancel"
                                otherButtons:flavors
                               buttonHandler:^(OHAlertView *alert, NSInteger buttonIndex)
              {
                  NSLog(@"button tapped: %ld",(long)buttonIndex);
                  if (buttonIndex == alert.cancelButtonIndex)
                  {
                      self.status.text = @"Your order has been cancelled";
                  }
                  else
                  {
                      NSString* flavor = [flavors objectAtIndex:(buttonIndex-alert.firstOtherButtonIndex)];
                      self.status.text = [NSString stringWithFormat:@"You ordered a %@ ice cream.",flavor];
                  }
              }];
         }
     }];
}

-(IBAction)showAlert3WithTextField
{
    OHAlertView *alert = [[OHAlertView alloc] initWithTitle:@"Email"
                                                    message:@"Enter a valid email xxx@yyy.zzz:"
                                               cancelButton:@"Cancel"
                                               otherButtons:@[@"OK"]
                                              buttonHandler:^(OHAlertView *alert, NSInteger buttonIndex)
                          {
                              NSString* email = [alert textFieldAtIndex:0].text;
                              self.status.text = [NSString stringWithFormat:@"Email entered: %@", email];
                          }];
    
    alert.alertViewStyle = UIAlertViewStylePlainTextInput;
    
    NSRegularExpression* regex = [NSRegularExpression regularExpressionWithPattern:@"[0-9a-z+.-_]+@([0-9a-z]+\\.)+[0-9a-z]+"
                                                                           options:NSRegularExpressionCaseInsensitive
                                                                             error:nil];
    [alert setShouldEnableFirstButton:^BOOL(OHAlertView* alert) {
        NSString *email = [alert textFieldAtIndex:0].text;
        return email && [regex numberOfMatchesInString:email options:0 range:NSMakeRange(0, email.length)] > 0;
    }];
    
    [alert show];
}

@end
