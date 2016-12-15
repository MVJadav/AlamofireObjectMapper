//
//  LoginGetModel.swift
//  SignUp
//
//  Created by JADAV MEHUL on 06/12/16.
//

import UIKit
import ObjectMapper
/*
 // Login GET Model
 */

class LoginGetModel <T: Mappable,S: Mappable>: Mappable {
    
    var LoginResponse : T?
    var User : S?
    
    required init()
    {
        
    }
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        LoginResponse    <- map["LoginResponse"]
        User    <- map["User"]
    }
}

class User: Mappable{
    
    var City : String?
    var CreatedBy : String?
    var CreatedDate : String?
    var DeviceType : String?
    var DeviceUDID : String?
    var EncryptedUserId : String?
    var FirstName : String?
    var IsActive : Bool?
    var IsVerified : Bool?
    var LastLoginDate : String?
    var LastName : String?
    var MobileNumber : String?
    var ProfilePhotoName : String?
    var ProfileUrl : String?
    var RoleId : Int?
    var State : String?
    var TempProfilePhotoName : String?
    var UpdatedBy : String?
    var UpdatedDate : String?
    var UserId : Int?
    
    required init()
    {
        
    }
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        MobileNumber    <- map["MobileNumber"];
        City    <- map["City"];
        CreatedBy    <- map["CreatedBy"];
        CreatedDate    <- map["CreatedDate"];
        DeviceType    <- map["DeviceType"];
        DeviceUDID    <- map["DeviceUDID"];
        EncryptedUserId    <- map["EncryptedUserId"];
        DeviceUDID    <- map["DeviceUDID"];
        FirstName    <- map["FirstName"];
        IsActive    <- map["IsActive"];
        IsVerified    <- map["IsVerified"];
        LastLoginDate    <- map["LastLoginDate"];
        LastName    <- map["LastName"];
        ProfilePhotoName    <- map["ProfilePhotoName"];
        ProfileUrl    <- map["ProfileUrl"];
        RoleId    <- map["RoleId"];
        State    <- map["State"];
        UpdatedBy    <- map["UpdatedBy"];
        TempProfilePhotoName    <- map["TempProfilePhotoName"];
        UpdatedBy    <- map["UpdatedBy"];
        UpdatedDate    <- map["UpdatedDate"];
        UserId    <- map["UserId"];
    }
}

/*
 // Login POST Model
 */
class LoginPostModel: Mappable
{
    var MobileNumber : String? = ""
    var Password : String?
    var DeviceUDID : String?
    var Platform : String?
    var OTP : String?
    var DeviceType : String?
    
    required init()
    {
        
    }
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        MobileNumber    <- map["MobileNumber"];
        Password    <- map["Password"];
        DeviceUDID    <- map["DeviceUDID"];
        Platform    <- map["Platform"];
        OTP    <- map["OTP"];
        DeviceType    <- map["DeviceType"];
    }
}

class LogoutPostModel: Mappable
{
    var DeviceUDID : String?
    
    required init()
    {
        
    }
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        DeviceUDID    <- map["DeviceUDID"];
    }
}

class OTPResponse: Mappable {
    
    var IsOtpSent: Bool? = false
    var OtpCode: String? = ""
    
    init() {
        
    }
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        
        IsOtpSent    <- map["IsOtpSent"]
        OtpCode      <- map["OtpCode"]
    }
}


/*
 // Upload image POST Model
 */


class ImageUploadPostModel: Mappable {
    
    var FilePath: String?
    var FileName: String?
    var TempFilePath: String?
    var TempFileName: String?
    
    init() {
        
    }
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        
        FilePath            <- map["FilePath"]
        FileName            <- map["FileName"]
        TempFilePath        <- map["TempFilePath"]
        TempFileName        <- map["TempFileName"]
    }
    
}



class ImageUploadGetModel  <T: Mappable>: Mappable {
    
    var FileList: [T]?
    
    required init?() {
        // murtuza nalawala
        
    }
    required init?(map: Map) {
        // murtuza nalawala
        
    }
    func mapping(map: Map) {
        FileList <- map["FileList"]
    }
}

class FileList: Mappable {
    
    var FilePath: String?
    var FileName: String?
    var TempFilePath: String?
    var TempFileName: String?
    var IsDefaultImage: Bool?
    var ParentId: Int?
    var PrimaryId: Int?
    var IsCoverImage: Bool?
    var IsUpdate: Bool?
    var IsFirmCoverImage: Bool? = false
    
    init() {
        
    }
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        
        FilePath         <- map["FilePath"]
        FileName      <- map["FileName"]
        TempFilePath      <- map["TempFilePath"]
        TempFileName      <- map["TempFileName"]
        
        IsDefaultImage      <- map["IsDefaultImage"]
        
        ParentId      <- map["ParentId"]
        PrimaryId      <- map["PrimaryId"]
        
        IsCoverImage      <- map["IsCoverImage"]
        IsUpdate      <- map["IsUpdate"]
        IsFirmCoverImage      <- map["IsFirmCoverImage"]
    }
    
}



/*
 MARK: - Block User
 */
class BlockUserPostModel: Mappable {
    
    var ActionName: String?
    var ToUserId: Int?
    var Index: Int?
    
    
    init() {
        
    }
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        ActionName         <- map["ActionName"]
        ToUserId      <- map["ToUserId"]
    }
    
}

/*
 MARK: - Block User List
 */
class BlockUserListPostModel: Mappable {
    
    var PageSize: Int?
    var PageIndex: Int?
    var SortExpression: String?
    var SortType: String?
    
    init() {
        
    }
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        PageSize         <- map["PageSize"]
        PageIndex      <- map["PageIndex"]
        SortExpression      <- map["SortExpression"]
        SortType      <- map["SortType"]
    }
}


class BlockUserListGetModel<T: Mappable>: Mappable {
    
    var CurrentPage: Int?
    var TotalPages: Int?
    var TotalItems: Int?
    var ItemsPerPage: Int?
    var BlockUserList: [T]? = []
    
    init() {
    }
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        CurrentPage         <- map["CurrentPage"]
        TotalPages      <- map["TotalPages"]
        TotalItems      <- map["TotalItems"]
        ItemsPerPage      <- map["ItemsPerPage"]
        BlockUserList      <- map["Items"]
    }
}

class BlockUserList: Mappable {
    
    var Row: Int?
    var BlockedUserId: Int?
    var FirstName: String? = ""
    var LastName: String? = ""
    var ProfilePhotoName: String?
    
    init() {
        
    }
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        Row         <- map["Row"]
        BlockedUserId      <- map["ToUserId"]
        FirstName      <- map["FirstName"]
        LastName      <- map["LastName"]
        ProfilePhotoName      <- map["ProfilePhotoName"]
    }
}
