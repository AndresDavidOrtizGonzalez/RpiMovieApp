//
//  CustomMovieTableCell.swift
//  RpiMovieApp
//
//  Created by Andres Ortiz on 19/03/19.
//  Copyright © 2018 Andres. All rights reserved.
//

import Foundation
import UIKit


class CustomMovieTableCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .white
        setupLayout()
    }
    
    let imgMoviePoster : UIImageView = {
        let imgMoviePoster = UIImageView()
        imgMoviePoster.translatesAutoresizingMaskIntoConstraints = false
        imgMoviePoster.backgroundColor = .black
        imgMoviePoster.contentMode = .scaleAspectFit
        return imgMoviePoster
    }()
    
    func setupLayout(){
        addSubview(imgMoviePoster)
        imgMoviePoster.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        imgMoviePoster.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0).isActive = true
        imgMoviePoster.widthAnchor.constraint(equalToConstant: 120).isActive = true
        imgMoviePoster.heightAnchor.constraint(equalToConstant: 120).isActive = true
        
        
        
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
