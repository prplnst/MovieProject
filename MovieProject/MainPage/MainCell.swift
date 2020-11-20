//
//  MainCell.swift
//  MovieProject
//
//  Created by prplnst on 11/20/20.
//

import UIKit
import SnapKit
import SDWebImage


class MainCell: UITableViewCell {
    
    var releaseDate = UILabel()
    var posterImageView = UIImageView()
    var ratingLabel = UILabel()

  

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
     setupView()
   
    }
    
     required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
   }
    
    private func setupView(){
        
        // Poster Image
        addSubview(posterImageView)
        posterImageView.translatesAutoresizingMaskIntoConstraints = false
        posterImageView.layer.cornerRadius = 20
        posterImageView.clipsToBounds = true
        posterImageView.contentMode = .scaleToFill
            
           // Poster Image Constraints
              posterImageView.snp.makeConstraints {
                (make) in
                 posterImageView.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
                 posterImageView.leftAnchor.constraint(equalTo: leftAnchor, constant: 10).isActive = true
                 posterImageView.rightAnchor.constraint(equalTo: rightAnchor, constant: -10).isActive = true
                 posterImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10).isActive = true
           
            }
        
        // Release Date
        addSubview(releaseDate)
        releaseDate.backgroundColor = .white
        releaseDate.textColor = .black
        
          // Release Date Constraints
             releaseDate.snp.makeConstraints {
               (make) in
                make.top.equalTo(460)
                make.left.equalTo(30)
          }
       
        // Rating
        addSubview(ratingLabel)
        ratingLabel.textColor = .black
        ratingLabel.font = UIFont(name: "Copperplate", size: 14)
        ratingLabel.contentMode = .scaleAspectFit
        ratingLabel.textAlignment = .center
        ratingLabel.backgroundColor = UIColor(patternImage: #imageLiteral(resourceName: "Actions-rating-icon"))
              
           // Rating Constraints
             ratingLabel.snp.makeConstraints {
               (make) in
                make.top.equalTo(20)
                make.left.equalTo(35)
                make.size.equalTo(85)
                
           }
      }
    
    
      func setupCell(with movie: MovieModel){
          posterImageView.sd_setImage(with: URL(string: "https://image.tmdb.org/t/p/w500/\(movie.poster_path!)"), completed: nil)
          //  movie.overview
          ratingLabel.text = "\(movie.vote_average!)"
        releaseDate.text = movie.release_date
     
        
    }
    
      }
      
      
      
      








