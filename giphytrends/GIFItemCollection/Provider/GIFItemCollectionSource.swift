import Foundation

@objc protocol GIFItemCollectionSource: NSObjectProtocol {
    
    func getCollection(delegate: GIFItemCollectionSourceDelegate?)
    
}
