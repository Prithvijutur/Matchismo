//
//  CardMatchingGame.h
//  Matchismo
//
//  Created by Prithvi Jutur on 10/6/15.
//  Copyright (c) 2015 Prithvi Jutur. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "deck.h"
#import "Card.h"

@interface CardMatchingGame : NSObject

- (instancetype) initWithCardCount: (NSUInteger) count usingDeck: (Deck*) deck; // Initializer
- (void) chooseCardAtIndex:(NSUInteger) index;
- (Card *) cardAtIndex:(NSUInteger)index;
- (BOOL) resetCardGame;

@property (nonatomic, readonly) NSInteger score;

@end
