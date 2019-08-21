import Foundation

@objc class ItemCollectionNetworkResponseParser: NSObject {
    
    var jsonDecoder: JSONDecoder = JSONDecoder()
    
    func parsePageData(_ data: Data) -> [Item]? {
        var items: [Item]?
        do {
            let responseCollection = try self.jsonDecoder.decode(
                ItemCollectionPageNetworkResponse.self,
                from: data
            )
            items = responseCollection.data.map({ (responseItem) -> Item in
                let fullURL = responseItem.url
                let previewURL = responseItem.images.fixed_height_small.url
                return Item(fullURL: fullURL, previewURL: previewURL)
            })
        } catch let error {
            NSLog(
                "ERROR: ItemCollectionNetworkSource: "
                    + error.localizedDescription
            )
        }
        
        return items
    }
}
