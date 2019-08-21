import Foundation

class ItemCollectionProviderConfiguration: NSObject {
    
    private static let numberOfItemsToLoadPerPageKey = "NumberOfItemsPerPage"
    private static let numberOfPagesToLoadKey = "NumberOfPagesToLoad"
    @IBOutlet weak var infoReader: InfoReader!
    
    var numberOfItemsPerPage: Int {
        get {
            return infoReader.get(
                key: ItemCollectionProviderConfiguration
                    .numberOfItemsToLoadPerPageKey
            )
        }
    }
    
    var numberOfPages: Int {
        get {
            return infoReader.get(
                key: ItemCollectionProviderConfiguration
                    .numberOfPagesToLoadKey
            )
        }
    }
}
