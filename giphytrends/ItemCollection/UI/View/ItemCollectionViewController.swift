import UIKit

class ItemCollectionViewController: UICollectionViewController {
    
    static let toItemDetailSegueIdentifier = "ItemCollectionToItemDetail"
    @IBOutlet weak var viewModel: ItemCollectionViewModel!
    
}

// MARK: - UIViewController Life Cycle

extension ItemCollectionViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewModel()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchRequiredItems()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let detailViewController = segue as! ItemDetailViewController
        let item = sender as! Item
    }
}

// MARK: - UICollectionViewDataSource
    
extension ItemCollectionViewController {

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return viewModel.numberOfSections
    }

    override func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        return viewModel.numberOfItemsInSection(section)
    }

    override func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: ItemCollectionCell.identifier,
            for: indexPath
        ) as! ItemCollectionCell
        viewModel.populateCell(cell, atIndexPath: indexPath)
        return cell
    }
    
}

// MARK: - UICollectionViewDelegate

extension ItemCollectionViewController {

    override func collectionView(
        _ collectionView: UICollectionView,
        didSelectItemAt indexPath: IndexPath
    ) {
        collectionView.deselectItem(at: indexPath, animated: true)
        handleSelectionAtSection(indexPath.section, index: indexPath.row)
    }

}

// MARK: - Implementations

extension ItemCollectionViewController {
    
    private func setupViewModel() {
        viewModel.collectionWrapper.bind = {
            [weak self] in
            let _ = $0
            self?.collectionView?.reloadData()
        }
    }
    
    private func fetchRequiredItems() {
        viewModel.fetchEntireCollection()
    }
    
    private func handleSelectionAtSection(_ sectionIndex: Int, index: Int) {
        viewModel.handleSelectionAtSection(sectionIndex, index: index) {
            item in
            showItemInDetailViewController(item: item)
        }
    }

    private func showItemInDetailViewController(item: Item) {
        performSegue(
            withIdentifier:
                ItemCollectionViewController.toItemDetailSegueIdentifier,
            sender: item
        )
    }
}
