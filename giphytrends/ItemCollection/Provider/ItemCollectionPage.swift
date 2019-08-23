import Foundation

class ItemCollectionPage: NSObject {
    let index: Int
    let items: [Item]
    
    init(index: Int, items: [Item]) {
        self.index = index
        self.items = items
    }
}
