//
//  FeedListVC.swift
//  SignUp
//
//  Created by JADAV MEHUL on 06/12/16.
//

import UIKit

class FeedListVC: UIViewController {

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
    
    @IBAction func btnEditProfile(_ sender: AnyObject) {
        
        let objSignUp = RegistrationVC(nibName:"RegistrationVC",bundle: nil)
        objSignUp.isEditable = objSignUp.giveEdit()
        self.navigationController?.pushViewController(objSignUp, animated: true)
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
