//
//  Annotation.h
//  MiniChallengeAMA
//
//  Created by Liliane Bezerra Lima on 02/03/15.
//  Copyright (c) 2015 Liliane Bezerra Lima. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import<CoreLocation/CoreLocation.h>

@interface Annotation : NSObject<MKAnnotation>

//Novo construtor
-(id) initWithCoordinate:(CLLocationCoordinate2D)c title:(NSString *)t;

//Propriedade obrigatória do MKAnnotation
@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;

//Propriedade opcional de MKAnnotation
@property (nonatomic, copy) NSString *title;


@end
