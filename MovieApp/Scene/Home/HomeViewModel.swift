//
//  HomeViewModel.swift
//  MovieApp
//
//  Created by Ramin on 02.06.23.
//

import Foundation

class HomeViewModel {
//    var movie: Movie?
    var items = [MovieResult]()
    
    var successCallback: (()->())?
    
    func getpopularMovies() {
        NetworkManager.shared.request(model: Movie.self,
                                      url: NetworkHelper.shared.urlConfig(path: "movie/popular")) { movieData, error in
            if let error = error {
                print("")
            } else if let movieData = movieData {
                self.items = movieData.results ?? []
                self.successCallback?()
            }
        }
    }
}
