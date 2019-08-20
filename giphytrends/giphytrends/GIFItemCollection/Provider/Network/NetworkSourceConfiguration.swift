import Foundation

class NetworkSourceConfiguration: NSObject {
    
    @IBOutlet weak var infoReader: InfoReader!
    
    private static let numberOfItemsToLoadPerPageKey = "NumberOfItemsPerPage"
    private static let numberOfPagesToLoadKey = "NumberOfPagesToLoad"
    
    var numberOfItemsPerPage: Int {
        get {
            return infoReader.getInt(
                key: NetworkSourceConfiguration.numberOfItemsToLoadPerPageKey
            )
        }
    }
    
    var numberOfPages: Int {
        get {
            return infoReader.getInt(
                key: NetworkSourceConfiguration.numberOfPagesToLoadKey
            )
        }
    }
}
