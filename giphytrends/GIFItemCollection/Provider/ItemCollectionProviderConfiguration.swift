import Foundation

protocol ItemCollectionProviderConfiguration: NSObjectProtocol {
    var numberOfItemsPerPage: Int { get }
    var numberOfPages: Int { get }
}
