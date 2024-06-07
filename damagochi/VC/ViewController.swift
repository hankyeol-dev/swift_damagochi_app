//
//  ViewController.swift
//  damagochi
//
//  Created by 강한결 on 6/7/24.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    let titleView = UIView()
    let titleLabel = UILabel()
    let damagochiCollection = {
        let layout = UICollectionViewFlowLayout()
        let width = UIScreen.main.bounds.width / 3 - 20
        layout.itemSize = CGSize(width: width, height: width + 16)
        
        let v = UICollectionView(frame: .zero, collectionViewLayout: layout)
        v.contentInset = UIEdgeInsets(top: 4, left: 4, bottom: 4, right: 4)
        v.backgroundColor = UIColor._appBackGroundColor
        return v
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor._appBackGroundColor
        configureTitleView()
        configureDamagochiCollectionView()
    }
    
    func configureTitleView() {
        // add subview
        view.addSubview(titleView)
        titleView.addSubview(titleLabel)
        
        // layout
        titleView.snp.makeConstraints { v in
            v.top.horizontalEdges.equalTo(view.safeAreaLayoutGuide)
            v.height.equalTo(40)
        }
        titleLabel.snp.makeConstraints{ l in
            l.edges.equalToSuperview().inset(8)
        }
        
        // ui
        titleLabel.text = Constants.mainTitle
        titleLabel.font = UIFont._appSystemBoldFontL
        titleLabel.textColor = .black
        titleLabel.textAlignment = .center
    }
    
    func configureDamagochiCollectionView() {
        view.addSubview(damagochiCollection)
                
        damagochiCollection.delegate = self
        damagochiCollection.dataSource = self
        damagochiCollection.register(DamagochiCell.self, forCellWithReuseIdentifier: DamagochiCell.identifier)
        damagochiCollection.snp.makeConstraints { c in
            c.top.equalTo(titleView.snp.bottom).offset(16)
            c.bottom.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(16)
        }
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = damagochiCollection.dequeueReusableCell(withReuseIdentifier: DamagochiCell.identifier, for: indexPath) as? DamagochiCell else { return UICollectionViewCell() }
        
        return cell
    }
    
    
}
