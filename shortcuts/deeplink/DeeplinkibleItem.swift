//
//  DeeplinkibleItem.swift
//  shortcuts
//
//  Created by Adil Özdemir on 30.08.2023.
//

import Foundation
import UIKit

protocol DeeplinkableItem {
    func isSatisfied(by params: [String: Any]) -> Bool
    func execute(_ window: UIWindow, params: [String: Any])
}
