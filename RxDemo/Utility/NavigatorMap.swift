//
//  NavigatorMap.swift
//  RxDemo
//
//  Created by 江西华源 on 2018/10/10.
//  Copyright © 2018年 江西华源. All rights reserved.
//

import URLNavigator

struct NavigatorMap {
    static func initialize(navigator: NavigatorType) {
        navigator.register("<#T##pattern: URLPattern##URLPattern#>", <#T##factory: ViewControllerFactory##ViewControllerFactory##(URLConvertible, [String : Any], Any?) -> UIViewController?#>)
    }
}
