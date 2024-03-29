import Foundation

@objc class ItemCollectionNetworkResponseParser: NSObject {
    
    var jsonDecoder: JSONDecoder = JSONDecoder()
    
    func parsePageData(_ data: Data, pageIndex: Int) -> ItemCollectionPage? {
        var items: [Item]
        do {
            let responseCollection = try self.jsonDecoder.decode(
                ItemCollectionPageNetworkResponse.self,
                from: data
            )
            items = responseCollection.data.map({ (responseItem) -> Item in
                let fullURL = responseItem.images.fixed_height.url
                let previewURL
                    = responseItem.images.fixed_height_small_still.url
                return Item(fullURL: fullURL, previewURL: previewURL)
            })
        } catch let error {
            NSLog(
                "ERROR: ItemCollectionNetworkSource: "
                    + error.localizedDescription
            )
            return nil
        }
        
        return ItemCollectionPage(index: pageIndex, items: items)
    }
}
