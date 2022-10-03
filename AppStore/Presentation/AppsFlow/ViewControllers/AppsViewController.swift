//
//  AppsViewController.swift
//  AppStore
//
//  Created by Yevhenii Korsun on 03.10.2022.
//

import UIKit

private let reuseIdentifier = "Cell"

class AppsViewController: UICollectionViewController {

    // MARK: - Properties
    
    // MARK: - Lifecycle
    
    init() {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    // MARK: - Selectors
    
    // MARK: - API
    
    // MARK: - Helper Functions
    
    private func configureUI() {
        collectionView.backgroundColor = .yellow
        self.collectionView!.register(AppsGroupCell.self, forCellWithReuseIdentifier: reuseIdentifier)

    }
}

// MARK: UICollectionViewDataSource

extension AppsViewController {
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 5
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? AppsGroupCell else { return UICollectionViewCell() }

        
    
        // Configure the cell
    
        return cell
    }
}

// MARK: UICollectionViewDataSource

extension AppsViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: view.frame.width, height: 250)
    }
}
