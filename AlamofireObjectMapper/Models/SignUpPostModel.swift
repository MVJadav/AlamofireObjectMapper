//
//  SignUpPostModel.swift
//  SignUp
//
//  Created by JADAV MEHUL on 06/12/16.
//

import UIKit
import ObjectMapper


class SignUpPostModel: Mappable {
    
    var FirstName: String?
    var LastName: String?
    var City: String?
    var State: String?
    var MobileNumber: String?
    var Password: String?
    var ProfilePhotoName: String?
    var TempProfilePhotoName: String?
    var DeviceUDID: String?
    var DeviceType: String?
    
    
    init() {
        
    }
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        
        FirstName         <- map["FirstName"]
        LastName      <- map["LastName"]
        City      <- map["City"]
        State      <- map["State"]
        MobileNumber         <- map["MobileNumber"]
        Password      <- map["Password"]
        ProfilePhotoName      <- map["ProfilePhotoName"]
        TempProfilePhotoName      <- map["TempProfilePhotoName"]
        DeviceUDID      <- map["DeviceUDID"]
        DeviceType      <- map["DeviceType"]
    }
}

class SignUpGetModel<T: Mappable,V: Mappable>: Mappable {
    
    var IsOtpSent: Int?
    var OtpCode: String!
    var LoginResponse: T?
    var UserSignup: V?
    
    init() {
        
    }
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        
        IsOtpSent         <- map["IsOtpSent"]
        OtpCode      <- map["OtpCode"]
        LoginResponse      <- map["LoginResponse"]
        UserSignup      <- map["User"]
    }
}


class LoginResponse: Mappable{
    
    var Token: String?
    
    init() {
        
    }
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        Token         <- map["Token"]
        
    }
}

class UserSignup: Mappable{
    
    var City: String?
    var CreatedBy: String?
    var CreatedDate: String?
    var FirstName : String?
    var LastName : String?
    var IsActive : Int?
    var IsVerified : Int?
    var MobileNumber : String?
    var ProfilePhotoName : String?
    var State : String?
    var UserId : Int?
    var ProfileUrl : String?
    var TempProfilePhotoName : String?
    
    init() {
        
    }
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        
        City         <- map["City"]
        CreatedBy         <- map["CreatedBy"]
        CreatedDate         <- map["CreatedDate"]
        FirstName         <- map["FirstName"]
        LastName         <- map["LastName"]
        IsActive         <- map["IsActive"]
        IsVerified         <- map["IsVerified"]
        MobileNumber         <- map["MobileNumber"]
        ProfilePhotoName         <- map["ProfilePhotoName"]
        UserId         <- map["UserId"]
        State         <- map["State"]
        ProfileUrl         <- map["ProfileUrl"]
        TempProfilePhotoName         <- map["TempProfilePhotoName"]
    }
}


