//
//  DamagochiCell.swift
//  damagochi
//
//  Created by 강한결 on 6/7/24.
//

import UIKit
import SnapKit

class DamagochiCell: UICollectionViewCell {
    
    var data: Damagochi?
    
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
            v.bottom.equalToSuperview().inset(16)
        }
        
        cellImage.snp.makeConstraints { make in
            make.top.horizontalEdges.equalToSuperview().inset(12)
            make.bottom.equalToSuperview().inset(16)
            make.center.equalTo(cellBack)
        }
        
        cellLabel.snp.makeConstraints { make in
            make.top.equalTo(cellImage.snp.bottom).offset(12)
            make.horizontalEdges.equalToSuperview().inset(8)
            make.height.equalTo(24)
        }
        
        cellImage.contentMode = .scaleAspectFill
        
        cellLabel.font = .systemFont(ofSize: 10)
        cellLabel.textAlignment = .center
        cellLabel.textColor = UIColor._appSystemFontColor
        cellLabel.layer.borderWidth = 1
        cellLabel.layer.borderColor = UIColor._appSystemFontColor.cgColor
        cellLabel.layer.cornerRadius = 4
    }
    
    func setData(_ cellData: Damagochi) {
        data = cellData
        if let data {
            cellImage.image = UIImage(named: data.getDamagochiImage)
            cellLabel.text = data.name
        }
    }
}
