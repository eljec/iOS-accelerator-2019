//
//  cuenta_bancaria_libTests.swift
//  cuenta-bancaria-libTests
//
//  Created by Gonzalo Alexis Quarin on 31/01/2019.
//  Copyright © 2019 Accelerator-Meli. All rights reserved.
//

import XCTest
@testable import cuenta_bancaria_lib

class cuenta_bancaria_libTests: XCTestCase {
    
    override func setUp() {
        CuentaService.removeKeys()
    }
    
    //MARK: Test 1
    //Obtener cuenta en 0
    //Saldo 0
    //Sin movimientos
    func test_ObtenerCuentaSinSaldo() {
        let cuenta = CuentaService.getCuenta()
        
        XCTAssert(0 == cuenta.saldo)
        XCTAssert(0 == cuenta.movimientos.count)
    }
    
    //MARK: Test 2
    //Agregar 1 movimiento de 150
    //Saldo 150
    //Cantidad de movimientos 1
    func test_AgregarMovimientoEnCuenta() {
        let cuenta = CuentaService.getCuenta()
        cuenta.addMovimiento(importe: 150)
        
        XCTAssert(150 == cuenta.saldo)
        XCTAssert(1 == cuenta.movimientos.count)
    }
    
    //MARK: Test 3
    //Agregar 1 movimiento de 150
    //Agregar 1 movimiento de -150
    //Saldo 0
    //Cantidad de movimientos 2
    func test_AgregarMovimientosSaldoEnCero() {
        let cuenta = CuentaService.getCuenta()
        cuenta.addMovimiento(importe: 150)
        cuenta.addMovimiento(importe: -150)
        
        XCTAssert(0 == cuenta.saldo)
        XCTAssert(2 == cuenta.movimientos.count)
    }
    
    //MARK: Test 4
    //Agregar 1 movimiento de -200
    //Saldo -200
    //Cantidad de movimientos 1
    func test_AgregarMovimientosSaldoNegativo() {
        let cuenta = CuentaService.getCuenta()
        
        cuenta.addMovimiento(importe: -200)
        
        XCTAssert(-200 == cuenta.saldo)
        XCTAssert(1 == cuenta.movimientos.count)
    }
    
   

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
