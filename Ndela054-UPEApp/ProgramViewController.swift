//
//  FirstViewController.swift
//  Ndela054-UPEApp
//
//  Created by user175850 on 7/31/20.
//  Copyright © 2020 user175850. All rights reserved.
//

import UIKit
import WebKit

class ProgramViewController: UIViewController, WKNavigationDelegate {

    var webView: WKWebView!
    
    override func loadView() {
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let url = URL(string: "https://upe.cs.fiu.edu")!
        webView.load(URLRequest(url: url))
        webView.allowsBackForwardNavigationGestures = true
    }


}

