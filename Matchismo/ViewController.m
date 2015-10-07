//
//  ViewController.m
//  Matchismo
//
//  Created by Prithvi Jutur on 10/2/15.
//  Copyright (c) 2015 Prithvi Jutur. All rights reserved.
//

#import "ViewController.h"
#import "PlayingCardDeck.h"
#import "deck.h"
#import "CardMatchingGame.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *ScoreLabel;
@property (weak, nonatomic) IBOutlet UIButton *resetScoreButton;
@property (nonatomic, strong) Deck * deck;
@property (nonatomic, strong) CardMatchingGame *game;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (weak, nonatomic) IBOutlet UISegmentedControl *SegmentedControl;
@end

@implementation ViewController

-(void)viewDidLoad
{
    // [self updateUI];
    // self.rewindSlider.maximumValue=0;
    //[self newDeal:nil];
}

- (CardMatchingGame*) game
{
    if(!_game) _game = [[CardMatchingGame alloc] initWithCardCount:[self.cardButtons count] usingDeck:[self createDeck]];
    return _game;
}

-(Deck *) createDeck
{
    return [[PlayingCardDeck alloc] init];
}

- (IBAction)touchResetScoreButton:(id)sender {
    [self.game resetCardGame];
    _game = nil;
    [self updateUI];
}

- (IBAction)SegmentedControlValueChanged:(id)sender {
    self.game.mode = [self.SegmentedControl selectedSegmentIndex];
}

- (IBAction)touchCardButton:(UIButton *)sender
{
    NSUInteger cardIndex = [self.cardButtons indexOfObject:sender];
    [self.game chooseCardAtIndex:cardIndex];
    [self updateUI];
}

-(void)updateUI
{
    for(UIButton *cardButton in self.cardButtons)
    {
        NSUInteger cardIndex = [self.cardButtons indexOfObject:cardButton];
        Card *card = [self.game cardAtIndex:cardIndex];
        [cardButton setTitle:[self titleForCard:card] forState:UIControlStateNormal];
        [cardButton setBackgroundImage:[self backgroundImageForCard:card] forState:UIControlStateNormal];
        cardButton.enabled = !card.isMatched;
    }
    self.ScoreLabel.text = [NSString stringWithFormat:@"Score: %ld", (long)self.game.score];
}

-(NSString *) titleForCard:(Card*) card
{
    return (card.isChosen? card.contents : @"");
}

-(UIImage *) backgroundImageForCard: (Card*) card
{
    return [UIImage imageNamed:(card.isChosen ? @"Earthrise_Revisited_2013": @"Earthrise_Revisited_2013")];
}

@end
