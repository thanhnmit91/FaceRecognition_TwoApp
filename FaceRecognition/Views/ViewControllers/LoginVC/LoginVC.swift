//
//  LoginVC.swift
//  FaceRecognition
//
//  Created by administrator on 11/25/19.
//  Copyright © 2019 Vision. All rights reserved.
//

import UIKit

class LoginVC: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        print(getWifiInfo())
        
        //[FaceRecognition.WifiInfo(interface: "en0", ssid: "ciscosb1", bssid: "bc:67:1c:41:b8:9c")] 6s
        //[FaceRecognition.WifiInfo(interface: "en0", ssid: "Vision_Guest", bssid: "d4:6e:e:92:37:10")] 5s
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
    }

    @IBAction func actLogin(_ sender: Any) {
        GetLanguageModel.language = GetLanguageModel.language == "en" ? "ja" : "en"
        getModelLanguage = GetLanguageModel.parseDic()
        
        #if FaceRegister
        let nav = UINavigationController(rootViewController: ListUserViewController())
        self.present(nav, animated: true, completion: nil)
        #elseif FaceLock
        let nav = UINavigationController(rootViewController: CheckFaceOpenLockVC())
        self.present(nav, animated: true, completion: nil)
        #endif
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
