//
//  RegisterFaceViewController.swift
//  FaceRecognition
//
//  Created by administrator on 11/25/19.
//  Copyright © 2019 Vision. All rights reserved.
//

import UIKit
import Alamofire

class RegisterFaceViewController: BaseViewController {

    @IBOutlet weak var imgFace: UIImageView!
    @IBOutlet weak var txtFullName: UITextField!
    @IBOutlet weak var viewLoading: UIView!
    
    var imagePicker: ImagePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            self.imagePicker = ImagePicker(presentationController: self, delegate: self)
            self.imagePicker.present(from: self.view, typePicker: 2)
        }
    }
    
    @IBAction func btnRegisterClicked(_ sender: Any) {
        if self.txtFullName.text!.count <= 0 {
            self.alertVC(message: "Please input full name")
            return
        }
        self.registerFaceServer()
    }
    
    func registerFaceServer() {
        self.viewLoading.isHidden = false
        self.view.endEditing(true)
        let aspectScaledToFitImage = self.imgFace.image?.scaled(with: 1.0)
        let imageData : Data! = aspectScaledToFitImage!.jpegData(compressionQuality: 1.0)
        let dicparam = UploadImageModel()
        dicparam.fullname = txtFullName.text ?? ""
        services.uploadForAPI(imageData: imageData, param: dicparam.toDictionary() as NSDictionary, success: { [weak self] (dic) in
            self?.viewLoading.isHidden = true
            self?.alertVC(message: ((dic["status"] as? String ?? "") == "registerface_done") ? "Register success" : "Register fail") { (alert) in
                self?.imagePicker.present(from: self!.view, typePicker: self!.imagePicker.isTypeCamera ? 0 : 1)
            }
        }) { [weak self] (error) in
            self?.alertVC(message: error.localizedDescription) { (alert) in
                self?.imagePicker.present(from: self!.view, typePicker: self!.imagePicker.isTypeCamera ? 0 : 1)
            }
            self?.viewLoading.isHidden = true
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
}


extension RegisterFaceViewController: ImagePickerDelegate{
    
    func didSelect(image: UIImage?) {
        self.imgFace.image = image
    }
    
}
