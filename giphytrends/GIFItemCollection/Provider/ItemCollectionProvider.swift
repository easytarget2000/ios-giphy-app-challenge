import Foundation

class ItemCollectionProvider: NSObject {
    
    @IBOutlet weak var cache: ItemCollectionSource?
    @IBOutlet weak var networkLoader: ItemCollectionSource!
    private var collection = ItemCollection()
    private var callback: ItemCollectionProviderCallback?
}

// MARK: - Source Access

extension ItemCollectionProvider {
    
    func getCollectionFromFastestSource(
        callback: @escaping ItemCollectionProviderCallback
    ) {
        self.callback = callback
        collection = ItemCollection()
        cache?.getCollection(delegate: self)
        networkLoader.getCollection(delegate: self)
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
