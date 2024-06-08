//
//  SettingViewController.swift
//  damagochi
//
//  Created by 강한결 on 6/8/24.
//

import UIKit
import SnapKit

class SettingViewController: UIViewController {
    
    let settingTable = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()

        configureView()
        configureNav()
        configureTable()
    }

}

extension SettingViewController {
    // navigation & view
    private func configureNav() {
        title = Constants.settingTitle
        navigationItem.setLeftBarButton(UIBarButtonItem(image: UIImage(systemName: Icons.goBack.rawValue), style: .plain, target: self, action: #selector(goBack)), animated: true)
        navigationItem.leftBarButtonItem?.tintColor = UIColor._appSystemFontColor
    }

    private func configureView() {
        view.backgroundColor = UIColor._appBackGroundColor
        view.addSubview(settingTable)
        
        settingTable.snp.makeConstraints { t in
            t.edges.equalToSuperview()
        }
    }
      
    @objc func goBack() {
        navigationController?.popViewController(animated: true)
    }
}

extension SettingViewController: UITableViewDelegate, UITableViewDataSource {
    func configureTable() {
        settingTable.delegate = self
        settingTable.dataSource = self
        settingTable.register(SettingCell.self, forCellReuseIdentifier: SettingCell.identifier)
        settingTable.rowHeight = 60
        settingTable.separatorColor = UIColor._appSystemFontColor
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return SettingList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = settingTable.dequeueReusableCell(withIdentifier: SettingCell.identifier, for: indexPath) as! SettingCell
        
        cell.setData(SettingList[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            goToUpdateUserNameView()
        } else if indexPath.row == 1 {
            goToDamagochiSelectView()
        } else {
            showAlert()
        }
    }
}

extension SettingViewController {
    func showAlert() {
        let alert = UIAlertController(title: Constants.resetAlertTitle, message: Constants.resetAlertMessage, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "아니!", style: .cancel))
        alert.addAction(UIAlertAction(title: "웅", style: .default, handler: { action in
            UserDefaultsHelper.resetUserData()
            self.navigationController?.pushViewController(ViewController(), animated: false)
        }))
        present(alert, animated: true)
    }
    
    func goToDamagochiSelectView() {
        navigationController?.pushViewController(ViewController(), animated: true)
    }
    
    func goToUpdateUserNameView() {
        navigationController?.pushViewController(Setting_ChangeNameViewController(), animated: true)
    }
}
