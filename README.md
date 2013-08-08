## About this classes

This class make it easier to use `UIAlertView` with blocks.

This allows you to provide directly the code to execute (as a block) in return to the tap on a button,
instead of declaring a delegate and implementing the corresponding methods.

This also has the huge advantage of **simplifying the code especially when using multiple `UIAlertViews`** in the same object (as in such case, it is not easy to have a clean code if you share the same delegate)

_Note: You may also be interested in [OHActionSheet](https://github.com/AliSoftware/OHActionSheet)_

## Usage Example

    [OHAlertView showAlertWithTitle:@"Alert Demo"
                            message:@"You like this sample?"
                       cancelButton:@"No"
                           okButton:@"Yes"
                     onButtonTapped:^(OHAlertView* alert, NSInteger buttonIndex)
     {
         NSLog(@"button tapped: %d",buttonIndex);
     
         if (buttonIndex == alert.cancelButtonIndex) {
             NSLog(@"No");
         } else {
             NSLog(@"Yes");
         }
     }];

## Additional Notes

* This class uses blocks, which is a feature introduced in iOS 4.0.
* This class is compatible with both ARC and non-ARC projects.
* This code is under MIT License.

## CocoaPods

This class is referenced in CocoaPods, so you can simply add `pod OHAlertView` to your Podfile to add it to your pods.
