//
//  DamagochiDetailViewController.swift
//  damagochi
//
//  Created by 강한결 on 6/7/24.
//

import UIKit

class DamagochiDetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor._appBackGroundColor
        navigationItem.title = "asdfasd"
        navigationItem.setLeftBarButton(UIBarButtonItem(image: UIImage(systemName: Icons.goBack.rawValue), style: .plain, target: self, action: #selector(goBack)), animated: true)
        navigationItem.leftBarButtonItem?.tintColor = UIColor._appSystemFontColor
        
        navigationItem.setRightBarButton(UIBarButtonItem(image: UIImage(systemName: Icons.userIcon.rawValue), style: .plain, target: self, action: #selector(goBack)), animated: true)
        navigationItem.rightBarButtonItem?.tintColor = UIColor._appSystemFontColor
    }


    @objc func goBack() {
        dismiss(animated: false)
    }
}
