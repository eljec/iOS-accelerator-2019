//
//  PracticoSwiftUITests.swift
//  PracticoSwiftUITests
//
//  Created by VICTOR ABEL CABEZA on 25/01/2019.
//  Copyright © 2019 Mercadolibre. All rights reserved.
//

import XCTest

class PracticoSwiftUITests: XCTestCase {

    var app:XCUIApplication?
    override func setUp() {
        continueAfterFailure = false
        XCUIApplication().launch()
        self.app = XCUIApplication()
    }

    override func tearDown() {
        self.app = nil
    }

    
    func testSearchSomething() {
        guard let app = self.app else {
            XCTAssertTrue(false, "No se pudo inicializar la app")
            return
        }
        let textField = app.otherElements.containing(.navigationBar, identifier:"PracticoSwift.PSSongSearchView").children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .textField).element
        
        textField.tap()
        textField.typeText("soda stereo")
        
        app.buttons["Buscar"].tap()
    
        
        let tablesQuery = app.tables
        let count = tablesQuery.cells.count
        XCTAssert(count > 0)
    }
    
    
    func testSearchSomethingAscFalse(){
        guard let app = self.app else {
            XCTAssertTrue(false, "No se pudo inicializar la app")
            return
        }
        let textField = app.otherElements.containing(.navigationBar, identifier:"PracticoSwift.PSSongSearchView").children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .textField).element
        
        textField.tap()
        textField.typeText("soda stereo")
        
        let ascSwitch = app.switches.element(boundBy: 0)
        
        ascSwitch.tap()
        
        app.buttons["Buscar"].tap()
        
        
        let tablesQuery = app.tables
        let count = tablesQuery.cells.count
        XCTAssert(count > 0)
    }
    
    func testSearchSomethingOrderByReleaseDate(){
        guard let app = self.app else {
            XCTAssertTrue(false, "No se pudo inicializar la app")
            return
        }
        let textField = app.otherElements.containing(.navigationBar, identifier:"PracticoSwift.PSSongSearchView").children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .textField).element
        
        textField.tap()
        textField.typeText("soda stereo")
        
        app/*@START_MENU_TOKEN@*/.buttons["Fecha Lanzam"]/*[[".segmentedControls.buttons[\"Fecha Lanzam\"]",".buttons[\"Fecha Lanzam\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        app.buttons["Buscar"].tap()
        
        
        let tablesQuery = app.tables
        let count = tablesQuery.cells.count
        XCTAssert(count > 0)
        
    }
    func testSearchSomethingOrderByTrackId(){
        guard let app = self.app else {
            XCTAssertTrue(false, "No se pudo inicializar la app")
            return
        }
        let textField = app.otherElements.containing(.navigationBar, identifier:"PracticoSwift.PSSongSearchView").children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .textField).element
        
        textField.tap()
        textField.typeText("soda stereo")

        app/*@START_MENU_TOKEN@*/.buttons["Track Id"]/*[[".segmentedControls.buttons[\"Track Id\"]",".buttons[\"Track Id\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        app.buttons["Buscar"].tap()
        
        
        let tablesQuery = app.tables
        let count = tablesQuery.cells.count
        XCTAssert(count > 0)
    }
}
