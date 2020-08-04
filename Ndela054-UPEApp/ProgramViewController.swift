// PROGRAMMER:  Nicholas Delamo
// PANTHERID:   5278993
// CLASS:       COP 465501 Online
// INSTRUCTOR:  Steve Luis ECS 282
// ASSIGNMENT:  Solo Project
// DUE:         Monday 08/03/20
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

