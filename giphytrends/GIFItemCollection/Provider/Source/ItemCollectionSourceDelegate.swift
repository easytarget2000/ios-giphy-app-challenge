import Foundation

@objc protocol ItemCollectionSourceDelegate: NSObjectProtocol {
    
    func collectionSource(
        _ collectionSource: ItemCollectionSource,
        didGetPage page: ItemCollectionPage
    )
}
