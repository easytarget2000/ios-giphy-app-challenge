import Foundation

@objc class GIFItemCollectionNetworkResponseParser: NSObject {
    
    var jsonDecoder: JSONDecoder = JSONDecoder()
    
    func parsePageData(_ data: Data) -> GIFItemCollectionPage? {
        var items = [GIFItem]()
        do {
            let responseCollection = try self.jsonDecoder.decode(
                GIFItemCollectionPageNetworkResponse.self,
                from: data
            )
            items = responseCollection.data.map({ (responseItem) -> GIFItem in
                return GIFItem(responseItem.)
            })
        } catch let error {
            NSLog(
                "ERROR: GIFItemCollectionNetworkSource: "
                    + error.localizedDescription
            )
            return nil
        }
        
        return GIFItemCollectionPage(items: items)
    }
}
