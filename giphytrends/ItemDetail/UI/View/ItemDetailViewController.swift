import UIKit

class ItemDetailViewController: UIViewController {
    
    var providedItem: Item?
    @IBOutlet weak var viewModel: ItemDetailViewModel!
}

// MARK: - UIViewController Life Cycle

extension ItemDetailViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewModel()
    }

}

// MARK: - Implementations

extension ItemDetailViewController {
    
    private func setupViewModel() {
        viewModel.item = providedItem
        providedItem = nil
    }
}
