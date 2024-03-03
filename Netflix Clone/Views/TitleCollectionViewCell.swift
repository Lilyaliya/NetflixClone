//
//  TitleCollectionViewCell.swift
//  Netflix Clone
//
//  Created by User on 04.03.2024.
//

import UIKit
import SDWebImage

class TitleCollectionViewCell: UICollectionViewCell {
    static let identifier = "TitleCollectionViewCell"
    private let posterImageView: UIImageView = {
       let image = UIImageView()
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(posterImageView)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        posterImageView.frame = contentView.bounds
    }
    
    public func configure(with model: String){
//        let url = URL(string: model)
//        posterImageView.sd_setImage(with: url, completed: nil)
//        print(model)
        guard let url = URL(string: "https://image.tmdb.org/t/p/w500\(model)") else{
            return
        }
        
        posterImageView.sd_setImage(with: url)
    }
}
