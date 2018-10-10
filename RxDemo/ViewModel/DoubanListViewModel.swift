//
//  DoubanViewModel.swift
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

class DoubanListViewModel {
    let doubanProvider = MoyaProvider<DoubanApi>()
    var disposeBag = DisposeBag()
    
    func getCategory(complete:@escaping (_ models : [DoubanChannelItemModel]) -> Void ) {
        DoubanProvider.rx
            .request(.channel)
            .asObservable()
            .mapModel(DoubanChannelListModel.self)
            .subscribe(onNext: { (model) in
                complete(model.channels!)
            }, onError: { (error) in
                
            }, onCompleted: {
                
            })
            .disposed(by: disposeBag)
    }
}

