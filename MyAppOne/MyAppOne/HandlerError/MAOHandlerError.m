//
//  MAOHandlerError.m
//  MyAppOne
//
//  Created by Pedro Eduardo Waquim on 10/01/2019.
//  Copyright © 2019 iOS-accelerator. All rights reserved.
//

#import "MAOHandlerError.h"

@implementation MAOHandlerError

/**
 Realiza el manejo de errores.
 
 @param error el error devuelto por el servicio
 @param response la respuesta otogada por el servicio
 @param controller una referencia al controller desde el cuál llama a esta función
 */
-(void) handlerError:(NSError *)error response:(NSURLResponse *) response controller:(UIViewController *) controller
{
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Error"
                                                                   message:[[NSString alloc]initWithFormat:@"%@", [error localizedDescription]]
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * action) {}];
    
    [alert addAction:defaultAction];
    [controller presentViewController:alert animated:YES completion:nil];
}

@end
