//
//  Extension+UIViewController.swift
//  FaceRecognition
//
//  Created by administrator on 11/26/19.
//  Copyright © 2019 Vision. All rights reserved.
//

import UIKit

extension UIViewController {
    
    var isModal: Bool {
        
        if let navigationController = self.navigationController{
            if navigationController.viewControllers.first != self{
                return false
            }
        }
        if self.presentingViewController != nil {
            return true
        }

        if self.navigationController?.presentingViewController?.presentedViewController == self.navigationController  {
            return true
        }

        if self.tabBarController?.presentingViewController is UITabBarController {
            return true
        }
        return false
    }
}
