//
//  BaseViewController.swift
//  FaceRecognition
//
//  Created by administrator on 11/25/19.
//  Copyright © 2019 Vision. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.cusNavigation()
    }
    
    func cusNavigation(){
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "ic_back"), style: .done, target: self, action: #selector(self.actBack))
        //        self.navigationController?.navigationBar.barStyle = UIBarStyle.black
                self.navigationController?.navigationBar.tintColor = UIColor.black
        self.navigationController?.interactivePopGestureRecognizer?.delegate = self
    }
    
    @objc func actBack(){
        
        if self.isModal{
            self.dismiss(animated: true, completion: nil)
            return
        }
        self.navigationController?.popViewController(animated: true)
    }

    func alertVC(message: String = "Register success", actTitle: String = "OK", handler: ((UIAlertAction) -> Void)? = nil){
        let alert = UIAlertController(title: "", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: actTitle, style: .default, handler: { (alert) in
            handler?(alert)
        }))
        self.present(alert, animated: true, completion: nil)
    }

}

extension BaseViewController: UIGestureRecognizerDelegate{
    
    
    
}
