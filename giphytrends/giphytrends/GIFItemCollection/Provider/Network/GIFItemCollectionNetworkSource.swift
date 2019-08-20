import Foundation

class GIFItemCollectionNetworkSource: NSObject, GIFItemCollectionSource {
    
    @IBOutlet weak var apiKeyStorage: NetworkSourceAPIKeyStorage!
    @IBOutlet weak var configuration: NetworkSourceConfiguration!
    
    func getCollection(
        delegate: GIFItemCollectionSourceDelegate?
    ) {
        let numberOfItemsPerPage = configuration.numberOfItemsPerPage
        let numberOfPages = configuration.numberOfPages
        
        getCollection(
            numberOfItemsPerPage: numberOfItemsPerPage,
            numberOfPages: numberOfPages,
            delegate: delegate
        )
    }
    
    func getCollection(
        numberOfItemsPerPage: Int,
        numberOfPages: Int,
        delegate: GIFItemCollectionSourceDelegate?
    ) {
        weak var delegate = delegate
        
    }
}
