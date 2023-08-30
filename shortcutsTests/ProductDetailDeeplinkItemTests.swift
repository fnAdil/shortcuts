//
//  ProductDetailDeeplinkItemTests.swift
//  shortcutsTests
//
//  Created by Adil Özdemir on 30.08.2023.
//

import XCTest
@testable import shortcuts

final class ProductDetailDeeplinkItemTests: XCTestCase {
    var item: ProductDetailDeeplinkItem!

    override func setUp() {
        self.item = ProductDetailDeeplinkItem()
    }
    
    func test_isSatisfied_ProductIdKeyExist_ProductIdValueExist_ShouldReturnTrue() {
        let params = ["productId": "12345"]
        XCTAssertTrue(item.isSatisfied(by: params))
    }
    
    func test_isSatisfied_ProductIdKeyNotExist_ShouldReturnFalse() {
        let params = ["wrongProductIdKey": "12345"]
        XCTAssertFalse(item.isSatisfied(by: params))
    }
    
    func test_isSatisfied_ProductIdKeyExist_BlankProductIdValue_ShouldReturnFalse() {
        let params = ["productId": ""]
        XCTAssertFalse(item.isSatisfied(by: params))
    }
    
    func test_execute_ProductIdKeyExist_ProductIdValueExist_ProductDetailPagePushedProperly() {
        let params = ["productId": "12345"]
        let window = UIWindow()
        window.rootViewController = UINavigationController()
        
        item.execute(window, params: params)
        
        let navigationStackVCs = (window.rootViewController as? UINavigationController)?.viewControllers
        
        XCTAssertEqual(navigationStackVCs?.count, 1)
        XCTAssertTrue(navigationStackVCs?.last is ProductDetailViewController)
        XCTAssertEqual((navigationStackVCs?.last as? ProductDetailViewController)?.productId, "12345")
    }
    
    func test_execute_ProductIdKeyNotExist_ProductDetailPageNotPushed() {
        let params = ["wrongProductIdKey": "12345"]
        let window = UIWindow()
        
        window.rootViewController = UINavigationController()
        
        item.execute(window, params: params)
        
        let navigationStackVCs = (window.rootViewController as? UINavigationController)?.viewControllers
        
        XCTAssertEqual(navigationStackVCs?.count, 0)
    }
    
    func test_execute_ProductIdKeyExist_BlankProductIdValue_ProductDetailPageNotPushed() {
        let params = ["productId": ""]
        let window = UIWindow()
        
        window.rootViewController = UINavigationController()
        
        item.execute(window, params: params)
        
        let navigationStackVCs = (window.rootViewController as? UINavigationController)?.viewControllers
        
        XCTAssertEqual(navigationStackVCs?.count, 0)
    }
}
