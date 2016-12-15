//
//  ActivityIndicator.swift
//  SignUp
//
//  Created by JADAV MEHUL on 06/12/16.
//

import Foundation
import UIKit

var container: UIView = UIView()
var loadingView: UIView = UIView()

var activityIndicator: UIActivityIndicatorView!

func showActivityIndicator(uiView: UIView) {
    
    if activityIndicator != nil && activityIndicator.isAnimating == true {
        hiddeActivityIndicator()
    }
    activityIndicator = UIActivityIndicatorView(frame: CGRect(x:0.0, y:0.0, width:100.0, height:100.0))
    activityIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.gray
    activityIndicator.center = CGPoint(x:uiView.frame.size.width / 2, y:uiView.frame.size.height / 2);
    activityIndicator.hidesWhenStopped = true
    uiView.addSubview(activityIndicator)
    activityIndicator.startAnimating()
    uiView.bringSubview(toFront: activityIndicator)
}

func hiddeActivityIndicator() {
    if((activityIndicator) != nil){
        activityIndicator.isHidden = true
        activityIndicator.removeFromSuperview()
    }
    print("Hidde Activity Indicator.")
}

// MARK: Extra Activity Indigator
func showProgress(uiView: UIView) {
    
    container.frame = uiView.frame
    container.center = uiView.center
    container.backgroundColor = UIColorFromHex(rgbValue: 0xffffff, alpha: 0.3)
    
    loadingView.frame = CGRect(x:0, y:0, width:80, height:80)
    loadingView.center = uiView.center
    loadingView.backgroundColor = UIColorFromHex(rgbValue: 0xccebff, alpha: 0.7)
    loadingView.clipsToBounds = true
    loadingView.layer.cornerRadius = 10
    
    if activityIndicator != nil && activityIndicator.isAnimating == true {
        dismissProgress()
    }
    activityIndicator = UIActivityIndicatorView(frame: CGRect(x:0.0, y:0.0, width:40.0, height:40.0))
    activityIndicator.frame = CGRect(x: 0.0, y: 0.0, width: 40.0, height: 40.0)
    activityIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.gray
    activityIndicator.center = CGPoint(x:loadingView.frame.size.width / 2, y:loadingView.frame.size.height / 2);
    activityIndicator.color = UIColor.yellow    //UIColorFromHex(rgbValue: 0x001f33, alpha: 1)
    activityIndicator.hidesWhenStopped = true
    
    loadingView.addSubview(activityIndicator)
    container.addSubview(loadingView)
    uiView.addSubview(container)
    activityIndicator.startAnimating()
}

/*
 Hide activity indicator
 Actually remove activity indicator from its super view
 @param uiView - remove activity indicator from this view
 */
func dismissProgress() {
    activityIndicator.stopAnimating()
    container.removeFromSuperview()
}

/*
 Define UIColor from hex value
 @param rgbValue - hex color value
 @param alpha - transparency level
 */
func UIColorFromHex(rgbValue:UInt32, alpha:Double=1.0)->UIColor {
    let red = CGFloat((rgbValue & 0xFF0000) >> 16)/256.0
    let green = CGFloat((rgbValue & 0xFF00) >> 8)/256.0
    let blue = CGFloat(rgbValue & 0xFF)/256.0
    return UIColor(red:red, green:green, blue:blue, alpha:CGFloat(alpha))
}

