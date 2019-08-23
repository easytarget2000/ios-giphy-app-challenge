import Foundation

class ItemDetailViewModel: NSObject {
    
    var item: Item!
    
    var fullGIFUrl: URL? {
        get {
            return URL(string: item.fullURL)
        }
    }
}
