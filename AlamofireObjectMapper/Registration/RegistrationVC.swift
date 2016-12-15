//
//  RegistrationVC.swift
//  SignUp
//
//  Created by JADAV MEHUL on 06/12/16.
//
import UIKit
import ObjectMapper
import Alamofire
import AlamofireImage
import BSImagePicker
import Photos

class RegistrationVC: UIViewController, UIImagePickerControllerDelegate, UIPopoverControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate {

    //MARK: All Outlets
    @IBOutlet weak var imgProfile: UIImageView!
    @IBOutlet weak var txtFirstName: UITextField!
    @IBOutlet weak var txtLastName: UITextField!
    @IBOutlet weak var txtCity: UITextField!
    @IBOutlet weak var txtState: UITextField!
    @IBOutlet weak var txtMobile: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var btnSubmit: UIButton!

    @IBOutlet weak var viewPassword: UIView!
    
    @IBOutlet weak var imgProgress: UIProgressView!

   
    static var firstname : String? = ""
    
    
    //MARK: All Variables
    var strImageUpload : String? = ""
    var profileImageData : NSData? = nil;
    var setBorder : Bool = false
    var localPath: String?
    var strProfilePhotoName : String = ""
    
    //MARK: Temp Variable
    var allowMultiSelection : Bool = false
    
    //MARK: isEditable
    public enum isEditableEnum{
        case New
        case Edit
    }
    var isEditable : isEditableEnum!
    func giveEdit() -> isEditableEnum {
        return .Edit
    }
    func giveNew() -> isEditableEnum {
        return .New
    }
    static var serviceResponse = ServiceResponse<LoginGetModel<LoginResponse,User>>()
    
    override func viewDidLoad() {
        
        imgProgress.isHidden = true
//        downloadImage()
//        imageLoad()
        setGesture()
        
        switch isEditable {
        case giveEdit():
            self.viewPassword.isHidden = true
            setEditData()
            self.title = "Edit Profile"
            self.btnSubmit.setTitle("Edit", for: UIControlState.normal)
            break
            
        case giveNew():
            
            self.navigationController?.navigationBar.barTintColor = Constant.Color.AppTheme
            self.navigationController?.navigationBar.tintColor = UIColor.white
            self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName : UIColor.white]
            self.title = "New Registration"
            self.btnSubmit.setTitle("Registration", for: UIControlState.normal)
            break
            
        default: break
        }
        
        super.viewDidLoad()
    }

    override func viewDidAppear(_ animated: Bool) {
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewWillAppear(_ animated: Bool) {
        
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        
        if(setBorder){
            imgProfile.layer.borderWidth = 2.0
            imgProfile.layer.borderColor = UIColor.white.cgColor
        }else{
            imgProfile.layer.borderWidth = 0.0
            imgProfile.layer.borderColor = UIColor.clear.cgColor
        }
        imgProfile.layer.cornerRadius = 75  //imgProfile.frame.size.width/2
        imgProfile.layer.masksToBounds = true
        imgProfile.clipsToBounds = true
        super.viewWillAppear(animated)
    }

    
    @IBAction func btnClickSubmit(_ sender: AnyObject) {
        
        dismissKeyboard()
        signUpRequest()
    }
    
    func setGesture(){
        
        imgProfile.isUserInteractionEnabled = true
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.imageTapped(gestureRecognizer:)))
        imgProfile.addGestureRecognizer(tapRecognizer)
    }
    
    func imageTapped(gestureRecognizer: UITapGestureRecognizer) {
        
        dismissKeyboard()
        let alert:UIAlertController=UIAlertController(title: "Choose Image", message: nil, preferredStyle: UIAlertControllerStyle.actionSheet)
            let cameraAction = UIAlertAction(title: "Camera", style: UIAlertActionStyle.default)
            {
                UIAlertAction in
                self.openCamera()
            }
            let gallaryAction = UIAlertAction(title: "Gallary", style: UIAlertActionStyle.default)
            {
                UIAlertAction in
                if(self.allowMultiSelection){
                    self.showImagePicker()
                }else{
                    self.openGallary()
                }
            }
            let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.destructive)
            {
                UIAlertAction in
            }
            // Add the actions
            alert.addAction(cameraAction)
            alert.addAction(gallaryAction)
            alert.addAction(cancelAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    func dismissKeyboard()
    {
        txtFirstName.resignFirstResponder()
        txtLastName.resignFirstResponder()
        txtCity.resignFirstResponder()
        txtState.resignFirstResponder()
        txtMobile.resignFirstResponder()
        txtPassword.resignFirstResponder()
    }
    
    func openCamera()
    {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.camera) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerControllerSourceType.camera;
            imagePicker.allowsEditing = false
            self.present(imagePicker, animated: true, completion: nil)
        }
        else
        {
            let alert:UIAlertController=UIAlertController(title: "Oops No Camera !", message: nil, preferredStyle: UIAlertControllerStyle.actionSheet)
            let gallaryAction = UIAlertAction(title: "Gallary", style: UIAlertActionStyle.default)
            {
                UIAlertAction in
                if(self.allowMultiSelection){
                    self.showImagePicker()
                }else{
                    self.openGallary()
                }
            }
            let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.destructive)
            {
                UIAlertAction in
            }
            // Add the actions
            alert.addAction(gallaryAction)
            alert.addAction(cancelAction)
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func openGallary()
    {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.photoLibrary) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerControllerSourceType.photoLibrary;
            imagePicker.allowsEditing = true
            self.present(imagePicker, animated: true, completion: nil)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]){
        
        picker .dismiss(animated: true, completion: nil)
        if let imagePicked = info[UIImagePickerControllerEditedImage] as? UIImage {
            self.setBorder = true;
            imgProfile.image = nil
            imgProfile.image = imagePicked
            var RequestDist : NSDictionary = NSDictionary()
            RequestDist = ["Key":Constant.HttpParameter.APIKey , "PostItemType":Constant.HttpParameter.ImagesType];
            serviceCallUploadImage(image: imagePicked, parameter: RequestDist as? [String : String])
            self.profileImageData = UIImageJPEGRepresentation(imagePicked, 1) as NSData?
        }
        //MEHUL7Dec2016
        /*
        guard let image = info[UIImagePickerControllerOriginalImage] as? UIImage else {
            return
        }
        let documentDirectory: NSString = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first! as NSString
        let imageName = "temp"
        let imagePath = documentDirectory.appendingPathComponent(imageName)
        
        if let data = UIImageJPEGRepresentation(image, 80) {
            
            do {
                try data.write(to: URL(string: imagePath)! , options: .atomic)
            } catch {
                print(error)
            }
        }
        localPath = imagePath
        dismiss(animated: true, completion: {
        })
        */
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController){
        
        if(profileImageData==nil)
        {
            //imgProfile.image=UIImage(named:"ic_user")
        }
        else
        {
            imgProfile.image=UIImage(data:profileImageData! as Data,scale:1.0)
        }
        picker .dismiss(animated: true, completion: nil)
    }
    
    // MARK: - Validation Check.
    func checkValidation()->Bool{
        return true
    }
    
    // MARK: - Sign Request
    func signUpRequest(){
        
        
        let objSignupPostModel:SignUpPostModel = SignUpPostModel()
        objSignupPostModel.FirstName = txtFirstName.text
        objSignupPostModel.LastName = txtFirstName.text
        objSignupPostModel.City = txtFirstName.text
        objSignupPostModel.State = txtFirstName.text
        objSignupPostModel.MobileNumber = txtMobile.text
        objSignupPostModel.ProfilePhotoName = ""
        objSignupPostModel.TempProfilePhotoName = self.strProfilePhotoName
        objSignupPostModel.DeviceType = Constant.HttpParameter.DeviceType
        objSignupPostModel.Password = txtPassword.text
        
        if((UserDefaults.standard.object(forKey: "\(Constant.Preference.PrefDeviceToken)") != nil))
        {
            objSignupPostModel.DeviceUDID = Prefrence.preferenceGetString(key: Constant.Preference.PrefDeviceToken)
        } else {
            objSignupPostModel.DeviceUDID = "dsfjhask353453454534hdksjfh"
        }
        
        showActivityIndicator(uiView: self.view)
        let securitydataprovider: SecurityDataProvider = SecurityDataProvider()
        
        switch isEditable {
        case giveEdit():
            //For Edit
            break
            
        case giveNew():
            
            //For New
            break
            
        default: break
        }
        
        
        securitydataprovider.SignUp(signupModel: objSignupPostModel,uiviewController: self, ServiceCallBack:{(result: String?, error: NSError?) -> Void in
            if(result != nil)
            {
                let concurrentQueue = DispatchQueue(label: "queuename", attributes: .concurrent)
                concurrentQueue.sync {
                    let service_Response = Mapper<ServiceResponsewithError<SignUpGetModel<LoginResponse,UserSignup>,Errors>>().map(JSONString: result!)
                    print(service_Response)
                    
                    let homeVC =  MainTabVC(nibName: "MainTabVC", bundle: nil)
                    self.navigationController?.pushViewController(homeVC, animated: true)
                }
            }
            else {
            }
            hiddeActivityIndicator()
            //dismissProgress()
        })
    }
    
    
    // MARK: - Text Field Delegate Methods
    func textFieldShouldReturn(_ textField: UITextField) -> Bool{
        textField.resignFirstResponder()
        return true
    }
    
    // MARK: - File Uploade Methods
    func serviceCallUploadImage(image:UIImage , parameter: [String:String]?){
    //func serviceCallUploadImage(){
        
        imgProfile.alpha = 0.5
        imgProgress.isHidden = false
        imgProgress.progress = 0.0
        
        let objSignupPostModel:SignUpPostModel = SignUpPostModel()
        let securitydataprovider: SecurityDataProvider = SecurityDataProvider()
        
        securitydataprovider.imageUpload(signupModel: objSignupPostModel, uiviewController: self, imageData: UIImageJPEGRepresentation(image, 1.0)!, parameter: parameter) { (result, error) -> Void in
                //code
                if(result != nil)
                {
                    let serviceResponse = Mapper<ServiceResponse<ImageUploadGetModel<FileList>>>().map(JSONString: result!)
                    if(serviceResponse?.Data != nil)
                    {
                        if serviceResponse?.Data?.FileList?.isEmpty != true && (serviceResponse?.Data?.FileList!.count)! > 0 {
                            self.strImageUpload = serviceResponse?.Data?.FileList?[0].FileName
                            self.strProfilePhotoName = (serviceResponse?.Data?.FileList?[0].TempFileName)!
                        }
                    }
                }
                else {
                }
        }
    }
    
    //MARK: Multiple Images Uploading.
    func showImagePicker(){
        
        let vc = BSImagePickerViewController()
        vc.maxNumberOfSelections = 6
        bs_presentImagePickerController(vc, animated: true,
                select: { (asset: PHAsset) -> Void in
                print("Selected: \(asset)")
                    
            }, deselect: { (asset: PHAsset) -> Void in
                print("Deselected: \(asset)")
                
            }, cancel: { (assets: [PHAsset]) -> Void in
                print("Cancel: \(assets)")
                
            }, finish: { (assets: [PHAsset]) -> Void in
                print("Finish: \(assets)")
                
            }, completion: nil)
    }
    
    func getAssetImages(assets:PHAsset){
        //code
    }
    
    //MARK: RequestImage from Image URL
    
    func imageLoad(urlString:String? = "https://chicoshorwich.com/img/14517241531454.jpg"){
        
        let url:URL = URL(string: urlString!)!
        self.imgProfile.af_setImage(withURL: url, placeholderImage: UIImage(named:"ic_user"), filter: nil, progress: { (Progress) in
            //code
            self.imgProgress.isHidden = false
            print(Progress.fractionCompleted)
            self.imgProgress.setProgress(Float(Progress.fractionCompleted), animated: true)
            
        }, imageTransition: UIImageView.ImageTransition.flipFromLeft(0.5), runImageTransitionIfCached: true) { (image) in
            //code
            self.imgProgress.isHidden = true
            self.imgProgress.progress = 0.0
        }
    }
    
    func downloadImage(urlString:String? = "https://chicoshorwich.com/img/14517241531454.jpg"){
        
        let securitydataprovider: SecurityDataProvider = SecurityDataProvider()
        securitydataprovider.downloadImage(url: urlString!, uiviewController: self) { (error, image) -> Void in
            //code
            if(error == nil){
                self.imgProfile.image = image
            }
            else {
                print(error)
            }
        }
    }
    
    
    func setEditData(){
       
        if((RegistrationVC.serviceResponse?.Data?.User) != nil){
            self.txtFirstName.text = RegistrationVC.serviceResponse?.Data?.User?.FirstName
            self.txtLastName.text = RegistrationVC.serviceResponse?.Data?.User?.LastName
            self.txtCity.text = RegistrationVC.serviceResponse?.Data?.User?.City
            self.txtState.text = RegistrationVC.serviceResponse?.Data?.User?.State
            self.txtMobile.text = RegistrationVC.serviceResponse?.Data?.User?.MobileNumber
            self.imageLoad(urlString: (RegistrationVC.serviceResponse?.Data?.User?.ProfileUrl)!)
        }
    }
    
}
