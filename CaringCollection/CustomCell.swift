//
//  CustomCell.swift
//  CaringCollection
//
//  Created by Иван Дроботов on 27.02.2024.
//

import UIKit

final class CustomCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        backgroundColor = .systemGray5
        layer.cornerRadius = 8
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
