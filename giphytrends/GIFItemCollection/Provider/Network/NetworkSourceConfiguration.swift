import Foundation

class NetworkSourceConfiguration: NSObject {
    
    @IBOutlet weak var infoReader: InfoReader!
    
    private static let apiKeyKey = "GIPHYTrendingEnddpointURL"
    private static let numberOfItemsToLoadPerPageKey = "NumberOfItemsPerPage"
    private static let numberOfPagesToLoadKey = "NumberOfPagesToLoad"
    
    var endpointURL: String {
        get {
            return infoReader.get(
                key: NetworkSourceConfiguration.apiKeyKey
            )
        }
    }
    
    var numberOfItemsPerPage: Int {
        get {
            return infoReader.get(
                key: NetworkSourceConfiguration.numberOfItemsToLoadPerPageKey
            )
        }
    }
    
    var numberOfPages: Int {
        get {
            return infoReader.get(
                key: NetworkSourceConfiguration.numberOfPagesToLoadKey
            )
        }
    }
}
