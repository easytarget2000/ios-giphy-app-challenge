import Foundation

class ItemCollectionViewModel: NSObject {
    
    @IBOutlet weak var provider: ItemCollectionProvider!
    private let collectionWrapper = Dynamic(ItemCollection())
    
    func fetchEntireCollection() {
        provider.getCollectionFromFastestSource { (collection) in
            self.collectionWrapper.value = collection
        }
    }
}
