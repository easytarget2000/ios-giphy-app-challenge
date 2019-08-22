import Foundation

@objc protocol ItemCollectionProviderConfiguration: NSObjectProtocol {
    var numberOfItemsPerPage: Int { get }
    var numberOfPages: Int { get }
}
