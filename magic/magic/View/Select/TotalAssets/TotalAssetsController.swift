////
////  TotalAssetsController.swift
////  magic
////
////  Created by SteveLin on 2017/6/23.
////  Copyright © 2017年 SteveLin. All rights reserved.
////
//
//import UIKit
//
//class TotalAssetsController: UIViewController {
//
//    @IBAction func wellcomeDidCliked(_ sender: UIButton) {
//        
//        
//        
//        self.dismiss(animated: true, completion: nil)
//    }
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        if let v = view as? AssetsView {
//            v.tableView.dataSource = self
//            v.tableView.delegate = self
//            v.dampOffsetBlock = { [weak self] offsety in
//                self?.dismiss(animated: true, completion: nil)
//            }
//        }
//    }
//    
//}
//
//
//extension TotalAssetsController: UITableViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 10
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        return UITableViewCell(style: .default, reuseIdentifier: nil)
//    }
//    
//}
//
//
//extension TotalAssetsController: UITableViewDelegate {
//    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        if let v = view as? AssetsView,
//           let scrollView = scrollView as? UITableView{
//            v.tableViewDidScroll(tab: scrollView)
//        }
//    }
//    
//    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
//        if let v = view as? AssetsView,
//            let scrollView = scrollView as? UITableView{
//            v.tableViewDidEndDecelerating(table: scrollView)
//        }
//    }
//}
