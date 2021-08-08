//
//  SecondPageViewController.swift
//  GaganDemoApp
//
//  Created by Gagan S on 08/08/21.
//

import Foundation
import UIKit

class SecondPageViewController : UIViewController {
    
    @IBOutlet weak var imageView : UIImageView!
    var imageName : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Second Page"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if imageName != "" {
            let url = URL(string : imageName)
            if let data = try? Data(contentsOf: url!) {
                self.imageView.image =  UIImage(data: data)
            }
        }
    }
}
