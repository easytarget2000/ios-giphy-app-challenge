import Foundation

@objc protocol GIFItemCollectionSourceDelegate: NSObjectProtocol {
    func collectionSource(
        _ collectionSource: GIFItemCollectionSource,
        didGetCollection collection: GIFItemCollection
    )
}
