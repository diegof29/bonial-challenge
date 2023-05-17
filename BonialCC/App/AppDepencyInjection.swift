//
//  AppDepencyInjection.swift
//  BonialCC
//
//  Created by Diego Pais on 17.05.23.
//

import Foundation
import Factory

extension Container: AutoRegistering {
    public func autoRegister() {

        // DataSources
        brochureDataSource.register { JSONDataSource() }
        
        // Repositories
        brochureRepository.register {
            DefaultBrochureRepository(dataSource: Container.shared.brochureDataSource()!)
        }
        
        #if DEBUG
        brochureDataSource.onArg(BAppLaunchArgument.uiTestSuccess.rawValue) {
            MockBrochureDataSource(brochures: Brochure.allTemplates)
        }
        
        brochureDataSource.onPreview {
            MockBrochureDataSource(brochures: Brochure.allTemplates)
        }
        #endif
    }
}
