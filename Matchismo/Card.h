//
//  Card.h
//  Matchismo
//
//  Created by Prithvi Jutur on 10/2/15.
//  Copyright (c) 2015 Prithvi Jutur. All rights reserved.
//

#ifndef Matchismo_Card_h
#define Matchismo_Card_h

@interface Card : NSObject

@property (strong, nonatomic) NSString* contents;
@property (nonatomic, getter=isChosen) BOOL chosen;
@property (nonatomic, getter=isMatched) BOOL matched;

- (int) match: (NSArray *) othercards;
@end

#endif
