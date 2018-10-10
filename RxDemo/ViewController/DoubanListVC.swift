//
//  DoubanListVC.swift
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
import RxDataSources








class DoubanListVC: UIViewController {
    
    let viewModel = DoubanListViewModel()
    let dataSource = RxTableViewSectionedReloadDataSource<SectionModel<String,DoubanChannelItemModel>>(configureCell: {_, tableView, indexPath, model in
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = model.name
        return cell
    })
    
    
    let dataArray = BehaviorRelay(value: [SectionModel<String, DoubanChannelItemModel>]())
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.edges.equalTo(view)
        }
        return tableView
    }()
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.getCategory { (models) in
            self.dataArray.accept([SectionModel(model: "", items: models)])
        }
        dataArray.asDriver().drive(tableView.rx.items(dataSource: dataSource)).disposed(by: disposeBag)
        
        tableView.rx.itemSelected .subscribe(onNext: { (index) in
            self.tableView.deselectRow(at: index, animated: true)
        }).disposed(by: disposeBag)
        
        tableView.rx.modelSelected(DoubanChannelItemModel.self).subscribe(onNext: { (model) in
            print(model.name)
            
        }, onError: { (error) in
            
        }, onCompleted: {
            
        }).disposed(by: disposeBag)
    }
}


