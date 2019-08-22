import Foundation

class ItemCollectionProviderInfoConfiguration:
NSObject, ItemCollectionProviderConfiguration {
    
    private static let numberOfItemsToLoadPerPageKey = "NumberOfItemsPerPage"
    private static let numberOfPagesToLoadKey = "NumberOfPagesToLoad"
    @IBOutlet weak var infoReader: InfoReader!
    
    var numberOfItemsPerPage: Int {
        get {
            return infoReader.get(
                key: ItemCollectionProviderInfoConfiguration
                    .numberOfItemsToLoadPerPageKey
            )
        }
    }
    
    var numberOfPages: Int {
        get {
            return infoReader.get(
                key: ItemCollectionProviderInfoConfiguration
                    .numberOfPagesToLoadKey
            )
        }
    }
}
