//
//  ViewController.h
//  MiniChallengeAMA
//
//  Created by Liliane Bezerra Lima on 02/03/15.
//  Copyright (c) 2015 Liliane Bezerra Lima. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet MKMapView *Mapa;



- (IBAction)BAtualizarPosicao:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *TextoEndereco;
- (IBAction)BPesquisar:(id)sender;

@end

