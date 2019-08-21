import Foundation

class GIFItemCollectionNetworkSource: NSObject, GIFItemCollectionSource {
    
    @IBOutlet weak var apiKeyStorage: NetworkSourceAPIKeyStorage!
    @IBOutlet weak var configuration: NetworkSourceConfiguration!
    
    private var numberOfItemsPerPage: Int {
        get {
            return configuration.numberOfItemsPerPage
        }
    }
    private var numberOfPages: Int {
        get {
            return configuration.numberOfPages
        }
    }
    private weak var delegate: GIFItemCollectionSourceDelegate?
    private var collection: GIFItemCollection!
    
    func getCollection(
        delegate: GIFItemCollectionSourceDelegate?
    ) {
        self.delegate = delegate
        collection = GIFItemCollection()
        
        for pageIndex in 0 ..< numberOfPages {
            getPage(pageIndex: pageIndex)
        }
    }
    
}

// MARK: - Implementations

extension GIFItemCollectionNetworkSource {
    
    private func getPage(pageIndex: Int) {
        let pageOffset = pageIndex * numberOfItemsPerPage
    }
}
