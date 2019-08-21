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
        
        let sortedPages = pages.sorted { (page1, page2) -> Bool in
            return page1.index < page2.index
        }
        
        let collection = sortedPages.reduce(into: ItemCollection()) {
            (collection, page) in
            let pageFirstItemIndex = page.index * numberOfItemsPerPage
            
            if collection.count == pageFirstItemIndex {
                collection.append(contentsOf: page.items)
            }
        }
        callback?(collection)
        
        #if DEBUG
            let debugMessage = "DEBUG: ItemCollectionProvider"
                + ".handlePageRetrieved(): page: \(page.index), "
                + "collection.count: \(collection.count)"
            NSLog(debugMessage)
        #endif
    }
}
