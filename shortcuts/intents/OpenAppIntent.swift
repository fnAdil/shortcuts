//
//  OpenAppIntent.swift
//  shortcuts
//
//  Created by Adil Özdemir on 29.08.2023.
//

import Foundation
import AppIntents

struct OpenAppIntent: AppIntent {
    
    static var title: LocalizedStringResource = "Open App"
    
    static var description =
        IntentDescription("Opens The App")
    
    static var openAppWhenRun: Bool = true
    
    func perform() async throws -> some IntentResult & ReturnsValue {
       
            
        return .result(value: "Success!")
    }
        
}
