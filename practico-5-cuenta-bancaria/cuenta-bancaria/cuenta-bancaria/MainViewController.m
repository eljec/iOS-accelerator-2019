//
//  MainViewController.m
//  cuenta-bancaria
//
//  Created by Gonzalo Alexis Quarin on 02/02/2019.
//  Copyright © 2019 Accelerator-Meli. All rights reserved.
//

#import "MainViewController.h"
#import "CuentaBancariaLib-Swift.h"

@interface MainViewController ()

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UILabel *saldo;
@property (weak, nonatomic) IBOutlet UITextField *importe;
- (IBAction)addImporte:(id)sender;

@end

@implementation MainViewController

static NSString *_identifier = @"id_cell";
    Cuenta *cuenta;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self registerTable];
    [self loadData];
    
}

- (void) loadData {
    cuenta = [CuentaService getCuenta];
    self.saldo.text = [NSString stringWithFormat: @"$ %@", cuenta.saldoString];
}

- (void) registerTable {
    [self.tableView registerClass: [UITableViewCell class] forCellReuseIdentifier:_identifier];
    
    [self.tableView setDelegate:self];
    [self.tableView setDataSource:self];
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:_identifier];
    
    if(cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:_identifier];
    }
    
    Movimiento *movimiento = [cuenta.movimientos objectAtIndex: indexPath.row];
    NSString *importe = movimiento.importeString;
    NSString *fecha = movimiento.fecha;
    
    cell.textLabel.text = [NSString stringWithFormat: @"$ %@ | %@", importe, fecha];
    
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return cuenta.movimientos.count;
}

- (IBAction)load:(id)sender {
    cuenta.saldo = 0.0;
    cuenta.movimientos = [NSArray array];
    
    BOOL resultado = [CuentaService saveWithCuenta:cuenta];
    
    if (resultado){
        [self loadData];
        [self.tableView reloadData];
    }
}

- (IBAction)addImporte:(id)sender {
    NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
    numberFormatter.numberStyle = NSNumberFormatterDecimalStyle;
    
    float _importe = [numberFormatter numberFromString: self.importe.text ].floatValue;
    [cuenta addMovimientoWithImporte: _importe];
    BOOL resultado = [CuentaService saveWithCuenta:cuenta];
    
    if (resultado){
        self.importe.text = @"";
        [self.tableView reloadData];
    }
    
}
@end
