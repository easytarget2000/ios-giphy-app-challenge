import XCTest
@testable import giphytrends

class ItemCollectionProviderTests: XCTestCase {
    
    func testThat_RetrievedPagesAreAppendedInOrder() {
        let provider = ItemCollectionProvider()
        provider.configuration = ItemCollectionProviderMockConfiguration()
        
        let page1 = ItemCollectionPage(index: 0, items: [mockItem()])
        let page2 = ItemCollectionPage(index: 1, items: [mockItem()])
        let page3 = ItemCollectionPage(index: 2, items: [mockItem()])
        
        provider.handlePageRetrieved(page: page1)
        let page1Collection = provider.collectionWithoutPageGaps()
        XCTAssert(page1Collection.count == page1.items.count)
        
        provider.handlePageRetrieved(page: page3)
        let page1Without3Collection = provider.collectionWithoutPageGaps()
        XCTAssert(page1Without3Collection.count == page1.items.count)
        
        provider.handlePageRetrieved(page: page2)
        let fullCollection = provider.collectionWithoutPageGaps()
        let expectedItemCount
            = page1.items.count + page2.items.count + page3.items.count
        XCTAssert(fullCollection.count == expectedItemCount)
    }
    
    private func mockItem() -> Item {
        return Item(fullURL: "", previewURL: "")
    }
    
    private class ItemCollectionProviderMockConfiguration:
        NSObject, ItemCollectionProviderConfiguration {
        
        var numberOfPages: Int = 3
        var numberOfItemsPerPage: Int = 1
    }
}
