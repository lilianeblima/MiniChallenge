//
//  ViewController.m
//  MiniChallengeAMA
//
//  Created by Liliane Bezerra Lima on 02/03/15.
//  Copyright (c) 2015 Liliane Bezerra Lima. All rights reserved.
//

#import "ViewController.h"
#import "ViewController.h"

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import<CoreLocation/CoreLocation.h>



@interface ViewController ()
{
    int AtualizarPosicao;
}

@property CLLocationManager *locationManager;
@end

@implementation ViewController




- (void)viewDidLoad {
    AtualizarPosicao=0;
    [super viewDidLoad];
    //CLLocationManager *locationManager;
    
    //Alocar memória para o locationManager
    self.locationManager = [[CLLocationManager alloc]init];
    
    //Mostrar ao locationManager o quão exata deve ser a localização encontrada
    [self.locationManager setDesiredAccuracy:kCLLocationAccuracyBest];
    
    //Determinar que a propriedade delegate do locationManager seja a instância da ViewController
    [self.locationManager setDelegate:self];
    
    if([self.locationManager respondsToSelector:@selector(requestAlwaysAuthorization)])
    {
        [self.locationManager requestAlwaysAuthorization];
    }
    
    
    //Dizer ao locationManager para começar a procurar pela localização imediatamente
    [self.locationManager startUpdatingLocation];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    
    
    
    
}



-(void) locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    
    
    NSLog(@"%@", [locations lastObject]);
    //Encontrar as coordenadas de localização atual
    CLLocationCoordinate2D loc = [[locations lastObject] coordinate];
    
    //Determinar região com as coordenadas de localização atual e os limites N/S e L/O no zoom em metros
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(loc, 0, 0);
    
    //    //Mudar a região atual para visualização de forma animada
    if(AtualizarPosicao==0)
    {
        [_Mapa setRegion:region animated:YES ];
        AtualizarPosicao=1;
    }
    //
    //Instanciar o MKPointAnnotation
    //Anonotation *pm = [[Anonotation alloc]init];
    
    
    
    
    //
    //    //Determinar a localização do MKPointAnnotation
    //   pm.coordinate = loc.coordinate;
    //
    //    //Outra forma de Determinar a localização do MKPointAnnotation
    // [pm setCoordinate:loc.coordinate];
    //
    //    //Adicionar pm ao mapa
    
    
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)BAtualizarPosicao:(id)sender {
    AtualizarPosicao = 0;
}
@end
