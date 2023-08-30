//
//  ProductDetailDeeplinkItem.swift
//  shortcuts
//
//  Created by Adil Özdemir on 30.08.2023.
//

import Foundation
import UIKit

struct ProductDetailDeeplinkItem: DeeplinkableItem {
    func isSatisfied(by params: [String : Any]) -> Bool {
        guard let productId = params["productId"] as? String, !productId.isEmpty else { return false }
        var _ = productId
        return true
    }
    
    func execute(_ window: UIWindow, params: [String : Any]) {
        guard let productId = params["productId"] as? String, !productId.isEmpty else { return }
        let productDetailViewController = ProductDetailViewController.init()
        productDetailViewController.productId = productId
        let navigationController = window.rootViewController as? UINavigationController
        navigationController?.pushViewController(productDetailViewController, animated: true)
    }
}
