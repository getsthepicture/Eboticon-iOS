//
//  EboticonGif.h
//  Eboticon1.2
//
//  Created by Jarryd McCree on 4/5/14.
//  Copyright (c) 2014 Incling. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EboticonGif : NSObject

@property (strong, nonatomic) NSString *fileName;
@property (strong, nonatomic) NSString *stillName;
@property (strong, nonatomic) NSString *displayName;
@property (strong, nonatomic) NSString *category;
@property (strong, nonatomic) NSString *movFileName;
@property (strong, nonatomic) NSString *displayType;
@property (strong, nonatomic) NSString *emotionCategory;
@property (strong, nonatomic) NSString *purchaseCategory;
@property (strong, nonatomic) NSString *stillUrl;
@property (strong, nonatomic) NSString *gifUrl;
@property (strong, nonatomic) NSString *movUrl;

@property (nonatomic, strong) UIImage *thumbImage;



- (id)initWithAttributes:(NSString *)fileName displayName:(NSString *)displayName stillName:(NSString *)stillName category:(NSString *)category movFileName:(NSString *)movFileName displayType:(NSString *)displayType emotionCategory:(NSString *)emotionCategory;
-(NSString *) getFileName;
-(NSString *) getStillName;
-(NSString *) getDisplayName;
-(NSString *) getCategory;
-(NSString *) getMovFileName;
-(NSString *) getDisplayType;
-(NSString *) getEmotionCategory;
-(NSString *) getPurchaseCategory;

@end
