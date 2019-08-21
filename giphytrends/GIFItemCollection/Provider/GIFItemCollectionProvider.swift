import Foundation

class GIFItemCollectionProvider: NSObject {
    
    @IBOutlet weak var cache: GIFItemCollectionSource?
    @IBOutlet weak var networkLoader: GIFItemCollectionSource!
    private var collection = GIFItemCollection()
    private var callback: GIFItemCollectionProviderCallback?
}

// MARK: - Source Access

extension GIFItemCollectionProvider {
    
    func getCollectionFromFastestSource(
        callback: @escaping GIFItemCollectionProviderCallback
    ) {
        self.callback = callback
        collection = GIFItemCollection()
        cache?.getCollection(delegate: self)
        networkLoader.getCollection(delegate: self)
    }
}

// MARK: - GIFItemCollectionSourceDelegate

extension GIFItemCollectionProvider: GIFItemCollectionSourceDelegate {
    
    func collectionSource(
        _ collectionSource: GIFItemCollectionSource,
        didGetPage collectionPage: GIFItemCollectionPage,
        atIndex index: Int
    ) {
        handlePageRetrieved(collectionPage: collectionPage, index: index)
    }
}

// MARK: - Implementations

extension GIFItemCollectionProvider {
    
    func handlePageRetrieved(
        collectionPage: GIFItemCollectionPage,
        index: Int
    ) {
        collection.pages[index] = collectionPage
        callback?(collection)
    }
}
