//
//  ApiManager.swift
//  GaganDemoApp
//
//  Created by Gagan S on 08/08/21.
//

import UIKit
import ObjectMapper
import Alamofire
import SwiftyJSON

public enum Result<T,U> {
    case Success(T)
    case Failure(U)
}

class ApiManager {

    typealias fruitsCallBack = (JsonModel?) -> Void
    public typealias resultCallBack = (Result<Any,Any>) -> Void
    
    class func getFruitsDetails(onCompletion : @escaping fruitsCallBack) {
        let url = "https://demo7231354.mockable.io/getFruitsData"
        consumeRequest(url) {(response) in
            switch response {
            case .Success(let json) :
                if let dataResponse = Mapper<JsonModel>().map(JSONString : json as! String) {
                    onCompletion(dataResponse)
                }
            case .Failure(let error) :
                onCompletion(nil)
            }
        }
    }
    
    class func consumeRequest(_ urlString: URLConvertible, method : HTTPMethod = .get, parameters : Parameters? = nil, encoding : ParameterEncoding = JSONEncoding.default, _ headers : HTTPHeaders? = nil, onCompletion : @escaping resultCallBack) {
        var auth_header : [String : String]?
        
        Alamofire.request(urlString, method: method, parameters: parameters, encoding: encoding, headers: auth_header)
            .validate(statusCode : 200..<300)
            .responseJSON { (response) in
                switch response.result {
                case .success( _) :
                    handleSuccessRequest(response:response,onCompletion:onCompletion)
                case .failure(let error) :
                    //do nothing
                    if response.response != nil {
                        
                    }
                }
                
            }
    }
    
    static func handleSuccessRequest(response : DataResponse<Any>,onCompletion : @escaping resultCallBack) {
        do {
            let json = try JSON(data : response.data!)
            if let status : Int =  response.response?.statusCode {
                onCompletion(.Success(json.rawString()))
            }
        }
        catch let error as NSError{
            print("\(error)")
        }
    }
    
}
