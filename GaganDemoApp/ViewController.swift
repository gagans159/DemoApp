//
//  ViewController.swift
//  GaganDemoApp
//
//  Created by Gagan S on 08/08/21.
//

import UIKit
import Alamofire
import SwiftyJSON
import ObjectMapper

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func buttonClick(_ sender : UIButton) {
        let sb = UIStoryboard(name : "Demotest", bundle : nil)
        let className = sb.instantiateViewController(identifier: "FirstPageViewController") as! FirstPageViewController
        self.navigationController?.pushViewController(className, animated: true)
    }


}

