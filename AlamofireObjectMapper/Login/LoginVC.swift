//
//  LoginVC.swift
//  SignUp
//
//  Created by JADAV MEHUL on 06/12/16.
//

import UIKit
import ObjectMapper
import Alamofire
import AlamofireImage


class LoginVC: UIViewController {

    @IBOutlet weak var txtUserName: CustomeTextField!
    @IBOutlet weak var txtPassword: CustomeTextField!
  
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        super.viewWillAppear(animated)
    }

    @IBAction func btnLogin(_ sender: AnyObject) {
        callAPI()
    }
    
    @IBAction func btnSignUpClick(_ sender: AnyObject) {
        
        let objSignUp = RegistrationVC(nibName:"RegistrationVC",bundle: nil)
        objSignUp.isEditable = objSignUp.giveNew()
        self.navigationController?.pushViewController(objSignUp, animated: true)
    }
    
    
    func callAPI(){
        
        showActivityIndicator(uiView: self.view)
        //showProgress(uiView: self.view)
        let objloginPostModel:LoginPostModel = LoginPostModel()
        objloginPostModel.MobileNumber = self.txtUserName.text
        objloginPostModel.Password = self.txtPassword.text
        objloginPostModel.Platform = "I"
        objloginPostModel.DeviceType = "IOS"
        let securitydataprovider: SecurityDataProvider = SecurityDataProvider()
        showActivityIndicator(uiView: self.view)
        securitydataprovider.Login(signupModel: objloginPostModel, ServiceCallBack:{(result: String?, error: NSError?) -> Void in
            if(result != nil)
            {
                let concurrentQueue = DispatchQueue(label: "queuename", attributes: .concurrent)
                concurrentQueue.sync {
                    let serviceResponse = Mapper<ServiceResponse<LoginGetModel<LoginResponse,User>>>().map(JSONString: result!)
                    if(serviceResponse?.IsSuccess)!{
                        print(serviceResponse)
                        print(serviceResponse?.Data?.User?.City)
                        RegistrationVC.serviceResponse = serviceResponse
                        // Redirect TabView
                         let objLoginVC = MainTabVC(nibName:"MainTabVC",bundle: nil)
                         let navigationController = UINavigationController(rootViewController: objLoginVC)
                         appDelegate.window?.rootViewController = navigationController
                         appDelegate.window?.makeKeyAndVisible()
                    }
                }
            }
            else {
                print(result)
            }
            hiddeActivityIndicator()
            //dismissProgress()
        })
    }

    
    /*
    // MARK: - Navigation
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
