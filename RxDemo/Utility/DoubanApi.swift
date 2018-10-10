//
//  DoubanApi.swift
//  RxDemo
//
//  Created by 江西华源 on 2018/10/10.
//  Copyright © 2018年 江西华源. All rights reserved.
//

import UIKit
import Moya
import RxSwift
import RxCocoa
import SnapKit
import HandyJSON


let DoubanProvider = MoyaProvider<DoubanApi>()
enum DoubanApi {
    case channel
    case playlist(channel: String)
}
extension DoubanApi: TargetType {
    var path: String {
        switch self {
        case .channel:
            return "/j/app/radio/channels"
        case .playlist(_):
            return "/j/mine/playlist"
        }
        
    }
    var method: Moya.Method {
        return .get
    }
    var sampleData: Data {
        return "".data(using: String.Encoding.utf8)!
    }
    var task: Task {
        switch self {
        case .playlist(let channel):
            var params: [String: Any] = [:]
            params["channel"] = channel
            params["type"] = "n"
            params["from"] = "mainsite"
            return .requestParameters(parameters: params,
                                      encoding: URLEncoding.default)
        default:
            return .requestPlain
        }
    }
    var headers: [String : String]? {
        return nil
    }
    public var baseURL: URL {
        switch self {
        case .channel:
            return URL(string: "https://www.douban.com")!
        case .playlist(_):
            return URL(string: "https://douban.fm")!
        }
    }
    var validate: Bool{
        return false
    }
    var validationType: ValidationType {
        return .none
    }
}

