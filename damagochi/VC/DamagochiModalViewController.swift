//
//  MainViewController.swift
//  damagochi
//
//  Created by 강한결 on 6/7/24.
//

import UIKit
import SnapKit

class DamagochiModalViewController: UIViewController {
    let backgroundView = UIView()
    
    let modalView = UIView()
    let modalImage = UIImageView()
    let modalName = UILabel()
    let modalDivider = UILabel()
    let modalButtonDivider = UILabel()
    let modalDescription = UILabel()
    let modalButtonStack = UIStackView()
    let modalCancelButton = UIButton()
    let modalStartButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureBackView()
        configureModalView()
    }
    
    
}

extension DamagochiModalViewController {
    
    func configureBackView() {
        
        self.view.addSubview(backgroundView)
        
        backgroundView.backgroundColor = .black.withAlphaComponent(0.5)
        backgroundView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(dismissModal)))
        
        backgroundView.snp.makeConstraints { v in
            v.edges.equalTo(view)
        }
    }
    
    func configureModalView() {
        // add subview
        self.backgroundView.addSubview(modalView)
        [modalImage, modalName, modalDivider, modalDescription, modalButtonStack, modalButtonDivider].forEach {
            modalView.addSubview($0)
        }
        [modalCancelButton, modalStartButton].forEach {
            modalButtonStack.addArrangedSubview($0)
        }
        
        // set layout
        modalView.snp.makeConstraints { v in
            v.horizontalEdges.equalTo(backgroundView.safeAreaLayoutGuide).inset(32)
            v.verticalEdges.equalTo(backgroundView.safeAreaLayoutGuide).inset(112)
        }
        modalImage.snp.makeConstraints { i in
            i.top.horizontalEdges.equalToSuperview().inset(64)
            i.centerX.equalToSuperview()
        }
        modalName.snp.makeConstraints { n in
            n.top.equalTo(modalImage.snp.bottom).offset(16)
            n.horizontalEdges.equalToSuperview().inset(64)
            n.height.equalTo(28)
        }
        modalDivider.snp.makeConstraints { d in
            d.top.equalTo(modalName.snp.bottom).offset(32)
            d.horizontalEdges.equalToSuperview().inset(32)
            d.height.equalTo(1)
        }
        modalDescription.snp.makeConstraints { d in
            d.top.equalTo(modalDivider.snp.bottom).offset(32)
            d.horizontalEdges.equalToSuperview().inset(32)
        }
        modalButtonDivider.snp.makeConstraints { d in
            d.bottom.equalToSuperview().inset(60)
            d.horizontalEdges.equalToSuperview()
            d.height.equalTo(1)
        }
        modalButtonStack.snp.makeConstraints { s in
            s.bottom.horizontalEdges.equalToSuperview()
            s.height.equalTo(60)
        }
        modalCancelButton.snp.makeConstraints { b in
            b.top.bottom.leading.equalToSuperview()
        }
        modalStartButton.snp.makeConstraints { b in
            b.top.bottom.trailing.equalToSuperview()
        }
        
        
        // set ui
        modalView.backgroundColor = UIColor._appBackGroundColor
        modalView.layer.cornerRadius = 12
        
        modalImage.image = UIImage(named: "1-1")
        modalImage.contentMode = .scaleAspectFit
        
        modalName.text = ""
        modalName.textAlignment = .center
        modalName.font = UIFont._appSystemFontM
        modalName.layer.borderColor = UIColor._appSystemFontColor.cgColor
        modalName.layer.borderWidth = 1
        modalName.layer.cornerRadius = 6
        
        modalDivider.layer.borderWidth = 1
        modalDivider.layer.borderColor = UIColor._appSystemFontColor.cgColor
        
        modalButtonDivider.layer.borderWidth = 1
        modalButtonDivider.layer.borderColor = UIColor._appSystemFontColor.cgColor
        
        modalDescription.numberOfLines = 0
        modalDescription.text = "저는 방실방실 다마고치입니당 키는 100km\n 몸무게는 150톤이에용\n 성격은 화끈하고 날라다닙니당~!\n 열심히 잘 먹고 잘 클 자신은\n 있답니당 방실방실!"
        modalDescription.textAlignment = .center
        modalDescription.font = UIFont._appSystemFontM
        modalDescription.textColor = UIColor._appSystemFontColor
        
        modalButtonStack.axis = .horizontal
        modalButtonStack.spacing = 0
        modalButtonStack.distribution = .fillEqually
        
        modalCancelButton.setTitle(Constants.cancelButtonTitle, for: .normal)
        modalCancelButton.setTitleColor(UIColor._appBackGroundColor, for: .normal)
        modalCancelButton.titleLabel?.font = UIFont._appSystemBoldFontM
        modalCancelButton.backgroundColor = UIColor._appSystemFontColor
        modalCancelButton.layer.cornerRadius = 12
        modalCancelButton.layer.maskedCorners = CACornerMask(arrayLiteral: .layerMinXMaxYCorner)
        modalCancelButton.addTarget(self, action: #selector(dismissModal), for: .touchUpInside)
        
        modalStartButton.setTitle(Constants.startButtonTitle, for: .normal)
        modalStartButton.setTitleColor(UIColor._appSystemFontColor, for: .normal)
        modalStartButton.titleLabel?.font = UIFont._appSystemBoldFontM
        modalStartButton.layer.cornerRadius = 12
        modalStartButton.layer.maskedCorners = CACornerMask(arrayLiteral: .layerMaxXMaxYCorner)
        modalStartButton.addTarget(self, action: #selector(goThatDetailPage), for: .touchUpInside)
    }
    
    @objc func dismissModal() {
        dismiss(animated: false)
    }
    
    @objc func goThatDetailPage() {
        let vc = DamagochiDetailViewController()
        let navc = UINavigationController(rootViewController: vc)
        navc.modalPresentationStyle = .fullScreen
        
        present(navc, animated: false)
    }
}
