//
//  BAppLaunchArgument.swift
//  BonialCC
//
//  Created by Diego Pais on 16.05.23.
//

import Foundation

public enum BAppLaunchArgument: String {
    case uiTestSuccess = "-uiTestSuccess"
    case prodEnv = "-prodEnv"
}

extension ProcessInfo {
    var bLaunchArgument: BAppLaunchArgument {
        arguments.compactMap { BAppLaunchArgument(rawValue: $0) }.first ?? .prodEnv
    }
}
