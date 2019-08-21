class ItemCollection {
    
    var pages = [ItemCollectionPage?]()
    var numberOfItems: Int {
        get {
            return pages.reduce(
                into: 0,
                { (itemsCounter, page) in
                    guard let page = page else {
                        return
                    }
                    itemsCounter += page.items.count
                }
            )
        }
    }
    
    func getItemAtIndex(_ index: Int) -> Item? {
        guard index >= 0 else {
            return nil
        }
        
        var itemCounter = 0
        for page in pages {
            guard let items = page?.items else {
                continue
            }
            
            itemCounter += items.count
            if itemCounter >= index {
                let indexInPage = items.count + (index - itemCounter)
                return items[indexInPage]
            }
        }
        
        return nil
    }
}
