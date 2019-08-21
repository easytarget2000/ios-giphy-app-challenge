import Foundation

@objc protocol GIFItemCollectionSourceDelegate: NSObjectProtocol {
    
    func collectionSource(
        _ collectionSource: GIFItemCollectionSource,
        didGetPage collectionPage: GIFItemCollectionPage,
        atIndex index: Int
    )
}
