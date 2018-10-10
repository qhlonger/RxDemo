//
//  DoubanModel.swift
//  RxDemo
//
//  Created by 江西华源 on 2018/10/10.
//  Copyright © 2018年 江西华源. All rights reserved.
//

import UIKit
import HandyJSON

struct DoubanChannelListModel : HandyJSON {
    var channels: [DoubanChannelItemModel]?
}
struct DoubanChannelItemModel : HandyJSON {
    var channel_id: String?
    var name: String?
    var seq_id: String?
}
