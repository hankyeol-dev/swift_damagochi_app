//
//  Setting-ChangeNameViewController.swift
//  damagochi
//
//  Created by 강한결 on 6/8/24.
//

import UIKit
import SnapKit

class Setting_ChangeNameViewController: UIViewController {
    var userName = ""
    let userNameField = UITextField()

    override func viewDidLoad() {
        super.viewDidLoad()

        configureNav()
        configureView()
    }

    func configureNav() {
        userName = UserDefaultsHelper.getUserName()
        navigationItem.setRightBarButton(UIBarButtonItem(title: Constants.settingUsernameSave, style: .plain, target: self, action: #selector(updateAndSaveUserName)), animated: true)
        title = "\(userName)님 이름 정하기"
    }
    
    func configureView() {
        view.backgroundColor = UIColor._appBackGroundColor
        view.addSubview(userNameField)
        
        userNameField.snp.makeConstraints { f in
            f.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(16)
            f.top.equalTo(view.safeAreaLayoutGuide).inset(40)
            f.height.equalTo(60)
        }
        
        userNameField.delegate = self
        
        userNameField.text = userName
        userNameField.tintColor = UIColor._appSystemFontColor
        userNameField.textColor = UIColor._appSystemFontColor
        userNameField.font = UIFont._appSystemFontM
        userNameField.layer.borderColor = UIColor._appSystemFontColor.cgColor
        userNameField.layer.borderWidth = 1
    }
    
    @objc func updateAndSaveUserName() {
        view.endEditing(true)
        guard let text = userNameField.text else { return }
        
        if !text.isEmpty {
            UserDefaultsHelper.updateUserName(text)
        }
        viewDidLoad()
    }
}

extension Setting_ChangeNameViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let text = userNameField.text else { return false}
        guard text.count < 6 && text.count > 1 else { return false }
        return true
    }
}
