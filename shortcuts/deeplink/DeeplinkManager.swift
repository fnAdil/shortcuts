//
//  DeeplinkManager.swift
//  shortcuts
//
//  Created by Adil Özdemir on 30.08.2023.
//

import Foundation
import UIKit

class DeeplinkManager {
    static let shared: DeeplinkManager = DeeplinkManager()
    
    private init() {}
    
    private let items: [DeeplinkableItem] = [ProductDetailDeeplinkItem(),
                                             OrderDetailDeeplinkItem()]
    
   
    
    func navigate(with params: [String: Any]) {
            guard let window = UIApplication.shared.windows.first else { return }
            items.first(where: { $0.isSatisfied(by: params)})?.execute(window, params: params)
        }
}
