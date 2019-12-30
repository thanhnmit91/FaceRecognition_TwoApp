//
//  ListUserViewModel.swift
//  FaceRecognition
//
//  Created by administrator on 11/26/19.
//  Copyright © 2019 Vision. All rights reserved.
//

import UIKit

class ListUserViewModel: NSObject {
    lazy var identifierCell = "UserTableViewCell"
    var selectItemUser: ((IndexPath) -> ())?
}

extension ListUserViewModel: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selectItemUser?(indexPath)
    }
}

extension ListUserViewModel: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifierCell, for: indexPath) as! UserTableViewCell
        cell.textLabel?.text = "\(getModelLanguage?.user ?? "") \(indexPath.row + 1)"
        return cell
    }
    

    
    
}
