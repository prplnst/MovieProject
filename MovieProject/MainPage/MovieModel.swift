//
//  MovieModel.swift
//  MovieProject
//
//  Created by prplnst on 11/20/20.
//

import Foundation

struct Response : Decodable {
    var results:[MovieModel]
}

struct MovieModel: Decodable {
        var title:String?
        var release_date:String?
        var poster_path:String?
        var vote_average:Double?
        var overview:String?
}



