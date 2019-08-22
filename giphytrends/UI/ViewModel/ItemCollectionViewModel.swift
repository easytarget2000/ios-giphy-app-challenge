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
    
    func populateCell(
        _ cell: ItemCollectionCell,
        atIndexPath indexPath: IndexPath
    ) {
        let item = collection[indexPath.row]
        let previewURL = URL(string: item.previewURL)
        cell.animatedImageView.sd_setImage(with: previewURL, completed: nil)
    }
    
}
