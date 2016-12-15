//
//  HttpRequest.swift
//  SignUp
//
//  Created by JADAV MEHUL on 06/12/16.
//

import UIKit
import ObjectMapper
import Alamofire
import AlamofireObjectMapper


class HttpRequest: NSObject {
    
    static var currerntTask : URLSessionTask? = nil
    
    class func servicecall(url: String, HttpMethod: HTTPMethod, uiviewController:UIViewController? = nil, InputParameter: Parameters, view:UIViewController? = nil, ServiceCallBack: @escaping (_ result: String?, _ error: NSError?)-> Void!) {
        
        
        Alamofire.request(url, method:HttpMethod,parameters:InputParameter, headers: nil).responseJSON { response in
            /*
             print(response.request)  // original URL request
             print(response.response) // HTTP URL response
             print(response.data)     // server data
             print(response.result)   // result of response serialization
             */
            if(response.result.isSuccess){
                let datastring = NSString(data:response.data!, encoding:String.Encoding.utf8.rawValue) as String?
                //print("ResponseString:",datastring)
                ServiceCallBack(datastring, nil)
            }else{
                print(response.result.error?.localizedDescription)
                ServiceCallBack(nil, response.result.error as NSError?)
            }
        }
    }
    
    class func imageUploadeCall(url: String, HttpMethod: HTTPMethod, uiviewController:UIViewController? = nil, imageData:Data, parameter: [String:String]? = nil, InputParameter: Parameters, view:UIViewController? = nil, ServiceCallBack: @escaping (_ result: String?, _ error: NSError?)-> Void!) {
        
        Alamofire.upload(multipartFormData: { (multipartFormData) in
            multipartFormData.append(imageData, withName: "photo_path", fileName: "uploaded_file.jpeg", mimeType: "image/jpeg")
            for (key, value) in parameter! {
                multipartFormData.append((value as AnyObject).data(using: String.Encoding.utf8.rawValue)!, withName: key )
            }
            }, to:url)
        { (result) in
            switch result {
            case .success(let upload, _, _):
                
                upload.uploadProgress(closure: { (Progress) in
                    if let view = uiviewController as? RegistrationVC {
                        view.imgProgress.isHidden = false
                        view.imgProgress.setProgress(Float(Progress.fractionCompleted), animated: true)
                    }
                    
                })
                upload.responseJSON { response in
                    //self.delegate?.showSuccessAlert()
                    
                    if let view = uiviewController as? RegistrationVC {
                        view.imgProfile.alpha = 1
                        view.imgProgress.isHidden = true
                        view.imgProgress.progress = 0.0
                    }
                    
                    
                    if(response.result.isSuccess){
                        let datastring = NSString(data:response.data!, encoding:String.Encoding.utf8.rawValue) as String?
                        //print("ResponseString:",datastring)
                        ServiceCallBack(datastring, nil)
                    }else{
                        print(response.result.error?.localizedDescription)
                        ServiceCallBack(nil, response.result.error as NSError?)
                    }
                    /*
                    print(response.request)  // original URL request
                    print(response.response) // URL response
                    print(response.data)     // server data
                    print(response.result)   // result of response serialization
                    //                        self.showSuccesAlert()
                    */
                    //self.removeImage("frame", fileExtension: "txt")
                    if let JSON = response.result.value {
//                        print("JSON: \(JSON)")
                    }
                }
            case .failure(let encodingError):
                //self.delegate?.showFailAlert()
                print(encodingError)
            }
        }
    }
    
    
    class func downloadImage(url: String, uiviewController:UIViewController? = nil, ServiceCallBack: @escaping (_ error: NSError?, _ image:UIImage?)-> Void!) {

        Alamofire.request(url)
            .downloadProgress { progress in
                
                print("Download Progress: \(progress.fractionCompleted)")
                if let view = uiviewController as? RegistrationVC {
                    view.imgProgress.isHidden = false
                    view.imgProgress.setProgress(Float(progress.fractionCompleted), animated: true)
                }
            }
            .responseData { response in
                
                if let view = uiviewController as? RegistrationVC {
                    view.imgProgress.isHidden = true
                    view.imgProgress.progress = 0.0
                }
                if let data = response.result.value {
                    let image = UIImage(data: data)
                    ServiceCallBack(response.result.error as NSError?,image)
                }
            }
        
    }
    
    
    func RequestFail() {
        // Mehul24Nov
        //        SCLAlertView().showCloseButton=false;
        //        SCLAlertView().hideView()
    }
    class func ActivieNow() {
    }
    class func ActivieLater() {
    }
    class func cancelHttpReuest() {
        HttpRequest.currerntTask?.cancel()
    }
}

// MARK: File Uploading
/*
 Alamofire.upload(multipartFormData: { (multipartFormData) in
 multipartFormData.append(UIImageJPEGRepresentation(self.imgProfile.image!, 1.0)!, withName: "photo_path", fileName: "uploaded_file.jpeg", mimeType: "image/jpeg")
 for (key, value) in RequestDist {
 multipartFormData.append((value as AnyObject).data(using: String.Encoding.utf8.rawValue)!, withName: key as! String)
 }
 }, to:ServiceUrl.ProfileImageUpload)
 { (result) in
 switch result {
 case .success(let upload, _, _):
 
 upload.uploadProgress(closure: { (Progress) in
 self.imgProgress.setProgress(Float(Progress.fractionCompleted), animated: true)
 print("Upload Progress: \(Progress.fractionCompleted)")
 })
 
 upload.responseJSON { response in
 //self.delegate?.showSuccessAlert()
 self.imgProfile.alpha = 1
 self.imgProgress.isHidden = true
 self.imgProgress.progress = 0.0
 
 print(response.request)  // original URL request
 print(response.response) // URL response
 print(response.data)     // server data
 print(response.result)   // result of response serialization
 //                        self.showSuccesAlert()
 //self.removeImage("frame", fileExtension: "txt")
 if let JSON = response.result.value {
 print("JSON: \(JSON)")
 }
 }
 
 case .failure(let encodingError):
 //self.delegate?.showFailAlert()
 print(encodingError)
 }
 }
 */

