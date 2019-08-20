import Foundation

class GIFItemCollectionProvider: NSObject {
    
    @IBOutlet weak var cache: GIFItemCollectionCache!
    @IBOutlet weak var networkLoader: GIFItemCollectionNetworkLoader!
    
    func getCollection(
        callback: @escaping GIFItemCollectionProviderCallback
    ) {
        // TODO: Move into config.
        let itemsPerPage = 25
        let numberOfPages = 20
        getCollection(
            itemsPerPage: itemsPerPage,
            numberOfPages: numberOfPages,
            callback: callback
        )
    }
    
    func getCollection(
        itemsPerPage: Int,
        numberOfPages: Int,
        callback: @escaping GIFItemCollectionProviderCallback
    ) {
        
    }
}
