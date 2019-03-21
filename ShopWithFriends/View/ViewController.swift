//
//  ViewController.swift
//  ShopWithFriends
//
//  Created by John De Guzman on 2019-03-19.
//  Copyright © 2019 John De Guzman. All rights reserved.
//

import UIKit
import FunctionalTableData

class ViewController: UIViewController {

    private var functionalData = FunctionalCollectionData()
    
    private var collectionView: UICollectionView!
    
    private var items: [Shoe] = [] {
        didSet {
            render()
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
    
        functionalData.collectionView = collectionView
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(didSelectAdd))
        
        fetchData()
        
        
    }
    
    
    private func fetchData() {
        API.fetchProducts(productCategory: .sneakers, onComplete: { [ weak self ] response in
            guard let self = self else { return }
            self.items = response.Products
        })
    }
    
    private func setupCollectionView() {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = CGSize(width: 200, height: 170)
        collectionView = UICollectionView(frame: view.frame, collectionViewLayout: flowLayout)
        collectionView.backgroundColor = .white
        
        view.fill(with: collectionView)
    }
    
    @objc func didSelectAdd() {
        
    }
    
    private func render() {
        
        
        
        let rows: [CellConfigType] = items.enumerated().map { (index, item) in
          
            let cellActions = CellActions( selectionAction: { _ in
                let nav = 
                return .deselected
            }, deselectionAction: { _ in
                return .deselected
            })
            
            let state = ImageLabelState(url: item.media.imageUrl, title: item.title,  subtitle: item.retailPrice.currency())
            return ImageLabelCell(key: "id-x-\(index)", actions: cellActions, state: state, cellUpdater: ImageLabelState.updateView)
        }
        
        let section = TableSection(key: "section", rows: rows)
        
        functionalData.renderAndDiff([section])
    }


}

