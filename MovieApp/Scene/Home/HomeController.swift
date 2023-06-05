//
//  ViewController.swift
//  MovieApp
//
//  Created by Ramin on 31.05.23.
//

import UIKit

class HomeController: UIViewController {
    @IBOutlet weak var collection: UICollectionView!
    
    var viewModel = HomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configViewModel()
        configCollection()
    }
    
    func configViewModel() {
        viewModel.getpopularMovies()
        viewModel.successCallback = {
            self.collection.reloadData()
        }
    }
    
    func configCollection() {
        
    }
}

extension HomeController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(HomeCell.self)", for: indexPath) as! HomeCell
        let postBaseURL = "https://image.tmdb.org/t/p/original"
        let imageUrlString = postBaseURL + (viewModel.items[indexPath.item].posterPath ?? "")
        print(imageUrlString)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.width, height: 318)
    }
}
