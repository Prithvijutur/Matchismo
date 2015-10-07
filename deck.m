//
//  deck.m
//  Matchismo
//
//  Created by Prithvi Jutur on 10/5/15.
//  Copyright (c) 2015 Prithvi Jutur. All rights reserved.
//

#import "deck.h"

@interface Deck()
@property (nonatomic, strong) NSMutableArray *cards;
@end

@implementation Deck
-(NSMutableArray *) cards
{
    if(!_cards) {
        _cards = [[NSMutableArray alloc] init];
    }
    return _cards;
}

-(void) addCard:(Card *)card atTop:(BOOL)atTop
{
    if(atTop) {
        [self.cards insertObject:card atIndex:0];
    }
    else {
        [self.cards addObject:card];
    }
}

-(void) addCard:(Card*) card
{
    [self addCard:card atTop:NO];
}

-(Card*) drawRandomCard
{
    Card* card = nil;
    if([self.cards count]) {
        NSUInteger randomNumber = arc4random() % [self.cards count];
        card = self.cards[randomNumber];
        [self.cards removeObjectAtIndex:randomNumber];
    }
    return card;
}
@end
