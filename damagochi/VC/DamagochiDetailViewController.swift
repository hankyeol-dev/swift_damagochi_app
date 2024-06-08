//
//  DamagochiDetailViewController.swift
//  damagochi
//
//  Created by 강한결 on 6/7/24.
//

import UIKit
import SnapKit

class DamagochiDetailViewController: UIViewController {
    var damagochiId: Int = 1
    var userName: String?
    var data: Damagochi?
    
    let mainView = UIView()
    let talkBox = UIImageView()
    let talkLabel = UILabel()
    
    let damagochiImage = UIImageView()
    let damagochiName = UILabel()
    let damagochiState = UILabel()
    
    let damagochiControlStack = UIStackView()
    
    let controlBox = UIView()
    let leafTexfield = UITextField()
    let leafButton = UIButton()
    
    let controlBox2 = UIView()
    let dropTextField = UITextField()
    let dropButton = UIButton()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureNavigation()
        configureMainView()
        configureUI()
        configureLeaf()
        configureDrop()
    }
    
}

extension DamagochiDetailViewController {
    // configure
    private func configureNavigation() {
        view.backgroundColor = UIColor._appBackGroundColor
        navigationItem.setRightBarButton(UIBarButtonItem(image: UIImage(systemName: Icons.userIcon.rawValue), style: .plain, target: self, action: #selector(goSetting)), animated: true)
        navigationItem.rightBarButtonItem?.tintColor = UIColor._appSystemFontColor
    }
    
    private func configureMainView() {
        // add subview
        view.addSubview(mainView)
        [talkBox, damagochiImage, damagochiName, damagochiState, damagochiControlStack].forEach {
            mainView.addSubview($0)
        }
        talkBox.addSubview(talkLabel)
        
        // layout
        mainView.snp.makeConstraints { v in
            v.verticalEdges.equalTo(view.safeAreaLayoutGuide).inset(24)
            v.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(48)
        }
        
        talkBox.snp.makeConstraints { b in
            b.top.horizontalEdges.equalToSuperview()
        }
        
        talkLabel.snp.makeConstraints { t in
            t.edges.equalToSuperview().inset(24)
        }
        
        damagochiImage.snp.makeConstraints { i in
            i.top.equalTo(talkBox.snp.bottom).offset(64)
            i.horizontalEdges.equalToSuperview().inset(24)
        }
        
        damagochiName.snp.makeConstraints { n in
            n.top.equalTo(damagochiImage.snp.bottom).offset(56)
            n.horizontalEdges.equalToSuperview().inset(48)
            n.height.equalTo(24)
        }
        
        damagochiState.snp.makeConstraints { s in
            s.top.equalTo(damagochiName.snp.bottom).offset(12)
            s.horizontalEdges.equalToSuperview()
        }
        
        damagochiControlStack.snp.makeConstraints { stack in
            stack.top.equalTo(damagochiState.snp.bottom).offset(24)
            stack.horizontalEdges.equalToSuperview()
        }
        
    }
    
    private func configureUI() {
        if let data {
            
            talkBox.image = UIImage(named: "bubble")
            
            talkLabel.numberOfLines = 0
            talkLabel.text = "dacasldcjlasdmvlasdhclamcasdlgjaslvjalsdkf"
            talkLabel.textAlignment = .center
            talkLabel.textColor = UIColor._appSystemFontColor
            talkLabel.font = UIFont._appSystemFontL
            
            damagochiImage.image = UIImage(named: data.getDamagochiImage)
            damagochiImage.contentMode = .scaleAspectFill
            
            damagochiName.text = data.name
            damagochiName.textAlignment = .center
            damagochiName.font = UIFont._appSystemFontM
            damagochiName.layer.borderColor = UIColor._appSystemFontColor.cgColor
            damagochiName.layer.borderWidth = 1
            damagochiName.layer.cornerRadius = 8
            
            damagochiState.text = "LV\(data.calcLV) • 밥알 \(data.leaf)개 • 물방울 \(data.drop)개"
            damagochiState.textAlignment = .center
            damagochiState.textColor = UIColor._appSystemFontColor
            damagochiState.font = UIFont._appSystemBoldFontS
            
            damagochiControlStack.axis = .vertical
            damagochiControlStack.spacing = 16
            damagochiControlStack.distribution = .equalSpacing
        }
    }
    
    
}

extension DamagochiDetailViewController {
    
    private func configureLeaf() {
        damagochiControlStack.addArrangedSubview(controlBox)
        controlBox.addSubview(leafTexfield)
        controlBox.addSubview(leafButton)
        
        controlBox.snp.makeConstraints { b in
            b.horizontalEdges.equalToSuperview().inset(16)
            b.height.equalTo(44)
        }
        
        leafTexfield.snp.makeConstraints { f in
            f.leading.verticalEdges.equalToSuperview()
            f.trailing.equalTo(leafButton.snp.leading).offset(-8)
        }
        leafButton.snp.makeConstraints { b in
            b.trailing.verticalEdges.equalToSuperview()
            b.width.equalTo(70)
        }
        
        leafTexfield._setEatingField(" 밥주세용")
        leafButton._setEatingButton(" 밥주기")
    }
    private func configureDrop() {
        damagochiControlStack.addArrangedSubview(controlBox2)
        controlBox2.addSubview(dropTextField)
        controlBox2.addSubview(dropButton)
        
        controlBox2.snp.makeConstraints { b in
            b.horizontalEdges.equalToSuperview().inset(16)
            b.height.equalTo(44)
        }
        
        dropTextField.snp.makeConstraints { f in
            f.leading.verticalEdges.equalToSuperview()
            f.trailing.equalTo(dropButton.snp.leading).offset(-8)
        }
        dropButton.snp.makeConstraints { b in
            b.trailing.verticalEdges.equalToSuperview()
            b.width.equalTo(70)
        }
        
        dropTextField._setEatingField(" 물주세용")
        dropButton._setEatingButton(" 물주기")
    }
}

extension DamagochiDetailViewController {
    // action
    @objc private func goSetting() {
        let vc = SettingViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func setData(name: String, pageData: Damagochi) {
        userName = name
        data = pageData
        if let userName {
            navigationItem.title = "\(userName)님의 다마고치"
        }
    }
}
