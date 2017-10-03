//
//  MasterViewController.swift
//  NationalParks
//
//  Created by Derrick Park on 2017-10-02.
//  Copyright © 2017 Derrick Park. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class MasterViewController: UICollectionViewController {
    
    fileprivate var parksDataSource = ParksDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let width = collectionView!.frame.size.width / 3
        
        let layout = collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: width, height: width)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return parksDataSource.numberOfSections
        
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return parksDataSource.numberOfParksInSection(section)
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let sectionHeaderView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "SectionHeader", for: indexPath) as! SectionHeaderView
        
        if let title = parksDataSource.titleForSectionAtIndexPath(indexPath) {
            sectionHeaderView.title = title
        }
        return sectionHeaderView
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! ParkCell
        
        if let park = parksDataSource.parkForItemAtIndexPath(indexPath) {
            cell.park = park
        }
        return cell
    }

    // MARK: UICollectionViewDelegate

}
