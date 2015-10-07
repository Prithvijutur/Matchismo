//
//  Card.m
//  Matchismo
//
//  Created by Prithvi Jutur on 10/2/15.
//  Copyright (c) 2015 Prithvi Jutur. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@implementation Card

- (int) match: (NSArray *) othercards
{
    int score = 1;
    for(Card *card in othercards)
    {
        if([self.contents isEqualToString:card.contents])
        {
            score++;
        }
    }
    NSLog(@"score is %d", score);
    return score;
}

@end