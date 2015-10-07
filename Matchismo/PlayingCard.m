//
//  PlayingCard.m
//  Matchismo
//
//  Created by Prithvi Jutur on 10/2/15.
//  Copyright (c) 2015 Prithvi Jutur. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PlayingCard.h"

@implementation PlayingCard

-(int) match:(NSArray *)otherCards
{
    int score = 0;
    if (otherCards.count == 1)      // for 2 card matching mode
    {
        PlayingCard *otherCard = [otherCards lastObject];
        if ([otherCard.suit isEqualToString:self.suit])
        {
            score =1;
        }
        else if (otherCard.rank == self.rank)
        {
            score = 4;
        }
    }
    return score;
}

+ (NSArray *) rankStrings
{
    return @[@"?", @"A", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"10", @"J", @"Q", @"K"];
}

+ (NSArray *) validSuits
{
    return @[@"♥️", @"♦️", @"♣️", @"♠️"];
}

+(NSUInteger) maxRank
{
    return [[self rankStrings] count] -1;
}

-(void) setRank:(NSUInteger) rank
{
    if(rank <= [PlayingCard maxRank])
    {
        _rank = rank;
    }
}

-(void)setSuit:(NSString *)suit
{
    if ([[PlayingCard validSuits] containsObject:suit])
    {
        _suit = suit;
    }
}

-(NSString *) contents
{
    NSArray *rankStrings = [PlayingCard rankStrings];
    return [rankStrings[self.rank] stringByAppendingString:self.suit];
}

//-(int)match:(NSArray*) otherCards
//{
//    int score =0;
//    return score;
//}

@end