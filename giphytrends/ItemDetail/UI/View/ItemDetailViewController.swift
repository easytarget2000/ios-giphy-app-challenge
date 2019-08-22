import SDWebImage

class ItemDetailViewController: UIViewController {
    
    var providedItem: Item?
    @IBOutlet weak var animatedImageView: SDAnimatedImageView!
    @IBOutlet weak var viewModel: ItemDetailViewModel!
    
}

// MARK: - UIViewController Life Cycle

extension ItemDetailViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewModel()
        showFullGIF()
    }

}

// MARK: - Implementations

extension ItemDetailViewController {
    
    private func setupViewModel() {
        viewModel.item = providedItem
        providedItem = nil
    }
    
    private func showFullGIF() {
        let url = viewModel.fullGIFUrl
        animatedImageView.sd_setImage(with: url, completed: nil)
    }
}
