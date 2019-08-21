import Foundation

class ItemCollectionProvider: NSObject {
    
    @IBOutlet weak var cache: ItemCollectionSource?
    @IBOutlet weak var networkLoader: ItemCollectionSource!
    @IBOutlet weak var configuration: ItemCollectionProviderConfiguration!
    private lazy var numberOfItemsPerPage: Int = {
        return configuration.numberOfItemsPerPage
    }()
    private lazy var numberOfPages: Int = {
        return configuration.numberOfPages
    }()
    private var pages = [ItemCollectionPage]()
    private var callback: ItemCollectionProviderCallback?
    
}

// MARK: - Source Access

extension ItemCollectionProvider {
    
    func getCollectionFromFastestSource(
        callback: @escaping ItemCollectionProviderCallback
    ) {
        self.callback = callback
        pages = [ItemCollectionPage]()
        cache?.getCollectionPaginated(
            numberOfItemsPerPage: numberOfItemsPerPage,
            numberOfPages: numberOfPages,
            delegate: self
        )
        networkLoader.getCollectionPaginated(
            numberOfItemsPerPage: numberOfItemsPerPage,
            numberOfPages: numberOfPages,
            delegate: self
        )
    }
}

// MARK: - ItemCollectionSourceDelegate

extension ItemCollectionProvider: ItemCollectionSourceDelegate {
    
    func collectionSource(
        _ collectionSource: ItemCollectionSource,
        didGetPage page: ItemCollectionPage
    ) {
        handlePageRetrieved(page: page)
    }
}

// MARK: - Implementations

extension ItemCollectionProvider {
    
    func handlePageRetrieved(page: ItemCollectionPage) {
        pages.append(page)
//        callback?(collection)
    }
}
