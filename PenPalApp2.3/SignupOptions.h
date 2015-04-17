//
//  SignupOptions.h
//  PenPalApp2.3
//
//  Created by Computer on 4/13/15.
//  Copyright (c) 2015 Computer. All rights reserved.
//

#import <UIKit/UIKit.h>

extern NSUInteger gV_region;
extern NSString *gV_region_list;
extern NSString *gV_city_list;


@interface SignupOptions : UIViewController<UITableViewDelegate,UITableViewDataSource>{
    
 
}


- (IBAction)cancelButton;

@property (strong, nonatomic) IBOutlet UITableView  *tableView;
@property (strong, nonatomic) IBOutlet UINavigationBar *navTitle;

@property(nonatomic, readonly) NSString *localizedTitle;

@end
