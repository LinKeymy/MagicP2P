//
//  WebViewVC.swift
//  magic
//
//  Created by SteveLin on 2017/5/22.
//  Copyright © 2017年 SteveLin. All rights reserved.
//

import UIKit
import WebKit

class WebViewVC: UIViewController {
    
    var urlString:String?
    private lazy var webView: WKWebView = {
        let webConfiguration = WKWebViewConfiguration()
        let web = WKWebView(frame: .zero, configuration: webConfiguration)
        return web
    }()
    
    override func loadView() {
        webView.uiDelegate = self
        view = webView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        guard let urlString = urlString,
        let myURL = URL(string: urlString) else {
            return
        }
        let myRequest = URLRequest(url: myURL)
        webView.load(myRequest)
    }

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    convenience init(url:String) {
        self.init(nibName: nil, bundle: nil)
        urlString = url
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        #if DEBUG
        fatalError("init(coder:) has not been implemented")
        #else
        print("init(coder:) has not been implemented")
        #endif
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
extension WebViewVC:WKUIDelegate {


}
