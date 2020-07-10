//
//  AccessingModules.swift
//  SampleApp
//
//  Created by Rainer Schlönvoigt on 10/07/2020.
//

import Foundation
import SourceSampleHelloWorldSwift
import SourceSampleHelloWorldObjC
import BinarySampleHelloWorldSwift
import BinarySampleHelloWorldObjC

class ModuleExcercise {

    func something() {
        _ = SourceSampleHelloWorldSwift.EchoSwift().shout("Hi from Swift Source!")
        SourceSampleHelloWorldObjC.EchoObjC().shout("Hi from ObjC Source!")
        _ = BinarySampleHelloWorldSwift.EchoSwift().shout("Hi from Swift Binary!")
        BinarySampleHelloWorldObjC.EchoObjC().shout("Hi from ObjC Binary!")
    }
}
