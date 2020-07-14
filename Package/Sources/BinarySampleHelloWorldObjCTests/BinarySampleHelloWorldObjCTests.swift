//
//  BinarySampleHelloWorldObjCTests.swift
//  BinarySampleHelloWorldObjCTests
//
//  Created by Rainer Schlönvoigt on 14/07/2020.
//

import XCTest
import BinarySampleHelloWorldObjC

class BinarySampleHelloWorldObjCTests: XCTestCase {

    func testExample() throws {
        EchoObjC().shout("Hi!")
        BinarySampleHelloWorldObjC.EchoObjC().shout("fasdfs")
    }
}
