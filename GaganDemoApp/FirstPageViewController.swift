//
//  FirstPageViewController.swift
//  GaganDemoApp
//
//  Created by Gagan S on 08/08/21.
//

import Foundation
import UIKit
import ObjectMapper

class FirstPageViewController : UIViewController {
    
    @IBOutlet weak var fruitsTableView: UITableView?
    
    var fruitsArray : [Fruits] = []
    var nameArray : [String] = []
    var responseData :JsonModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "First Page"
        fruitsTableView!.delegate = self
        fruitsTableView!.dataSource = self
        displayData()
       // displayViaService()
    }
    
    func displayViaService() {
        ApiManager.getFruitsDetails() { [self] (serviceResponse) in
            if serviceResponse != nil {
                self.responseData = serviceResponse
                self.showData()
            }
        }
        
    }

    
    func displayData() {
        
        var json = """
        

        {

        "fruits": {

        "apple": {

            "url": "https://upload.wikimedia.org/wikipedia/commons/f/f4/Honeycrisp.jpg"

        },

        "kiwi": {

            "url": "https://upload.wikimedia.org/wikipedia/commons/5/59/Kiwi1.1.jpg"

        },

        "mango": {

            "url": "https://upload.wikimedia.org/wikipedia/commons/e/e9/Sindhri_Mango.JPG"

        },

        "coconut": {

            "url": "https://upload.wikimedia.org/wikipedia/commons/5/50/Coconut_4.jpg"

        },

        "plum": {

            "url": "https://upload.wikimedia.org/wikipedia/commons/2/24/Red-Plums.jpg"

        },

        "banana": {

            "url": "https://upload.wikimedia.org/wikipedia/commons/4/44/Bananas_white_background_DS.jpg"

        },

        "guava": {

            "url": "https://upload.wikimedia.org/wikipedia/commons/0/02/Guava_ID.jpg"

        }

        },

        "list": ["apple", "kiwi", "banana", "mango", "mango", "banana", "coconut", "apple", "plum", "banana", "guava"]

        }

        """
        if let dataResponse = Mapper<JsonModel>().map(JSONString : json as! String) {
            responseData = dataResponse
            self.showData()
        }
    }
    
    func showData(){
        if !fruitsArray.contains(responseData.fruits!) {
            fruitsArray.append(responseData.fruits!)
        }
        nameArray.append("apple")
        nameArray.append("kiwi")
        nameArray.append("mango")
        nameArray.append("coconut")
        nameArray.append("plum")
        nameArray.append("banana")
        nameArray.append("guava")
        fruitsTableView?.reloadData()
    }
}


extension FirstPageViewController : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nameArray.count
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = fruitsTableView?.dequeueReusableCell(withIdentifier: "FruitsTableViewCell") as! FruitsTableViewCell
        cell.labeltext.text = self.nameArray[indexPath.row]
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let imageTapped = self.nameArray[indexPath.row]
        var imageSelected = ""
        
        if imageTapped == "apple" {
            imageSelected = (fruitsArray[0].apple?.url)!
        }
        if imageTapped == "apple" {
            imageSelected = (fruitsArray[0].apple?.url)!
        }
        if imageTapped == "kiwi" {
            imageSelected = (fruitsArray[0].kiwi?.url)!
        }
        if imageTapped == "mango" {
            imageSelected = (fruitsArray[0].mango?.url)!
        }
        if imageTapped == "coconut" {
            imageSelected = (fruitsArray[0].coconut?.url)!
        }
        if imageTapped == "plum" {
            imageSelected = (fruitsArray[0].plum?.url)!
        }
        if imageTapped == "banana" {
            imageSelected = (fruitsArray[0].banana?.url)!
        }
        if imageTapped == "guava" {
            imageSelected = (fruitsArray[0].guava?.url)!
        }
        
        let sb = UIStoryboard(name : "Demotest", bundle : nil)
        let className = sb.instantiateViewController(identifier: "SecondPageViewController") as! SecondPageViewController
        className.imageName = imageSelected
        self.navigationController?.pushViewController(className, animated: true)
    }
    
}
