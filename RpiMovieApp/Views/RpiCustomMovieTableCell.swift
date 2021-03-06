//
//  CustomMovieTableCell.swift
//  RpiMovieApp
//
//  Created by Andres Ortiz on 19/03/19.
//  Copyright © 2018 Andres. All rights reserved.
//

import Foundation
import UIKit


class RpiCustomMovieTableCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .white
        setupLayout()
    }
    
    let imgMoviePoster : UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.backgroundColor = .black
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    let lblMovieTitle : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        label.textColor = .black
        return label
    }()
    
    let lblMovieOverview : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 12, weight: .light)
        label.numberOfLines = 5
        label.textColor = .darkGray
        label.textAlignment = .justified
        return label
    }()
    
    func setupLayout(){
        addSubview(imgMoviePoster)
        imgMoviePoster.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        imgMoviePoster.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0).isActive = true
        imgMoviePoster.widthAnchor.constraint(equalToConstant: 80).isActive = true
        imgMoviePoster.heightAnchor.constraint(equalToConstant: 120).isActive = true
        
        addSubview(lblMovieTitle)
        lblMovieTitle.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
        lblMovieTitle.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 90).isActive = true
        lblMovieTitle.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10).isActive = true
        
        addSubview(lblMovieOverview)
        lblMovieOverview.topAnchor.constraint(equalTo: self.topAnchor, constant: 30).isActive = true
        lblMovieOverview.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 90).isActive = true
        lblMovieOverview.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10).isActive = true
        
        
        
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
