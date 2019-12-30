//
//  ServiceManager.swift
//  FaceRecognition
//
//  Created by administrator on 11/25/19.
//  Copyright © 2019 Vision. All rights reserved.
//

import UIKit
import Alamofire


var services = ServiceManager.sharedInstance
class ServiceManager: NSObject {
    static let sharedInstance = ServiceManager()
    
    func requestAPI(){
        
    }
    
    func uploadForAPI(imageData: Data, param: NSDictionary, addLink: String = "tab=reg&", success: @escaping((Dictionary<String, Any>)->Void), failure: @escaping((Error)->Void))
    {
        let url = ServiceConfig.hostAPI + "/aws/api?" + addLink + "\(param.convertDicToString())"
        Alamofire.upload(multipartFormData: { (multipartFormData) in
                        multipartFormData.append(imageData, withName: "webcam", fileName: "image.png", mimeType: "image/png")
        }, to: NSURL(string: url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!)! as URL)
            { (result) in
                switch result {
                case .success(let upload, _, _):
                    upload.responseJSON { response in
                        print(response.result.value ?? "")
                        if let dic = response.result.value as? Dictionary<String, Any>{
                            success(dic)
                        }else{
                            failure(response.error!)
                        }
                    }
                    break
                   //Success
                case .failure(let encodingError):
                    failure(encodingError)
                    print(encodingError)
                    break
                    //Failure
                }
            }
    }
    
    func convertDicToString(dic: NSDictionary){
        
        if let theJSONData = try?  JSONSerialization.data(
            withJSONObject: dic,
            options: .prettyPrinted
            ),
            let theJSONText = String(data: theJSONData,
                                     encoding: String.Encoding.ascii) {
                print("JSON string = \n\(theJSONText)")
          }
        
    }
    
}
