//
//  Annotation.m
//  MiniChallengeAMA
//
//  Created by Liliane Bezerra Lima on 02/03/15.
//  Copyright (c) 2015 Liliane Bezerra Lima. All rights reserved.
//

#import "Annotation.h"


#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import<CoreLocation/CoreLocation.h>

@implementation Annotation

@synthesize coordinate, title;

-(id)initWithCoordinate:(CLLocationCoordinate2D)c title:(NSString *)t
{
    self = [super init];
    if(self)
    {
        coordinate = c;
        [self setTitle:t];
    }
    return self;
}

//Você pode sobrescrever o init para chamar o novo construtor acima designado
-(id) init
{
    return [self initWithCoordinate:CLLocationCoordinate2DMake(43.07, -89.32) title:@"Hometown"];
}
@end
