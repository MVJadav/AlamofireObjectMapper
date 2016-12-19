//
//  Constant.swift
//  SignUp
//
//  Created by JADAV MEHUL on 06/12/16.
//

import Foundation
import UIKit

let appDelegate = UIApplication.shared.delegate as! AppDelegate
let currentDevice = UIDevice.current.model
let defaultYear = "1970";

class Constant
{
    
    class HttpParameter
    {
        ///MARK: - APIKey
        static let APIKey = "I_d912b1c8-1e10-4c64-8ef0-c0c9706abaec"
        static let DeviceType = "IOS"
        
        static let ImagesType = "UserProfileImage"
        
        // MARK: - Constant
        static let HttpType_POST = "post"
        static let HttpType_GET = "get"
        
        //MARK:-Upload Image
        static let File = "file"
        static let Mimetype = "image/jpg"
        static let Filename = "team-icon.jpg"
        static let UserFilename = "user-profile.jpg"
        
        
        //MARK:-Upload Image Folder Image
        static let UploadFirmImages = "UploadFirmImages"
        static let UploadPostImages = "UploadPostImages"
        static let UploadSampleImages = "UploadSampleImages"
        static let UploadChatImages = "UploadChatImages"
        
        static let FirmImageWidth = 600.0
        static let FirmImageHeight = 600.0
        
        // MARK: - Error Code
        static let Error_500 = "500" //Oops something went wrong
        static let Error_410 = "410" //Token Expierd
        static let Error_400 = "400" //Error Message
        static let Error_401 = "401" //User Not Verify
        static let Error_200 = "200" //Succsessfull
        
        // MARK: - CometChat
        static let Chat_Key = "946d6ueaca6c6069l7920e582fd98229"
    }
    
    /*
     // MARK: - Preference
     */
    class Preference {
        
        
        static let PrefToken = "PrefToken"
        static let PrefUserId = "PrefUserId"
        static let MaxFirmAllowedToCreate = "MaxFirmAllowedToCreate"
        static let PrefMobileConnectionTimeout = "MobileConnectionTimeout"
        static let PrefMobileNumber = "PrefMobileNumber"
        static let PrefDeviceToken = "PrefDeviceToken" // For Notification
        
        
    }
    
    
    class ToastParameter {
        /*
         // MARK; Set Imagename For Toast Message
         */
        static let Image_Error : UIImage = UIImage(named:"Toast_Error.png")!
        static let Color_Error = UIColor.red
    }
    class AppSyncMessage {
        static let SyncFailMessage      = "App is not synced properly. Please retry."
        static let RequestFail          = "Network error, please try after some time."
        static let NoInternetConnection = "No internet connection found. Please restart app with internet connection."
    }
    class variables {
        static let OK = "OK"
        static let Error = "Error"
    }
    class Color {
        static let Statusbar = UIColor(red: 63/255, green: 185/255, blue: 175/255 , alpha :0.7)
        static let AppTheme = UIColor(red: 63/255, green: 185/255, blue: 175/255 , alpha :1)//UIColor(red: 72/255, green: 197/255, blue: 147/255 , alpha :1)
        static let TabbarSelected = UIColor(red: 72/255, green: 197/255, blue: 147/255 , alpha :1)
        
        //Gradient Color Code
        static let Gradient_Left = UIColor(red: 74/255, green: 219/255, blue: 155/255 , alpha :1)
        static let Gradient_Right = UIColor(red: 63/255, green: 185/255, blue: 175/255 , alpha :1)
        //R: 74 G: 219 B: 155
        //R: 63 G: 185 B: 175
        
        
        static let Gradient_Black = UIColor(red: 29/255, green: 30/255, blue: 34/255 , alpha :0.7)
        static let Gradient_White = UIColor(red: 255/255, green: 255/255, blue: 255/255 , alpha :0.1)
        
        static let Light_Green =  UIColor(red: 68/255, green: 175/255, blue: 86/255 , alpha :0.3)
        static let Light_Red =  UIColor(red: 198/255, green: 26/255, blue: 22/255, alpha: 0.2)
        static let Light_Blue =  UIColor(red: 30/255, green: 144/255, blue: 255/255, alpha: 0.2)
        static let Light_Pink = UIColor(red: 230/255, green: 156/255, blue: 143/255, alpha: 1)
        static let Light_Orange = UIColor(red: 250/255, green: 92/255, blue: 57/255, alpha: 1)
        static let Light_Grey = UIColor(red: 170/255, green: 170/255, blue: 170/255, alpha: 0.5)
        static let Light_Grey_Thin = UIColor(red: 170/255, green: 170/255, blue: 170/255, alpha: 0.2)
        
        static let Dark_Pink = UIColor(red: 255/255, green: 51/255, blue: 102/255, alpha: 1.0)
        static let Dark_Green =  UIColor(red: 68/255, green: 175/255, blue: 86/255 , alpha :1.0)
        static let Dark_Red =  UIColor(red: 198/255, green: 26/255, blue: 22/255, alpha: 1.0)
        //rgb(255,51,102)
        
    }
}
