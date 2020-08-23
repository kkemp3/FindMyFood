//
//  ViewController.swift
//  FindMyFood
//
//  Created by Kevin Kemp on 8/23/20.
//  Copyright © 2020 Kevin Kemp. All rights reserved.
//

import UIKit

class RestaurantViewController: UIViewController {

    @IBOutlet weak var restaurantCollectionView: UICollectionView!
    
    let cellIdentifier = "RestaurantCellIdentifier"
    let restaurantNames = ["McDonald's", "Arby's", "Cafe Jule's", "Mill Creek Inn"]
    let restaurantDescriptions = ["Home of the Big Mac", "Curly fries are here", "Marley used to work here", "I got fired from here"]
    var collectionViewFlowLayout: UICollectionViewFlowLayout!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        setupCollectionViewItemSize()
    }
    
    private func setupCollectionView() {
        restaurantCollectionView.delegate = self
        restaurantCollectionView.dataSource = self
        let nib = UINib(nibName: "RestaurantCollectionViewCell", bundle: nil)
        restaurantCollectionView.register(nib, forCellWithReuseIdentifier: cellIdentifier)
    }
    
    private func setupCollectionViewItemSize() {
         if collectionViewFlowLayout == nil {
             let numItemPerRow: CGFloat = 1
             let lineSpacing: CGFloat = 2
             let interItemSpacing: CGFloat = 2
             
             let width = (restaurantCollectionView.frame.width - (numItemPerRow - 1) * interItemSpacing) / numItemPerRow
             let height = width / 2
             
             collectionViewFlowLayout = UICollectionViewFlowLayout()
             collectionViewFlowLayout.itemSize = CGSize(width: width, height: height)
             collectionViewFlowLayout.sectionInset = UIEdgeInsets.zero
             collectionViewFlowLayout.scrollDirection = .vertical
             collectionViewFlowLayout.minimumLineSpacing = lineSpacing
             collectionViewFlowLayout.minimumInteritemSpacing = interItemSpacing
             restaurantCollectionView.setCollectionViewLayout(collectionViewFlowLayout, animated: true)
         }
     }


}

extension RestaurantViewController : UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = restaurantCollectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! RestaurantCollectionViewCell
        
       cell.restaurantName.text = restaurantNames[indexPath.item]
        cell.restaurantDescription.text = restaurantDescriptions[indexPath.item]
        
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        restaurantNames.count
    }
    
}

