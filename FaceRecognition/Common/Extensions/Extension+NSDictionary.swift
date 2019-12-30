//
//  Extension+NSDictionary.swift
//  FaceRecognition
//
//  Created by administrator on 11/26/19.
//  Copyright © 2019 Vision. All rights reserved.
//

import UIKit

extension NSDictionary{

    public func convertDicToString() -> String{
        let resultString = (self.compactMap({ (key, value) -> String in
            return "\(key)=\(value)"
        }) as Array).joined(separator: ",")

        return resultString
        
    }
    
}
