import Foundation

class ItemCollectionViewModel: NSObject {
    
    @IBOutlet weak var provider: ItemCollectionProvider!
    let collectionWrapper = Dynamic(ItemCollection())
    private var collection: ItemCollection {
        get {
            return collectionWrapper.value
        }
    }
    var numberOfSections: Int {
        get {
            return collection.isEmpty ? 0 : 1
        }
    }
    
    func numberOfItemsInSection(_ sectionIndex: Int) -> Int {
        return collection.count
    }
    
    func fetchEntireCollection() {
        provider.getCollectionFromFastestSource { (collection) in
            self.collectionWrapper.value = collection
        }
    }
    
    func handleSelectionAtSection(_ sectionIndex: Int, index: Int) {
        
    }
    
}
