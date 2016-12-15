//
//  SplashModel.swift
//  SignUp
//
//  Created by JADAV MEHUL on 06/12/16.
//

import UIKit
import ObjectMapper

//Error Model
class Errors: Mappable {
    
    var Field: String?
    var Message: String?
    
    required init?(map: Map){
        
    }
    
    func mapping(map: Map) {
        
        Field <- map["Field"]
        Message <- map["Message"]
    }
}
