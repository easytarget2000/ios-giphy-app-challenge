import Foundation

class GIFItemCollectionNetworkLoader: NSObject {
    
    @IBOutlet weak var apiKeyStorage: NetworkLoaderAPIKeyStorage!
    @IBOutlet weak var configuration: NetworkLoaderConfiguration!
    
    func getCollection(
        callback: @escaping GIFItemCollectionProviderCallback
    ) {
        let numberOfItemsPerPage = configuration.numberOfItemsPerPage
        let numberOfPages = configuration.numberOfPages
        
        getCollection(
            numberOfItemsPerPage: numberOfItemsPerPage,
            numberOfPages: numberOfPages,
            callback: callback
        )
    }
    
    func getCollection(
        numberOfItemsPerPage: Int,
        numberOfPages: Int,
        callback: @escaping GIFItemCollectionProviderCallback
    ) {
        
    }
}
