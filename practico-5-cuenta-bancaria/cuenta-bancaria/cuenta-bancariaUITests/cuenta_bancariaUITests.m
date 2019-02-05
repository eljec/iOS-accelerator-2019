//
//  cuenta_bancariaUITests.m
//  cuenta-bancariaUITests
//
//  Created by Gonzalo Alexis Quarin on 01/02/2019.
//  Copyright © 2019 Accelerator-Meli. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface cuenta_bancariaUITests : XCTestCase

@end

@implementation cuenta_bancariaUITests

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.

    // In UI tests it is usually best to stop immediately when a failure occurs.
    self.continueAfterFailure = NO;

    // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
    [[[XCUIApplication alloc] init] launch];

    // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testExample {
    // Use recording to get started writing UI tests.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

@end
