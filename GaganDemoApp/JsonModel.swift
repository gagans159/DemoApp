//
//  JsonModel.swift
//  GaganDemoApp
//
//  Created by Gagan S on 08/08/21.
//

import Foundation
import UIKit
import ObjectMapper

class JsonModel : NSObject, Mappable {
    var fruits : Fruits?
    var list : [String]?
    
    required init?(map: Map) {
        super.init()
    }
    
    required override init() {
        super.init()
    }
    
    func mapping(map: Map) {
        fruits <- map ["fruits"]
        list <- map ["list"]
    }
    
}

class Fruits : NSObject, Mappable {
    var apple ,kiwi, mango, coconut : RowItemType?
    var plum, banana, guava :RowItemType?
    
    required init?(map: Map) {
        super.init()
    }
    
    required override init() {
        super.init()
    }
    
    func mapping(map: Map) {
        apple <- map ["apple"]
        kiwi <- map ["kiwi"]
        mango <- map ["mango"]
        coconut <- map ["coconut"]
        plum <- map ["plum"]
        banana <- map ["banana"]
        guava <- map ["guava"]
    }
    
}

class RowItemType : NSObject, Mappable {
    var url : String?
    
    required init?(map: Map) {
        super.init()
    }
    
    required override init() {
        super.init()
    }
    
    func mapping(map: Map) {
        url <- map ["url"]
    }
    
}
