//
//  Utility.swift
//  Base Application
//
//  Created by Ahsanul Kabir on 18/2/21.
//  Copyright © 2021 sakibwrold. All rights reserved.
//
import Foundation

func DebugLog(message: String, function: String = #function, fileName: String = #file) {
    #if DEBUG
    let className = (fileName as NSString).lastPathComponent
    debugPrint("\(className)-> \(function): \(message)")
    #endif
}
