//
//  ViewController.swift
//  damagochi
//
//  Created by 강한결 on 6/7/24.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    private var user: User?
    
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
        
        configureNav()
        configureDamagochiCollectionView()
        getOrSaveUser()
    }
    

    func configureNav() {
        title = Constants.mainTitle
        navigationItem.leftBarButtonItem = nil
        navigationItem.rightBarButtonItem = nil
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func configureDamagochiCollectionView() {
        view.addSubview(damagochiCollection)
                
        damagochiCollection.delegate = self
        damagochiCollection.dataSource = self
        damagochiCollection.register(DamagochiCell.self, forCellWithReuseIdentifier: DamagochiCell.identifier)
        damagochiCollection.snp.makeConstraints { c in
            c.edges.equalTo(view.safeAreaLayoutGuide).inset(16)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let user else { return 0 }
        return user.damagochies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let user else { return UICollectionViewCell() }
        guard let cell = damagochiCollection.dequeueReusableCell(withReuseIdentifier: DamagochiCell.identifier, for: indexPath) as? DamagochiCell else { return UICollectionViewCell() }
        
        cell.setData(user.damagochies[indexPath.row])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = DamagochiModalViewController()
        
        if let user {
            let dataSet = user.damagochies[indexPath.row]
            if dataSet.isOpened {
                vc.setData(dataSet.id)
                vc.modalPresentationStyle = .overFullScreen
                present(vc, animated: false)
            }
        }
    }
}

extension ViewController {
    func getOrSaveUser() {
        user = UserDefaultsHelper.findOrSaveUserData(damagochies: generateDamagochis())
    }
}
