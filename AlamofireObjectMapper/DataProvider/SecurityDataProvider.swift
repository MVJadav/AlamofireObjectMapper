//
//  SecurityDataProvider.swift
//  SignUp
//
//  Created by JADAV MEHUL on 06/12/16.
//

import Foundation
import ObjectMapper
import Alamofire
import AlamofireObjectMapper


class SecurityDataProvider:NSObject{
    
    var jsonDictionary: NSDictionary!
    
    func Login (signupModel : LoginPostModel, ServiceCallBack: @escaping (_ result: String?, _ error: NSError?)-> Void! )
    {
        let serviceRequest = ServiceRequest<LoginPostModel>();
        serviceRequest.Data=signupModel;
        let JSONString : Parameters = Mapper().toJSON(serviceRequest);

//        HttpRequest.servicecall(url: ServiceUrl.Login, HttpMethod:.post,  InputParameter: JSONString,  ServiceCallBack: ServiceCallBack)
        
        HttpRequest.servicecall(url: ServiceUrl.Login, HttpMethod: .post, uiviewController: nil, InputParameter: JSONString, view: nil) { (result, error) -> Void in
            //code
            self.jsonDictionary =  JSON().onvertToDictionary(text: result!) as NSDictionary!
            print("Response : ", self.jsonDictionary)
            return ServiceCallBack(result,error)
        }
        
        
        
    }
    
    func SignUp (signupModel : SignUpPostModel, uiviewController:UIViewController? = nil, ServiceCallBack: @escaping (_ result: String?, _ error: NSError?)-> Void! )
    {
//        if let view = uiviewController as? RegistrationVC {
//            print(view.imgProgress)
//            view.imgProgress.isHidden = false
//            view.imgProgress.progress = 0.5
//        }
        let serviceRequest = ServiceRequest<SignUpPostModel>();
        serviceRequest.Data=signupModel;
        if((UserDefaults.standard.object(forKey: "\(Constant.Preference.PrefToken)") != nil))
        {
            serviceRequest.Token = Prefrence.preferenceGetString(key: Constant.Preference.PrefToken) as NSString?
        }
        let JSONString : Parameters = Mapper().toJSON(serviceRequest);
        
//        HttpRequest.servicecall(url: ServiceUrl.Signup, HttpMethod:.post, uiviewController:uiviewController,  InputParameter: JSONString,  ServiceCallBack: ServiceCallBack)
        
        HttpRequest.servicecall(url: "", HttpMethod: .post, uiviewController: uiviewController, InputParameter: JSONString, view: nil) { (result, error) -> Void! in
            //code
            self.jsonDictionary =  JSON().onvertToDictionary(text: result!) as NSDictionary!
            print("Response : ", self.jsonDictionary)
            return ServiceCallBack(result,error)
        }
    }
    
    func imageUpload (signupModel : SignUpPostModel, uiviewController:UIViewController? = nil, imageData:Data, parameter: [String:String]? = nil, ServiceCallBack: @escaping (_ result: String?, _ error: NSError?)-> Void! )
    {
        
        let serviceRequest = ServiceRequest<SignUpPostModel>();
        serviceRequest.Data=signupModel;
        let JSONString : Parameters = Mapper().toJSON(serviceRequest);
//        HttpRequest.imageUploadeCall(url: ServiceUrl.ProfileImageUpload, HttpMethod:.post, uiviewController:uiviewController, imageData: imageData, parameter: parameter,  InputParameter: JSONString,  ServiceCallBack: ServiceCallBack)
        
        HttpRequest.imageUploadeCall(url: ServiceUrl.ProfileImageUpload, HttpMethod: .post, uiviewController: uiviewController, imageData: imageData, parameter: parameter, InputParameter: JSONString, view: nil) { (result, error) -> Void! in
            //code
            self.jsonDictionary =  JSON().onvertToDictionary(text: result!) as NSDictionary!
            print("Response : ", self.jsonDictionary)
            return ServiceCallBack(result,error)
        }
    }
    
    func downloadImage(url : String, uiviewController:UIViewController? = nil, ServiceCallBack: @escaping (_ error: NSError?, _ image:UIImage?)-> Void! )
    {
        
        HttpRequest.downloadImage(url: url, uiviewController: uiviewController) { (error, image) -> Void! in
            //code
            return ServiceCallBack(error,image)
        }
    }
    
}

