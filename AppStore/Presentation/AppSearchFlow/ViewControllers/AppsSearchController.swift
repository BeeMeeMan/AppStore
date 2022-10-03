//
//  AppsSearchController\.swift
//  AppStore
//
//  Created by Yevhenii Korsun on 02.10.2022.
//

import UIKit

private let reuseIdentifier = "Cell"

class AppsSearchController: UICollectionViewController {
    
    // MARK: - Properties
    
    private let searchVM: ResultListViewModel
    private var timer: Timer?
    
    private let searchController = UISearchController(searchResultsController: nil)
    private let enterSearchTermLabel = UILabel()
        .setText("Please enter search term above...")
        .setFont(.boldSystemFont(ofSize: 20))
        .setAlignment(.center)
    
    // MARK: - Lifecycle
    
    init(vm: ResultListViewModel) {
        searchVM = vm
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
        self.collectionView!.register(SearchResultCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        configureSearchBar()
        
        collectionView.addSubview(enterSearchTermLabel)
        enterSearchTermLabel.pinAll(padding: .init(top: 50, left: 20, bottom: 0, right: 20))
    }
    
    private func configureSearchBar() {
        definesPresentationContext = true
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.searchBar.delegate = self
    }
}

// MARK: - DataSource

extension AppsSearchController {
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? SearchResultCell else { return UICollectionViewCell() }
        let resultVM = searchVM.modelBy(indexPath: indexPath)
        cell.resultVM = resultVM
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        enterSearchTermLabel.isHidden = searchVM.isLabelHidden
        return searchVM.numberOfRowIn(section: section)
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension AppsSearchController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: view.frame.width, height: 350)
    }
}

// MARK: - UISearchBarDelegate

extension AppsSearchController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false, block: { [weak self] _ in
            self?.searchVM.search(text: searchText) {
                DispatchQueue.main.async {
                    self?.collectionView.reloadData()
                }
            }
        })
    }
}
