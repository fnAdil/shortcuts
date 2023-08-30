//
//  OrderDetailDeeplinkItemTests.swift
//  shortcutsTests
//
//  Created by Adil Özdemir on 30.08.2023.
//

import XCTest
@testable import shortcuts

final class OrderDetailDeeplinkItemTests: XCTestCase {
    
    var item: OrderDetailDeeplinkItem!
    
    override func setUp() {
        self.item = OrderDetailDeeplinkItem()
    }
    
    func test_isSatisfied_OrderIdKeyExist_OrderIdValueExist_ShouldReturnTrue() {
        let params = ["orderId": "12345"]
        XCTAssertTrue(item.isSatisfied(by: params))
    }
    
    func test_isSatisfied_OrderIdKeyNotExist_ShouldReturnFalse() {
        let params = ["wrongOrderIdKey": "12345"]
        XCTAssertFalse(item.isSatisfied(by: params))
    }
    
    func test_isSatisfied_OrderIdKeyExist_BlankOrderIdValue_ShouldReturnFalse() {
        let params = ["orderId": ""]
        XCTAssertFalse(item.isSatisfied(by: params))
    }
    
    func test_execute_OrderIdKeyExist_OrderIdValueExist_OrderDetailPagePushedProperly() {
        let params = ["orderId": "12345"]
        let window = UIWindow()
        window.rootViewController = UINavigationController()
        
        item.execute(window, params: params)
        
        let navigationStackVCs = (window.rootViewController as? UINavigationController)?.viewControllers
        
        XCTAssertEqual(navigationStackVCs?.count, 1)
        XCTAssertTrue(navigationStackVCs?.last is OrderDetailViewController)
        XCTAssertEqual((navigationStackVCs?.last as? OrderDetailViewController)?.orderId, "12345")
    }
    
    func test_execute_OrderIdKeyNotExist_OrderDetailPageNotPushed() {
        let params = ["wrongOrderIdKey": "12345"]
        let window = UIWindow()
        window.rootViewController = UINavigationController()
        
        item.execute(window, params: params)
        
        let navigationStackVCs = (window.rootViewController as? UINavigationController)?.viewControllers
        
        XCTAssertEqual(navigationStackVCs?.count, 0)
    }
    
    func test_execute_BlankOrderIdValue_OrderDetailPageNotPushed() {
        let params = ["orderId": ""]
        let window = UIWindow()
        window.rootViewController = UINavigationController()
        
        item.execute(window, params: params)
        
        let navigationStackVCs = (window.rootViewController as? UINavigationController)?.viewControllers
        
        XCTAssertEqual(navigationStackVCs?.count, 0)
    }
}
