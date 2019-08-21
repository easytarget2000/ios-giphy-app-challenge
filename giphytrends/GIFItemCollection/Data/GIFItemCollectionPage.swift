import Foundation

class GIFItemCollectionPage: NSObject {
    let items: [GIFItem]
    
    init(items: [GIFItem]) {
        self.items = items
    }
}
