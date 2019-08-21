import Foundation

@objc protocol ItemCollectionSource: NSObjectProtocol {
    
    func getCollection(delegate: ItemCollectionSourceDelegate?)
    
}
