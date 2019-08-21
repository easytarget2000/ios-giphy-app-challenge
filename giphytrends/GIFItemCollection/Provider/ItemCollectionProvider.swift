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
    private var collection = ItemCollection()
    private var callback: ItemCollectionProviderCallback?
    
}

// MARK: - Source Access

extension ItemCollectionProvider {
    
    func getCollectionFromFastestSource(
        callback: @escaping ItemCollectionProviderCallback
    ) {
        self.callback = callback
        let maxNumberOfItems = numberOfPages * numberOfItemsPerPage
        collection = ItemCollection(capacity: maxNumberOfItems)
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
        didGetPage collectionPage: ItemCollectionPage,
        atIndex index: Int
    ) {
        handlePageRetrieved(collectionPage: collectionPage, index: index)
    }
}

// MARK: - Implementations

extension ItemCollectionProvider {
    
    func handlePageRetrieved(
        collectionPage: ItemCollectionPage,
        index: Int
    ) {
        collection.pages[index] = collectionPage
        callback?(collection)
    }
}
