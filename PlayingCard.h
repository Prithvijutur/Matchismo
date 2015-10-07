//
//  PlayingCard.h
//  Matchismo
//
//  Created by Prithvi Jutur on 10/2/15.
//  Copyright (c) 2015 Prithvi Jutur. All rights reserved.
//

#import "Card.h"

@interface PlayingCard : Card

@property (strong, nonatomic) NSString  *suit;
@property (nonatomic) NSUInteger rank;

+ (NSArray *) validSuits;
+ (NSUInteger) maxRank;

@end