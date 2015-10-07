//
//  CardMatchingGame.m
//  Matchismo
//
//  Created by Prithvi Jutur on 10/6/15.
//  Copyright (c) 2015 Prithvi Jutur. All rights reserved.
//

#import "CardMatchingGame.h"

@interface CardMatchingGame()
@property (nonatomic,readwrite) NSInteger score;
@property (nonatomic, strong) NSMutableArray *cards; // of Card
@end


@implementation CardMatchingGame

- (instancetype) init
{
    _score = 0;
    _mode = 0;
    return nil;
}

- (NSMutableArray * ) cards
{
    if(!_cards) _cards = [[NSMutableArray alloc] init];
    return _cards;
}

- (instancetype) initWithCardCount: (NSUInteger) count usingDeck: (Deck*) deck
{
    self = [super init];
    
    if(self)
    {
        for(int i=0; i<count; i++)
        {
            Card * card = [deck drawRandomCard];
            if(card)
            {
                [self.cards addObject:card];
            }
            else
            {
                self = nil;
                break;
            }
            
        }
    }
    return self;
}

-(BOOL) resetCardGame
{
    self.score = 0;
    for(Card *card in self.cards)
    {
        card.matched = card.chosen = false;
    }
    return true;
}

static const int MISMATCH_PENALTY = 2;
static const int MATCH_BONUS = 4;
static const int COST_TO_CHOOSE = 1;

- (void) chooseCardAtIndex:(NSUInteger) index
{
    Card *card = [self cardAtIndex:index];
    NSMutableArray *chosenCards = [[NSMutableArray alloc] init];
    
    if(!card.isMatched)
    {
        if(card.isChosen)
        {
            card.chosen = false;
        }
        else
        {
            for(Card *otherCard in self.cards)
            {
                if(otherCard.isChosen && !otherCard.isMatched)
                {
                    [chosenCards addObject:otherCard];
                    if(chosenCards.count > (_mode)) // 2 based index
                    {
                        int matchScore = [card match:chosenCards];
                        if(matchScore)
                        {
                            self.score += matchScore * MATCH_BONUS;
                            for(Card *choseCard in chosenCards)
                            {
                                choseCard.chosen = true;
                                choseCard.matched = true;
                            }
                            card.matched = true;
                        }
                        else
                        {
                            self.score -= MISMATCH_PENALTY;
                            for(Card *choseCard in chosenCards)
                            {
                                choseCard.chosen = false;
                            }
                        }
                        break;
                    }
                }
            }
            self.score -= COST_TO_CHOOSE;
            card.chosen = true;
        }
    }
}

- (Card *) cardAtIndex:(NSUInteger)index
{
    return (index < [self.cards count])? self.cards[index] : nil;
}

@end
