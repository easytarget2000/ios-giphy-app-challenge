import Foundation

class ItemCollectionNetworkSourceConfiguration: NSObject {
    
    private static let apiKeyKey = "GIPHYTrendingEndpointURL"
    @IBOutlet weak var infoReader: InfoReader!
    
    var endpointURL: String {
        get {
            return infoReader.get(
                key: ItemCollectionNetworkSourceConfiguration.apiKeyKey
            )
        }
    }
}
