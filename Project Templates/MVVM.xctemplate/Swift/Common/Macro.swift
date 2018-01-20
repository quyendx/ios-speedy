//
//  Macro.swift
//  Ceeme
//
//  Created by ___FULLUSERNAME___ on 6/3/17.
//  Copyright © 2017 MSICT. All rights reserved.
//

import Foundation

func debugLog(_ items: Any...) {
    #if DEBUG
        let date = Date().timeString(ofStyle: DateFormatter.Style.medium)
        debugPrint("\(date): \(#function) : \(items)")
    #endif
}

// #line #file
