//
//  ViewController.m
//  MiniChallengeAMA
//
//  Created by Liliane Bezerra Lima on 02/03/15.
//  Copyright (c) 2015 Liliane Bezerra Lima. All rights reserved.
//

#import "ViewController.h"

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import<CoreLocation/CoreLocation.h>
#import "Annotation.h"



@interface ViewController ()
{
    int AtualizarPosicao;
    CLPlacemark *thePlacemark;
    MKRoute *routeDetails;
    NSString *endereco, *latDest1,*lngDest1;
    double latitude,longitude;

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
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(loc, 250, 250);
    
    //    //Mudar a região atual para visualização de forma animada
    if(AtualizarPosicao==0)
    {
       // [_Mapa removeAnnotations:[_Mapa annotations]];
        [_Mapa setRegion:region animated:YES ];
        
        MKPointAnnotation *pm = [[MKPointAnnotation alloc]init];
        [pm setCoordinate:CLLocationCoordinate2DMake(loc.latitude, loc.longitude)];
        pm.title = [NSString stringWithFormat:@"Posicao Atual"];
        [_Mapa addAnnotation:pm];
        AtualizarPosicao=1;
    }

   // [_Mapa setRegion:region animated:YES ];
    
    


    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)BAtualizarPosicao:(id)sender {
    AtualizarPosicao = 0;

}
- (IBAction)BPesquisar:(id)sender {
    
    
    
   
    endereco = @"259 Rua FREDERICO ALVARENGA, Sao Paulo, Brasil ";
    
    
    
    CLGeocoder *geocoder = [[CLGeocoder alloc] init];
    [geocoder geocodeAddressString:endereco completionHandler:^(NSArray* placemarks, NSError* error){
        for (CLPlacemark* aPlacemark in placemarks)
        {
            // Process the placemark.
            latDest1 = [NSString stringWithFormat:@"%.4f",aPlacemark.location.coordinate.latitude];
            lngDest1 = [NSString stringWithFormat:@"%.4f",aPlacemark.location.coordinate.longitude];
            NSLog(@"lat: %@, lng: %@", latDest1, lngDest1);
            //            lblDestinationLat.text = latDest1;
            //            lblDestinationLng.text = lngDest1;
        }
    }];
    
    latitude = [latDest1 doubleValue];
    longitude = [lngDest1 doubleValue];
    
    MKPointAnnotation *pm = [[MKPointAnnotation alloc]init];
    [pm setCoordinate:CLLocationCoordinate2DMake(latitude, longitude)];
    pm.title = [NSString stringWithFormat:@"AMA DA SÉ"];
    [_Mapa addAnnotation:pm];
 
}









@end
