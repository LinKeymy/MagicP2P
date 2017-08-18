////
////  CardTransitioner.swift
////  magic
////
////  Created by SteveLin on 2017/6/23.
////  Copyright © 2017年 SteveLin. All rights reserved.
////
//
//import Foundation
//
//extension UIView {
//    
//    func toImage() -> UIImage {
//        UIGraphicsBeginImageContextWithOptions(self.frame.size, false, UIScreen.main.scale)
//        if let context = UIGraphicsGetCurrentContext() {
//           self.layer.render(in: context)
//        }
//        let image = UIGraphicsGetImageFromCurrentImageContext()
//        UIGraphicsEndImageContext()
//        return image ?? UIImage()
//    }
//
//}
//
//
//class CardTransitioner: NSObject {
//    
//    var playBarAvatoerFrame: CGRect = CGRect.zero
//    var playBarFrame: CGRect = CGRect.zero
//    var tabBarView: UIImageView?
//    var tabbar: UITabBar?
//    
//    var isPresented: Bool = false
//    
//    func clickCornerWidth(view:UIView) {
//        let screenSize = UIScreen.main.bounds.size
//        let rounded = CGRect(x: 0, y: 0, width: screenSize.width, height: screenSize.height * 3)
//        let radii = CGSize(width: 8, height: 8)
//        let path = UIBezierPath.init(roundedRect:rounded , byRoundingCorners: [.topLeft,.topRight], cornerRadii: radii)
//        let sharpLayer = CAShapeLayer()
//        sharpLayer.path = path.cgPath
//        view.layer.mask = sharpLayer
//    }
//    
//}
//
//extension CardTransitioner: UIViewControllerAnimatedTransitioning {
//    
//    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
//        return 0.6
//    }
//    
//    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
//
//        if isPresented {
//            self.show(using: transitionContext)
//        } else {
//            self.dismiss(using: transitionContext)
//        }
//    }
//    
//    func dismiss(using transitionContext: UIViewControllerContextTransitioning) {
//        
//        
//        guard let root = (transitionContext.viewController(forKey: .to) as? RootViewController) else {
//            return
//        }
//        let navVc = root.selectedViewController
//        
//        guard let toVc = (navVc as? NavigationController)?.viewControllers.first as? SelectViewController,
//        let fromVc = transitionContext.viewController(forKey: .from),
//        let fromView = fromVc.view as? AssetsView else {
//            return
//        }
//        //Note
//        UIApplication.shared.statusBarStyle = .default
//         let avatar = UIImageView(image: fromView.header.chartSuperView.toImage()) 
//        fromView.header.chartSuperView.isHidden = true
//      
//        avatar.frame = fromView.convert(fromView.header.chartSuperView.bounds, to: UIApplication.shared.keyWindow)
//        avatar.contentMode = .scaleAspectFit
//        avatar.clipsToBounds = true
//        
//        let fromVcOriginFrame = fromView.convert(fromView.bounds, to: UIApplication.shared.keyWindow)
//        
////        let toolbar = AssetsToolBar(frame: )
//        let bar = Bundle.main.loadNibNamed("AssetsToolBar", owner: nil, options: nil)?.first as? AssetsToolBar
//        guard let toolbar = bar else {
//            return
//        }
//        toolbar.frame = CGRect(x: fromVcOriginFrame.origin.x, y: fromVcOriginFrame.origin.y, width: toVc.assetsBar.bounds.width, height: toVc.assetsBar.bounds.height)
////        toolbar.icon.isHidden = true
//        toolbar.alpha = 0
//        transitionContext.containerView.addSubview(toolbar)
//        transitionContext.containerView.addSubview(avatar)
//        
//        UIView.animate(withDuration: transitionDuration(using: transitionContext), delay: 0, usingSpringWithDamping: 0.93, initialSpringVelocity: 0.3, options: .curveEaseOut, animations: {
//            fromVc.view.frame = CGRect(x: 0, y: self.playBarFrame.origin.y, width: kScreenW, height: kScreenH )
//            root.view.transform = CGAffineTransform.identity
//            root.view.layer.mask = nil
//            fromVc.view.layer.mask = nil
//            avatar.frame = self.playBarAvatoerFrame
//            toolbar.frame = self.playBarFrame
//            toVc.assetsBar.alpha = 1
//            toolbar.alpha = 1
//            avatar.alpha = 0
//            self.tabBarView?.transform = CGAffineTransform.identity
//            transitionContext.containerView.backgroundColor = UIColor(hexString: "000000", withAlpha: 0)
//        }) { (finished) in
//            toVc.assetsBar.isHidden = false
//            toVc.assetsBar.nameLabel.isHidden = false
//            root.view.layer.mask = nil
//            fromVc.view.layer.mask = nil
//            toolbar.removeFromSuperview()
//            avatar.removeFromSuperview()
//            transitionContext.completeTransition(true)
//        }
//        
//    }
//    
//    
//    func show(using transitionContext: UIViewControllerContextTransitioning) {
//         let scale = (kScreenH - 40) / kScreenH
//        let containerView = transitionContext.containerView
//        guard  let root = transitionContext.viewController(forKey: .from) as? RootViewController,
//            let fromVc = (root.selectedViewController as? NavigationController)?.viewControllers.first as? SelectViewController,
//            let toVc = transitionContext.viewController(forKey: .to) as? TotalAssetsController,
//        let bar = self.tabbar else {
//                return
//        }
//        containerView.addSubview(toVc.view)
//        fromVc.assetsBar.nameLabel.isHidden = true
//        // 将toolbar的涂层render到image
//        let effectImage = fromVc.assetsBar.toImage()
//        let effectView = UIImageView(image: effectImage)
//        let avartar = UIImageView(image: fromVc.assetsBar.nameLabel.toImage())
//        
//        // (x = 0, y = 548), size = (width = 375, height = 70))     548 = (667 - 70 - 49)
//        effectView.frame = fromVc.assetsBar.convert(fromVc.assetsBar.bounds, to: UIApplication.shared.keyWindow)
//        
//        avartar.frame = fromVc.assetsBar.nameLabel.convert(fromVc.assetsBar.nameLabel.bounds, to: UIApplication.shared.keyWindow)
//        
//        // 先记录下Bar和Avartar原来在keyWindow中看到的位置
//        self.playBarFrame = effectView.frame
//        self.playBarAvatoerFrame = avartar.frame
////
//        avartar.contentMode = .scaleAspectFit
//        avartar.clipsToBounds = true
////        finalFrameForVc (origin = (x = 0, y = 0), size = (width = 375, height = 667))
//        let finalFrameForVc = transitionContext.finalFrame(for: toVc)
//        
//        let toView = toVc.view as! AssetsView
//        // 设置toview的初始位置，这样
//        toView.frame = effectView.frame
//        // avatar结束的位置
////        let avatarEndFrame = CGRect(x: 30, y: 30 + 30, width: kScreenW - 60, height: kScreenW - 60)
//        // effectView结束时的位置
//        let effectViewEndFrame = CGRect(x: 0, y: 40, width: effectView.frame.width, height: effectView.frame.height)
////        toView.icon.image = avartar.image
////        toView.icon.isHidden = true // 先隐藏，等到动画停止再显示
//        tabBarView = UIImageView(image: bar.toImage())
//        let barW: CGFloat = tabBarView?.image?.size.width ?? 0
//        let barH: CGFloat = tabBarView?.image?.size.height ?? 0
//        tabBarView?.frame = CGRect(x: 0, y: kScreenH - barH, width: barW, height: barH)
//        containerView.addSubview(effectView)
////        containerView.addSubview(avartar)
//        if  tabBarView != nil {
//            containerView.addSubview(tabBarView!)
//        }
////        avartar.image = UIImage(named: "博金贷")
//        UIApplication.shared.statusBarStyle = .lightContent
//        UIView.animate(withDuration: transitionDuration(using: transitionContext), delay: 0, usingSpringWithDamping: 0.93, initialSpringVelocity: 0.3, options: .curveEaseOut, animations: {
//            effectView.alpha = 0
//            fromVc.assetsBar.alpha = 0
//            effectView.frame = effectViewEndFrame
////            avartar.frame = avatarEndFrame
//            root.view.transform = CGAffineTransform(scaleX: scale , y: scale)
//            self.tabBarView?.transform = CGAffineTransform(translationX: 0, y: barH)
//            toView.frame  = CGRect(x: 0, y: 30, width: finalFrameForVc.size.width, height: finalFrameForVc.size.height - 30)
//            containerView.backgroundColor = UIColor(hexString: "000000", withAlpha: 0.2)
//            self.clickCornerWidth(view: root.view)
//            self.clickCornerWidth(view: toVc.view)
//            
//        }, completion: { (finished) in
////            toView.icon.isHidden = false
//            effectView.removeFromSuperview()
////            avartar.removeFromSuperview()
//            transitionContext.completeTransition(true)
//        })
//    }
//}
//
//
//
//extension CardTransitioner: UIViewControllerTransitioningDelegate {
//
//    // 从这里打印也可以看出，在使用viewcontroller的present方法的时候，presenting可能是调用者的super或者其控制器层级的rooter,source一定是调用者，也就是说presenting有可能和source是同一对象
//    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
//        if let tabbar = source.tabBarController?.tabBar {
//            self.tabbar = tabbar
//        }
//        deLog("presented:\(presented) presenting:\(presenting) source: \(source)")
//        isPresented = true
//        return self
//    }
//    
//    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
//        isPresented = false
//        return self
//    }
//
//}
