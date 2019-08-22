import Foundation

class ItemCollectionViewModel: NSObject {
    
    @IBOutlet weak var provider: ItemCollectionProvider!
    private let collectionWrapper = Dynamic(ItemCollection())!
    var collection: ItemCollection {
        get {
            return collectionWrapper.value
        }
    }
    var numberOfSections: Int {
        get {
            return collection.isEmpty ? 0 : 1
        }
    }
    
    func fetchEntireCollection() {
        provider.getCollectionFromFastestSource { (collection) in
            self.collectionWrapper.value = collection
        }
    }
    
}
