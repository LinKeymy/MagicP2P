//
//  ProfileViewController.swift
//  magic
//
//  Created by SteveLin on 2017/4/19.
//  Copyright © 2017年 SteveLin. All rights reserved.
//

import UIKit

class ProfileViewController: BaseViewController {
    
    lazy var tableView:UITableView = {
        let table = UITableView(frame: UIScreen.main.bounds, style: .grouped)
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    // cell的数据列表
    lazy var data:[[Discover]] = {
        guard let path = Bundle.main.path(forResource: "Profile", ofType: "plist"),
            let array = NSArray(contentsOfFile: path) else {
                return [[]]
        }
        var outArray = [[Discover]]()
        for sectionArray in (array as Array) {
            if let sectionArray = sectionArray as? [[String:String]] {
                var innerArray = [Discover]()
                for dict in sectionArray {
                    if let discover = Discover.yy_model(with: dict) {
                        innerArray.append(discover)
                    }
                }
                if innerArray.count > 0 {
                    outArray.append(innerArray)
                }
            }
        }
        return outArray
    }()
}

extension ProfileViewController {
    
    func setupUI() {
        setupTableView()
    }
    
    fileprivate func setupTableView() {
        automaticallyAdjustsScrollViewInsets = false
        let insetTop = navigationBar.bounds.height
        let insetBottom = CGFloat(49)
        tableView.contentInset = UIEdgeInsets(top:insetTop , left: 0, bottom:insetBottom , right: 0);
        tableView.scrollIndicatorInsets = tableView.contentInset
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableFooterView = UIView()
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 0)
    }
    
}

extension ProfileViewController:UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let style:UITableViewCellStyle =  indexPath.section  == 0 && indexPath.row == 0 ? .subtitle : .value1
        let cell = UITableViewCell(style: style, reuseIdentifier: nil)
        cell.textLabel?.text = data[indexPath.section][indexPath.row].title
        if indexPath.section == 0  && indexPath.row == 0 {
            cell.detailTextLabel?.text = "13168705790"
        }
        cell.accessoryType = .disclosureIndicator
        if let imageName = data[indexPath.section][indexPath.row].imageName {
            cell.imageView?.image = UIImage(named:imageName )
        }
        if let detail = data[indexPath.section][indexPath.row].detail {
            cell.detailTextLabel?.text = detail
            cell.detailTextLabel?.font = UIFont.systemFont(ofSize: 15)
        }
        return cell
    }
}

extension ProfileViewController:UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return indexPath.section == 0 && indexPath.row == 0 ? 90 : 44
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 15
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 5
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.section == 0 && indexPath.row == 0 {
            if let vc =  UIStoryboard.init(name: "PersonalInfo", bundle: nil).instantiateInitialViewController() {
                self.navigationController?.pushViewController(vc, animated: true)
                tableView.deselectRow(at: indexPath, animated: false)
                return
            }
        }
        
        if let uri = data[indexPath.section][indexPath.row].uri {
            if uri == "touzhijia://profile/settings" {
                if let vc =  UIStoryboard.init(name: "Settings", bundle: nil).instantiateInitialViewController() {
                    self.navigationController?.pushViewController(vc, animated: true)
                }
            } else {
                Router.open(uri)
            }
            
        } else {
            if let vc =  UIStoryboard.init(name: "Balance", bundle: nil).instantiateInitialViewController() {
                self.navigationController?.pushViewController(vc, animated: true)
            }
        }
        tableView.deselectRow(at: indexPath, animated: false)
    }
}
