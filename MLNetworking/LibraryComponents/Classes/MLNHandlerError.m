//
//  MLNHandlerError.m
//  Pods
//
//  Created by Pedro Eduardo Waquim on 30/01/2019.
//

#import "MLNHandlerError.h"
#import "ProgressHUD.h"

@implementation MLNHandlerError
/**
 Realiza el manejo de errores.
 
 @param error el error devuelto por el servicio
 @param controller una referencia al controller desde el cuál llama a esta función
 */
-(void) handlerError:(NSError *)error controller:(UIViewController *) controller
{
    [ProgressHUD showError:@"Something went wrong."];
    
//    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Error"
//                                                                   message:[[NSString alloc]initWithFormat:@"%@", [error localizedDescription]]
//                                                            preferredStyle:UIAlertControllerStyleAlert];
//
//    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
//                                                          handler:^(UIAlertAction * action) {}];
//
//    [alert addAction:defaultAction];
//    [controller presentViewController:alert animated:YES completion:nil];
}

@end
