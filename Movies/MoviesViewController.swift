//
//  MoviesViewController.swift
//  Movies
//
//  Created by apple on 25/08/19.
//  Copyright © 2019 apple. All rights reserved.
//

import UIKit

class MoviesViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    var movies:[Movie] = [Movie]()
    let cellIdentifier = "MovieCell"
    let missingImageName = "placeholder_for_missing_posters"
    var currentPageIndex = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView?.delegate = self
        self.collectionView?.dataSource = self
        self.collectionView?.register(UINib.init(nibName: "MovieCell", bundle: nil), forCellWithReuseIdentifier: cellIdentifier)


        let refreshControl = UIRefreshControl.init(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        refreshControl.triggerVerticalOffset = 50.0
        refreshControl.addTarget(self, action: #selector(loadNewPage), for: .valueChanged)
        self.collectionView?.bottomRefreshControl = refreshControl
        
        self.loadMovies()
    }
    
    @objc func loadNewPage() {
        self.loadMovies()
    }
    
    func loadMovies() {
        if self.currentPageIndex < 3 {
            MoviesRequest().load(moviesAt: self.currentPageIndex) { (response) in
                self.movies.append(contentsOf: response.page.movies.list)
                self.collectionView?.reloadData()
                self.currentPageIndex = (self.currentPageIndex + 1)
                self.collectionView?.bottomRefreshControl?.endRefreshing()
            }
        }else{
            self.collectionView?.bottomRefreshControl?.endRefreshing()
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.movies.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! MovieCell
        let movie = self.movies[indexPath.row]
        cell.poster.image = UIImage.init(named: movie.posterImage) ?? UIImage.init(named: missingImageName)
        cell.label.text = movie.name
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = self.view.frame.width - 40
        let cellWidth = width/3
        let cellHeight = 1.7 * cellWidth
        
        return CGSize.init(width: cellWidth, height: cellHeight)
    }
}
