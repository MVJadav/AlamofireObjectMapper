//
//  ServiceRequest.swift
//  SignUp
//
//  Created by JADAV MEHUL on 06/12/16.
//

import UIKit
import ObjectMapper


class ServiceRequest<T: Mappable>: Mappable {
    
    var Key: NSString?
    var Token: NSString?
    var Data : T?
    
    init() {
        Token   =   ""
        Key     =   "I_d912b1c7-1e00-4c69-8ef0-c9c9103abaec";
    }
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        
        Key         <- map["Key"]
        Token      <- map["Token"]
        Data       <- map["Data"]
        
    }
}
