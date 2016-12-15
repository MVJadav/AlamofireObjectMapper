//
//  ServiceUrl.swift
//  SignUp
//
//  Created by JADAV MEHUL on 06/12/16.
//

import Foundation

class ServiceUrl:NSObject{
    
    //static let Base = "http://192.168.1.105:7860/"
    static let Base = "http://49.50.81.121:82/" //Nikhil Live
    
    static let Login =  Base + "/security/login"
    static let Signup = Base + "/security/signup"
    static let ProfileImageUpload = Base + "/security/uploadfile"
    
}
