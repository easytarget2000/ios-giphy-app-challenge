import Foundation

class ItemCollectionNetworkSourceConfiguration: NSObject {
    
    @IBOutlet weak var infoReader: InfoReader!
    
    private static let apiKeyKey = "GIPHYTrendingEndpointURL"
    private static let numberOfItemsToLoadPerPageKey = "NumberOfItemsPerPage"
    private static let numberOfPagesToLoadKey = "NumberOfPagesToLoad"
    
    var endpointURL: String {
        get {
            return infoReader.get(
                key: ItemCollectionNetworkSourceConfiguration.apiKeyKey
            )
        }
    }
    
    var numberOfItemsPerPage: Int {
        get {
            return infoReader.get(
                key: ItemCollectionNetworkSourceConfiguration
                    .numberOfItemsToLoadPerPageKey
            )
        }
    }
    
    var numberOfPages: Int {
        get {
            return infoReader.get(
                key: ItemCollectionNetworkSourceConfiguration
                    .numberOfPagesToLoadKey
            )
        }
    }
}
