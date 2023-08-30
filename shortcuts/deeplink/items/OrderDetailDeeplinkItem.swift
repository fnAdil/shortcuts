//
//  OrderDetailDeeplinkItem.swift
//  shortcuts
//
//  Created by Adil Özdemir on 30.08.2023.
//

import Foundation
import UIKit

struct OrderDetailDeeplinkItem: DeeplinkableItem {
    func isSatisfied(by params: [String : Any]) -> Bool {
        guard let orderId = params["orderId"] as? String, !orderId.isEmpty else { return false }
        return true
    }
    
    func execute(_ window: UIWindow, params: [String : Any]) {
        guard let orderId = params["orderId"] as? String, !orderId.isEmpty else { return }
        let orderDetailViewController = OrderDetailViewController.init()
        orderDetailViewController.orderId = orderId
        let navigationController = window.rootViewController as? UINavigationController
        navigationController?.pushViewController(orderDetailViewController, animated: true)
    }
}
