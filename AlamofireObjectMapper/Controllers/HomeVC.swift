//
//  HomeVC.swift
//  SignUp
//
//  Created by JADAV MEHUL on 06/12/16.
//

import UIKit

class HomeVC: UIViewController {

    @IBOutlet weak var contentView: UIView!
    @IBOutlet var onClick: [UIButton]!
    // declare All Objects
    var feedlistVC: FeedListVC!
    var secondVC: SecondVC!
    var thirdVC: ThirdVC!
    
    var viewControllers: [UIViewController]!
    var selectedIndex: Int = 0
    var vc: UIViewController!
    
    override func viewDidLoad() {
        
        feedlistVC          = FeedListVC(nibName:"FeedListVC", bundle: nil)
        secondVC            = SecondVC(nibName:"SecondVC", bundle: nil)
        thirdVC             = ThirdVC(nibName:"ThirdVC", bundle: nil)
        
        feedlistVC.view.frame       = self.contentView.bounds;
        secondVC.view.frame         = self.contentView.bounds;
        thirdVC.view.frame          = self.contentView.bounds;
        
        viewControllers = [feedlistVC,secondVC,thirdVC]
        onClick[selectedIndex].isSelected = true
        didPressButton(sender: onClick[selectedIndex])
        
        tabVC()
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        addChildViewController(vc)
        super.viewWillAppear(animated)
    }

    @IBAction func didPressButton(sender: UIButton) {
    
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        
        let previousIndex = selectedIndex
        selectedIndex = sender.tag
        
        onClick[previousIndex].isSelected = false
        let previousVC = viewControllers[previousIndex]
        previousVC.willMove(toParentViewController: nil)
        previousVC.view.removeFromSuperview()
        previousVC.removeFromParentViewController()
        
        sender.isSelected = true;
        vc = viewControllers[selectedIndex]
        vc.view.frame = self.contentView.bounds;
        contentView.addSubview(vc.view)
        
    }
    
    //MARK: UITabBarViewController
    func tabVC(){
        let tabBarController = UITabBarController()
        let myVC1 = FeedListVC(nibName: "FeedListVC", bundle: nil)
        let myVC2 = SecondVC(nibName: "SecondVC", bundle: nil)
        let controllers = [myVC1,myVC2]
        tabBarController.viewControllers = controllers
        appDelegate.window?.rootViewController = tabBarController
        let firstImage = UIImage(named: "1tab")
        let secondImage = UIImage(named: "2tab")
        myVC1.tabBarItem = UITabBarItem(
            title: "First",
            image: firstImage,
            tag: 1)
        myVC2.tabBarItem = UITabBarItem(
            title: "Second",
            image: secondImage,
            tag:2)
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
