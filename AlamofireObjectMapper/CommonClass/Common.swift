//
//  Common.swift
//  SignUp
//
//  Created by JADAV MEHUL on 06/12/16.
//

import UIKit

public class Reachability {
    class func isConnectedToNetwork() -> Bool {
        
        /*
         var zeroAddress = sockaddr_in()
         zeroAddress.sin_len = UInt8(MemoryLayout.size(ofValue: zeroAddress))
         zeroAddress.sin_family = sa_family_t(AF_INET)
         let defaultRouteReachability = withUnsafePointer(&zeroAddress) {
         SCNetworkReachabilityCreateWithAddress(nil, UnsafePointer($0))
         }
         var flags = SCNetworkReachabilityFlags()
         if !SCNetworkReachabilityGetFlags(defaultRouteReachability!, &flags) {
         return false
         }
         let isReachable = (flags.rawValue & UInt32(kSCNetworkFlagsReachable)) != 0
         let needsConnection = (flags.rawValue & UInt32(kSCNetworkFlagsConnectionRequired)) != 0
         return (isReachable && !needsConnection)
         */
        return true;
        
    }
}


class Prefrence {
    
    static let defaults = UserDefaults.standard
    
    static func preferencePutInteger(key : String , value : Int){
        defaults.set(value, forKey: key)
    }
    
    static func preferenceGetInteger(key : String) -> Int {
        return defaults.integer(forKey: key)
    }
    
    static func preferencePutString(key : String , value : String){
        defaults.set(value, forKey: key)
    }
    
    static func preferenceGetString(key : String) -> String? {
        return defaults.string(forKey: key)!
    }
    
    static func preferencePutImage(key : String , value : String){
        defaults.set(value, forKey: key)}
    
    static func preferenceGetImage(key : String) -> String? {
        return defaults.string(forKey: key)!
    }
    
    static func prefrencePutBool(key : String , value : Bool) {
        defaults.set(value, forKey: key)
    }
    
    static func prefrenceGetBool(key : String ) -> Bool {
        return defaults.bool(forKey: key)
    }
    
    static func prefrenceClearAll(){
        let appDomain = Bundle.main.bundleIdentifier!
        UserDefaults.standard.removePersistentDomain(forName: appDomain)
    }
    
    static func tokanExpClear()
    {
        Prefrence.preferencePutString (key: Constant.Preference.PrefToken, value: "")
        Prefrence.preferencePutString (key: Constant.Preference.PrefUserId, value: "")
    }
}

//ALERT MESSAGE: - set ALert Message
class AlertviewHelper: NSObject {
    
    func getAlertViewMessage(message: String) -> Void {
        
        let concurrentQueue = DispatchQueue(label: "queuename", attributes: .concurrent)
        concurrentQueue.sync {() -> Void in
            
            let alert = UIAlertView()
            alert.title = ""
            alert.message = message
            alert.addButton(withTitle: "Ok")
            alert.show()
        }
    }
    
    func getAlertViewMessageWithTitle(message: String, adTitle Title: String) {
        
        let concurrentQueue = DispatchQueue(label: "queuename", attributes: .concurrent)
        concurrentQueue.sync {() -> Void in
            /* show alert view */
            let alert: UIAlertView = UIAlertView(title: Title, message: message, delegate: nil, cancelButtonTitle: "OK", otherButtonTitles: "")
            alert.show()
        }
    }
}
//Mark:Photo PickUp
func generateBoundaryString() -> String {
    return "Boundary-\(NSUUID().uuidString)"
}
func createBodyWithParameters(parameters: [String: String]?, filePathKey: String?, imageDataKey: Data, boundary: String) -> NSData {
    let body = NSMutableData();
    
    var data:Data!
    
    data = "--\(boundary)\r\n".data(using: String.Encoding.isoLatin1)
    //body.append(data!)
    
    if parameters != nil {
        for (key, value) in parameters! {
            body.append(data!)
            data = "Content-Disposition: form-data; name=\"\(key)\"\r\n\r\n".data(using: String.Encoding.isoLatin1)
            body.append(data!)
            data = "\(value)\r\n".data(using: String.Encoding.isoLatin1)
            body.append(data!)
        }
    }
    //
    let filename = "user-profile.jpg"
    let mimetype = "image/jpg"
    body.append(data!)
    data = "Content-Disposition: form-data; name=\"\(filePathKey!)\"; filename=\"\(filename)\"\r\n".data(using: String.Encoding.isoLatin1)
    body.append(data!)
    data = "Content-Type: \(mimetype)\r\n\r\n".data(using: String.Encoding.isoLatin1)
    //
    body.append(data)
    body.append(imageDataKey as Data)
    data = "\r\n".data(using: String.Encoding.isoLatin1)
    body.append(data!)
    body.append(data)
    print(body.mutableBytes)
    return body
}

class JSON {
    
    func onvertToDictionary(text: String) -> [String: Any]? {
    if let data = text.data(using: .utf8) {
        do {
            return try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
        } catch {
            print(error.localizedDescription)
        }
    }
    return nil
}
}
