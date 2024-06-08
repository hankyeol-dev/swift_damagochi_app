//
//  SettingCell.swift
//  damagochi
//
//  Created by 강한결 on 6/8/24.
//

import UIKit
import SnapKit

class SettingCell: UITableViewCell {
    var cellData: SettingItem?
    
    let backView = UIView()
    let cellImage = UIImageView()
    let cellTitle = UILabel()
    let cellUserName = UILabel()
    let cellRightArrowImage = UIImageView()
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configureSubview()
        configureLayout()
        configureUI()
    }
    
    func setData(_ data: SettingItem) {
        cellData = data
        if let cellData {
            cellImage.image = UIImage(systemName: cellData.image)
            cellTitle.text = cellData.title
            cellRightArrowImage.image = UIImage(systemName: Icons.goRight.rawValue)
            if cellData.isNameSettingCell {
                cellUserName.text = UserDefaultsHelper.getUserName()
            }
        }
    }
}

extension SettingCell {
    func configureSubview() {
        self.contentView.addSubview(backView)
        [cellImage, cellTitle, cellUserName, cellRightArrowImage].forEach {
            backView.addSubview($0)
        }
    }
    
    func configureLayout() {
        backView.snp.makeConstraints { bv in
            bv.verticalEdges.equalTo(contentView.safeAreaLayoutGuide).inset(8)
            bv.horizontalEdges.equalTo(contentView.safeAreaLayoutGuide).inset(4)
        }
        cellImage.snp.makeConstraints { ci in
            ci.verticalEdges.equalToSuperview()
            ci.leading.equalTo(backView.safeAreaLayoutGuide).inset(16)
            ci.size.equalTo(12)
        }
        cellTitle.snp.makeConstraints { ct in
            ct.verticalEdges.equalToSuperview()
            ct.leading.equalTo(cellImage.snp.trailing).offset(12)
            ct.trailing.equalTo(cellUserName.snp.trailing).offset(-12)
        }
        cellUserName.snp.makeConstraints { un in
            un.verticalEdges.equalToSuperview()
            un.trailing.equalTo(cellRightArrowImage.snp.leading).offset(-16)
        }
        cellRightArrowImage.snp.makeConstraints { ai in
            ai.verticalEdges.equalToSuperview()
            ai.trailing.equalToSuperview().inset(16)
            ai.width.equalTo(16)
        }
    }
    
    func configureUI() {
        cellImage.tintColor = UIColor._appSystemFontColor
        cellImage.contentMode = .center
        cellTitle.textColor = UIColor._appSystemFontColor
        cellTitle.font = UIFont._appSystemBoldFontM
        cellUserName.textColor = .lightGray
        cellUserName.font = UIFont._appSystemFontS
        cellRightArrowImage.tintColor = UIColor._appSystemFontColor
        cellRightArrowImage.contentMode = .center
    }
}
