import Foundation

class NetworkLoaderConfiguration: NSObject {
    
    @IBOutlet weak var infoReader: InfoReader!
    
    private static let numberOfItemsToLoadPerPageKey = "NumberOfItemsPerPage"
    private static let numberOfPagesToLoadKey = "NumberOfPagesToLoad"
    
    var numberOfItemsPerPage: Int {
        get {
            return infoReader.getInt(
                key: NetworkLoaderConfigurationReader
                    .numberOfItemsToLoadPerPageKey
            )
        }
    }
    
    var numberOfPages: Int {
        get {
            return infoReader.getInt(
                key: NetworkLoaderConfigurationReader.numberOfPagesToLoadKey
            )
        }
    }
}
