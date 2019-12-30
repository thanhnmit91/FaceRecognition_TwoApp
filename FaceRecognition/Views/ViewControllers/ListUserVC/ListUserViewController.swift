//
//  ListUserViewController.swift
//  FaceRecognition
//
//  Created by administrator on 11/25/19.
//  Copyright © 2019 Vision. All rights reserved.
//

import UIKit

class ListUserViewController: BaseViewController {

    @IBOutlet weak var tbView: UITableView!
    lazy var viewModel = ListUserViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.navigationItem.title = getModelLanguage?.list_user
        
        tbView.registerCell(viewModel.identifierCell)
        tbView.delegate = viewModel
        tbView.dataSource = viewModel
        viewModel.selectItemUser = { [weak self] (indexP) in
            self?.navigationController?.pushViewController(RegisterFaceViewController(), animated: true)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = false
    }

}
