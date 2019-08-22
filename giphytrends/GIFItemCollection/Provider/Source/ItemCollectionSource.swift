import Foundation

@objc protocol ItemCollectionSource: NSObjectProtocol {
    
    func getCollectionPaginated(
        numberOfItemsPerPage: Int,
        numberOfPages: Int,
        delegate: ItemCollectionSourceDelegate?
    )
    
}
