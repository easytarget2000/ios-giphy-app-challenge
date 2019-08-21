import Foundation

class GIFItemCollectionNetworkSourceConfiguration: NSObject {
    
    @IBOutlet weak var infoReader: InfoReader!
    
    private static let apiKeyKey = "GIPHYTrendingEndpointURL"
    private static let numberOfItemsToLoadPerPageKey = "NumberOfItemsPerPage"
    private static let numberOfPagesToLoadKey = "NumberOfPagesToLoad"
    
    var endpointURL: String {
        get {
            return infoReader.get(
                key: GIFItemCollectionNetworkSourceConfiguration.apiKeyKey
            )
        }
    }
    
    var numberOfItemsPerPage: Int {
        get {
            return infoReader.get(
                key: GIFItemCollectionNetworkSourceConfiguration
                    .numberOfItemsToLoadPerPageKey
            )
        }
    }
    
    var numberOfPages: Int {
        get {
            return infoReader.get(
                key: GIFItemCollectionNetworkSourceConfiguration
                    .numberOfPagesToLoadKey
            )
        }
    }
}
