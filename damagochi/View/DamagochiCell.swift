//
//  DamagochiCell.swift
//  damagochi
//
//  Created by 강한결 on 6/7/24.
//

import UIKit
import SnapKit

class DamagochiCell: UICollectionViewCell {
    
    let cellBack = UIView()
    let cellImage = UIImageView()
    let cellLabel = UILabel()
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
    }
    
    func configureView() {
        addSubview(cellBack)
        cellBack.addSubview(cellImage)
        cellBack.addSubview(cellLabel)
        cellBack.snp.makeConstraints {v in
            v.top.horizontalEdges.equalToSuperview()
            v.bottom.equalToSuperview().inset(12)
        }
        
        cellImage.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(4)
            make.horizontalEdges.equalToSuperview().inset(4)
            make.bottom.equalToSuperview().inset(16)
            make.center.equalTo(cellBack)
        }
        
        cellLabel.snp.makeConstraints { make in
            make.top.equalTo(cellImage.snp.bottom).offset(12)
            make.horizontalEdges.equalToSuperview().inset(8)
        }
        
        cellImage.image = UIImage(named: "1-1")
        cellImage.contentMode = .scaleAspectFill
        
        cellLabel.font = UIFont._appSystemFontS
        cellLabel.text = "adsafas"
        cellLabel.textAlignment = .center
        cellLabel.textColor = UIColor._appSystemFontColor
        cellLabel.layer.borderWidth = 1
        cellLabel.layer.borderColor = UIColor._appSystemFontColor.cgColor
        cellLabel.layer.cornerRadius = 4
    }
}
