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
        title = "다마고치 선택하기"
        
        configureDamagochiCollectionView()
        getOrSaveUserData()
        print(user)
    }
    
    
    func configureDamagochiCollectionView() {
        view.addSubview(damagochiCollection)
                
        damagochiCollection.delegate = self
        damagochiCollection.dataSource = self
        damagochiCollection.register(DamagochiCell.self, forCellWithReuseIdentifier: DamagochiCell.identifier)
        damagochiCollection.snp.makeConstraints { c in
            c.edges.equalTo(view.safeAreaLayoutGuide).inset(16)
        }
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let user else { return 0}
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
        vc.modalPresentationStyle = .overFullScreen
        present(vc, animated: false)
    }
}

extension ViewController {
    func getOrSaveUserData() {
        if findData(forKey: "user") {
            decodeUserDefaults(forKey: "user")
        } else {
            saveData(data: User(damagochies: generateDamagochis()), forKey: "user")
        }
    }
    
    func decodeUserDefaults(forKey: String){
        if let savedData = UserDefaults.standard.object(forKey: forKey) {
            let decoder = JSONDecoder()
            if let decodedData = try? decoder.decode(User.self, from: savedData as! Data) {
                user = decodedData
            }
        }
    }
    
    func setUser() {
        
        
    }
}
