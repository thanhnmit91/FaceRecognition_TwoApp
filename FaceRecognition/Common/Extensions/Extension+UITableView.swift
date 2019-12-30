//
//  Extension+UITableView.swift
//  FaceRecognition
//
//  Created by administrator on 11/26/19.
//  Copyright © 2019 Vision. All rights reserved.
//

import UIKit

extension UITableView {

    func registerCell(_ identifier: String){
        
        self.register(UINib(nibName: identifier, bundle: nil), forCellReuseIdentifier: identifier)
        
    }
    
}
