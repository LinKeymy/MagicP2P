////
////  AssetsView.swift
////  magic
////
////  Created by SteveLin on 2017/6/25.
////  Copyright © 2017年 SteveLin. All rights reserved.
////
//
//import UIKit
//
//
////extension UITableView: UIGestureRecognizerDelegate {
////    
////    public func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
////        return true
////    }
////
////}
//
//let gestureOffset: CGFloat = 200
//
//let dismissOffset: CGFloat = 80
//
//class AssetsView: UIView {
//    
//    var dampOffsetBlock: ((CGFloat)->())?
//    
//    var stopPanGesture = false
//    
//    var dampOffset:CGFloat = 0.0
//    
//    @IBAction func panMove(_ sender: UIPanGestureRecognizer) {
//        let point = sender.translation(in: self)
//        if stopPanGesture {
//            return
//        }
//        
//        if sender.state == .began {
//            dampOffset = 0
//        } else if sender.state == .changed {
//          if  point.y <= gestureOffset && point.y > 0 {
//                let w = CGFloat(Double.pi) / (gestureOffset * 2)
//                dampOffset = sin(w * point.y) * dismissOffset
//                transform = CGAffineTransform(translationX: 0, y: dampOffset)
//            }
//        } else if sender.state == .ended {
//            UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.93, initialSpringVelocity: 0.3, options: .curveEaseOut, animations: { 
//                self.transform = .identity
//            }, completion: { (finished) in
//                self.dampOffset = 0
//            })
//        }
//        
//        if dampOffset >= (dismissOffset - 1) {
//            dampOffsetBlock?(dampOffset)
//        }
//        
//        print("pioint:\(point)")
//    }
//    
//    func tableViewDidScroll(tab:UITableView) {
//        let scrollView = tab
//        if scrollView.contentOffset.y > 0 {
//            scrollView.bounces = true
//            stopPanGesture = true
//        } else {
//            stopPanGesture = false
//            if scrollView.isDecelerating {
//                transform = CGAffineTransform(translationX: 0, y: -scrollView.contentOffset.y)
//                scrollView.transform = CGAffineTransform(translationX: 0, y: scrollView.contentOffset.y)
//            } else {
//                scrollView.bounces = false
//            }
//        }
//    }
//    
//    func tableViewDidEndDecelerating(table:UITableView) {
//        stopPanGesture = tableView.contentOffset.y > 0
//        dampOffset = 0
//    }
//    
//    lazy var header: AssetDetailHeader = {
//        let v = Bundle.main.loadNibNamed("AssetDetailHeader", owner: nil, options: nil)?.first as? AssetDetailHeader
//        v?.frame = CGRect(x: 0, y: 0, width: kScreenW, height: kScreenH - 40)
//        if v == nil {
//           return  AssetDetailHeader(frame: CGRect(x: 0, y: 0, width: kScreenW, height: kScreenH - 40))
//        }
//        return v!
//    }()
//    
//    @IBOutlet weak var tableView: UITableView!
//
//    override func awakeFromNib() {
//        super.awakeFromNib()
//        header.setupChartView()
//        header.setData(count: 4, range: 7)
//        tableView.tableHeaderView = header
//    }
//
//}
