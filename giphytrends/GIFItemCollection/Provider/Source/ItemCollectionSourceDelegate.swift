import Foundation

@objc protocol ItemCollectionSourceDelegate: NSObjectProtocol {
    
    func collectionSource(
        _ collectionSource: ItemCollectionSource,
        didGetPage collectionPage: ItemCollectionPage,
        atIndex index: Int
    )
}
