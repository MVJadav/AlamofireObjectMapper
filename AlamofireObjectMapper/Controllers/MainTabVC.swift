//
//  MainTabVC.swift
//  SignUp
//
//  Created by JADAV MEHUL on 06/12/16.
//

import UIKit

class MainTabVC: UITabBarController {

    override func viewDidLoad() {
        setTabBar()
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        super.viewWillAppear(animated)
    }
    
    //MARK: UITabBarViewController
    
    func setTabBar(index :Int = 0){
        
        UITabBar.appearance().isTranslucent = false
        UITabBar.appearance().barTintColor = UIColor.white
        
        UITabBar.appearance().tintColor = Constant.Color.AppTheme
        UITabBarItem.appearance().setTitleTextAttributes([NSForegroundColorAttributeName: UIColor.white], for: .normal)
        UITabBarItem.appearance().setTitleTextAttributes([NSForegroundColorAttributeName: Constant.Color.TabbarSelected], for: .selected)
        let tabBarController = UITabBarController()
        
//        UITabBarItem.appearance().setTitleTextAttributes([NSFontAttributeName: UIFont(name: "HelveticaNeueLTStd-Roman", size: 10.0)!, NSForegroundColorAttributeName: Constant.Color.AppTheme], for: .selected)
//        UITabBarItem.appearance().setTitleTextAttributes([NSFontAttributeName: UIFont(name: "HelveticaNeueLTStd-Roman", size: 10.0)!, NSForegroundColorAttributeName: UIColor.lightGray], for: .normal)
        
        let controller1 = FeedListVC()
        controller1.tabBarItem = UITabBarItem(title: "First",image: UIImage(named: "1tab")?.withRenderingMode(UIImageRenderingMode.alwaysOriginal),selectedImage:UIImage(named: "1tab")?.withRenderingMode(UIImageRenderingMode.alwaysOriginal))
        controller1.tabBarItem.tag = 1
        
        let controller2 = SecondVC()
        controller2.tabBarItem = UITabBarItem(title: "Second",image: UIImage(named: "2tab")?.withRenderingMode(UIImageRenderingMode.alwaysOriginal),selectedImage:UIImage(named: "2tab")?.withRenderingMode(UIImageRenderingMode.alwaysOriginal))
        controller1.tabBarItem.tag = 2
        
        let controller3 = ThirdVC()
        controller3.tabBarItem = UITabBarItem(title: "Third",image: UIImage(named: "3tab")?.withRenderingMode(UIImageRenderingMode.alwaysOriginal),selectedImage:UIImage(named: "2tab")?.withRenderingMode(UIImageRenderingMode.alwaysOriginal))
        controller3.tabBarItem.tag = 3
        
        
        
//        let navVC1 = UINavigationController(rootViewController: controller1)
//        let navVC2 = UINavigationController(rootViewController: controller2)
//        let navVC3 = UINavigationController(rootViewController: controller3)
        
        let navVC1 :UINavigationController = UINavigationController(rootViewController: controller1)
        navVC1.navigationBar.barTintColor = Constant.Color.AppTheme
        navVC1.navigationBar.tintColor = UIColor.white
        navVC1.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName : UIColor.white]
        
        let navVC2 :UINavigationController = UINavigationController(rootViewController: controller2)
        navVC2.navigationBar.barTintColor = Constant.Color.AppTheme
        navVC2.navigationBar.tintColor = UIColor.white
        navVC2.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName : UIColor.white]
        
        let navVC3 :UINavigationController = UINavigationController(rootViewController: controller3)
        navVC3.navigationBar.barTintColor = Constant.Color.AppTheme
        navVC3.navigationBar.tintColor = UIColor.white
        navVC3.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName : UIColor.white]
        
        tabBarController.viewControllers = [navVC1, navVC2, navVC3]
        tabBarController.hidesBottomBarWhenPushed = true
        tabBarController.selectedIndex = index
        UIView.transition(from: (appDelegate.window?.rootViewController!.view!)!, to: tabBarController.view!, duration: 0.65, options:.transitionFlipFromLeft, completion: {(finished: Bool) -> Void in
            appDelegate.window?.rootViewController = tabBarController
        })
        appDelegate.window?.makeKeyAndVisible()
    }
    
    // MARK: - Setups
    
    func setupMiddleButton() {
        let menuButton = UIButton(frame: CGRect(x: 0, y: 0, width: 64, height: 64))
        
        var menuButtonFrame = menuButton.frame
        menuButtonFrame.origin.y = view.bounds.height - menuButtonFrame.height
        menuButtonFrame.origin.x = view.bounds.width/2 - menuButtonFrame.size.width/2
        menuButton.frame = menuButtonFrame
        
        menuButton.backgroundColor = UIColor.red
        menuButton.layer.cornerRadius = menuButtonFrame.height/2
        view.addSubview(menuButton)
        
        menuButton.setImage(UIImage(named: "example"), for: .normal)
        menuButton.addTarget(self, action: #selector(menuButtonAction(sender:)), for: .touchUpInside)
        
        view.layoutIfNeeded()
    }
    
    // MARK: - Actions
    @objc private func menuButtonAction(sender: UIButton) {
        selectedIndex = 2
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
