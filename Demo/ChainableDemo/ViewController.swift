//
//  ViewController.swift
//  ChainableDemo
//
//  Created by weiwei.li on 2019/1/10.
//  Copyright © 2019 dd01.leo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        //接受通知 。无需再deinit中释放
        addNotifiObserver(name: "a") { (notifi) in
            print("ViewController接收到: \(notifi.userInfo.debugDescription)")
        }
        
        addNotifiObserver(name: "b") { (notifi) in
            print("ViewController接收到: \(notifi.userInfo.debugDescription)")
        }
        
        let titles = [
            "1、UITextField",
            "2、UIKit+Chainable(UIView，UILabel， UIButton, UIImageView等.....)",
            "3、TableView",
            "4、TextView",
            "5、ScrollView",
            "6、CollectionView",
            "7、SearchBar",
            "8、Notification",
            ]
        
        
        tableView
            .register(for: UITableViewCell.self, cellReuseIdentifier: "ChainableVCCell")
            .estimatedRowHeight(50)
            .estimatedSectionHeaderHeight(0.1)
            .estimatedSectionFooterHeight(0.1)
            .addNumberOfRowsInSectionBlock { (tab, sec) -> (Int) in
                return titles.count
            }
            .addCellForRowAtIndexPathBlock {[weak self] (tab, indexPath) -> (UITableViewCell) in
                if let cell = self?.tableView.dequeueReusableCell(withIdentifier: "ChainableVCCell", for: indexPath) {
                    cell.textLabel?.text = titles[indexPath.row]
                    return  cell
                }
                
                return UITableViewCell()
            }
            .addDidSelectRowAtIndexPathBlock({[weak self] (tab, indexPath) in
                tab.deselectRow(at: indexPath, animated: true)
                if indexPath.row == 0 {
                    let vc = TextFieldVC()
                    self?.navigationController?.pushViewController(vc, animated: true)
                    
                    //测试通知使用
                    self?.postNotification(name: "a", object: nil, userInfo: ["name": "lisi"])
                    self?.postNotification(name: "b", object: nil, userInfo: ["name": "wangwu"])
                    return
                }
                
                if indexPath.row == 1 {
                    let vc = UIKitChainableVC()
                    self?.navigationController?.pushViewController(vc, animated: true)
                    return
                }
                
                if indexPath.row == 2 {
                    let vc = TableViewVC()
                    self?.navigationController?.pushViewController(vc, animated: true)
                    return
                }
                
                if indexPath.row == 3 {
                    let vc = TextViewVC()
                    self?.navigationController?.pushViewController(vc, animated: true)
                    return
                }
                
                if indexPath.row == 4 {
                    let vc = ScrollViewVC()
                    self?.navigationController?.pushViewController(vc, animated: true)
                    return
                }
                
                if indexPath.row == 5 {
                    let vc = CollectionViewVC()
                    self?.navigationController?.pushViewController(vc, animated: true)
                    return
                }
                
                if indexPath.row == 6 {
                    let vc = SearchBarVC()
                    self?.navigationController?.pushViewController(vc, animated: true)
                    return
                }
                
                if indexPath.row == 7 {
                    let vc = NotificationVC()
                    self?.navigationController?.pushViewController(vc, animated: true)
                    return
                }
            })
            .reload()
    }


}

