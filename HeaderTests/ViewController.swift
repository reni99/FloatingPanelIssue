//
//  ViewController.swift
//  HeaderTests
//
//  Created by Renato Stauffer on 18.11.20.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    @IBOutlet weak var constraintHeaderHeight: NSLayoutConstraint!
    private let headerMaxHeight: CGFloat = 128.0
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.reloadData()
        collectionView.delegate = self
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 100
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TestCell", for: indexPath) as? UICollectionViewCell else {
            fatalError()
        }
        
        return cell
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let potentialHeight: CGFloat = constraintHeaderHeight.constant - scrollView.contentOffset.y
        
        print(potentialHeight)
        if potentialHeight < 60.0 {
            constraintHeaderHeight.constant = 60.0
        } else if potentialHeight > headerMaxHeight {
            constraintHeaderHeight.constant = headerMaxHeight
        } else {
            constraintHeaderHeight.constant = potentialHeight
            scrollView.contentOffset.y = 0
        }
        
    }

}

