import Foundation

class GIFItemCollectionProvider: NSObject {
    
    @IBOutlet weak var cache: GIFItemCollectionSource?
    @IBOutlet weak var networkLoader: GIFItemCollectionSource!
    private var didGetCollectionFromCache = false
    private var callback: GIFItemCollectionProviderCallback?
}

// MARK: - Source Access

extension GIFItemCollectionProvider {
    
    func getCollectionFromFastestSource(
        callback: @escaping GIFItemCollectionProviderCallback
    ) {
        self.callback = callback
        cache?.getCollection(delegate: self)
        networkLoader.getCollection(delegate: self)
    }
}

// MARK: - GIFItemCollectionSourceDelegate

extension GIFItemCollectionProvider: GIFItemCollectionSourceDelegate {
    
    func collectionSource(
        _ collectionSource: GIFItemCollectionSource,
        didGetCollection collection: GIFItemCollection
    ) {
        callback?(collection)
        callback = nil
    }
    
}
