//
//  DetailViewController.swift
//  MovieProject
//
//  Created by prplnst on 11/20/20.
//


import UIKit


class DetailViewController: UIViewController {

    var posterImageView : UIImageView = {
        var view = UIImageView()
            view.contentMode = .scaleToFill
            view.backgroundColor = .white
        return view
    }()
    
    var movie = MovieModel()
    var theLabel = UILabel()
    var releaseDate = UILabel()
    var titleOfTheMovie = UILabel()
    var rating = UILabel()
    
            
            
    init(movie : MovieModel) {
        super.init(nibName: nil, bundle: nil)
        self.movie = movie
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupData()
    
  
    }
    
    
    func setupData(){
      if let poster = movie.poster_path {
             posterImageView.sd_setImage(with:  URL(string: "https://image.tmdb.org/t/p/w500/\(poster)"), completed: nil)
        }
        
 }
    
    
    func setupView(){
       
        view.backgroundColor = #colorLiteral(red: 0.1963050067, green: 0.2067680359, blue: 0.3837721944, alpha: 1)
        
        // Poster Image
           view.addSubview(posterImageView)
           posterImageView.translatesAutoresizingMaskIntoConstraints = false
           posterImageView.layer.cornerRadius = 20
           posterImageView.clipsToBounds = true
           posterImageView.contentMode = .scaleToFill
           posterImageView.alpha = 0.8
          
          // Poster Image Constraints
             posterImageView.snp.makeConstraints {
               (make) in
                make.top.equalTo(100)
                make.bottom.equalTo(-400)
                make.right.equalTo(-10)
                make.left.equalTo(10)
                make.height.equalTo(200)
        
        // Title of the movie
           view.addSubview(titleOfTheMovie)
           titleOfTheMovie.text = self.title
           titleOfTheMovie.textColor = #colorLiteral(red: 0.04105402529, green: 0.04706067592, blue: 0.09120742232, alpha: 1)
           titleOfTheMovie.font = UIFont(name: "Copperplate", size: 26)
           titleOfTheMovie.backgroundColor = UIColor.clear
           titleOfTheMovie.contentMode = .scaleAspectFit
           titleOfTheMovie.adjustsFontSizeToFitWidth = true
           titleOfTheMovie.numberOfLines = 3
           titleOfTheMovie.text = movie.title
                    
           // Title of the movie Constraints
              titleOfTheMovie.snp.makeConstraints {
                (make) in
                 make.top.equalTo(450)
                 make.bottom.equalTo(-300)
                 make.left.equalTo(10)
                 make.right.equalTo(-15)
                }
                
        // Release Date
           view.addSubview(releaseDate)
           releaseDate.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
           releaseDate.font = UIFont(name: "Copperplate", size: 22)
           releaseDate.backgroundColor = UIColor.clear
           releaseDate.contentMode = .scaleAspectFit
           releaseDate.adjustsFontSizeToFitWidth = true
           releaseDate.text = movie.release_date
                
           // Release Date Constraints
              releaseDate.snp.makeConstraints {
                (make) in
                 make.top.equalTo(530)
                 make.left.equalTo(10)
                 make.bottom.equalTo(-290)
                 make.right.equalTo(-15)
        }
        
        
       // Rating
          view.addSubview(rating)
          rating.textColor = .black
          rating.font = UIFont(name: "Copperplate", size: 14)
          rating.backgroundColor = UIColor(patternImage: #imageLiteral(resourceName: "Actions-rating-icon"))
          rating.contentMode = .scaleAspectFit
          rating.textAlignment = .center
          rating.text = "\(movie.vote_average!)"
            
          // Rating Constraints
             rating.snp.makeConstraints {
               (make) in
                make.top.equalTo(110)
                make.right.equalTo(-30)
                make.size.equalTo(85)
                make.width.equalTo(100)
                make.height.equalTo(100)
        }
        
      
       // Desccription
          view.addSubview(theLabel)
          theLabel.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
          theLabel.font = UIFont(name: "Copperplate", size: 22)
          theLabel.numberOfLines = 13
          theLabel.contentMode = .scaleToFill
          theLabel.adjustsFontSizeToFitWidth = true
          theLabel.textAlignment = .center
          theLabel.text = movie.overview
           
          // Description Constraints
             theLabel.snp.makeConstraints {
               (make) in
                make.top.equalTo(600)
                make.right.equalTo(-10)
                make.left.equalTo(10)
        }
        
            
        }
        
    }
    
   
    


}

