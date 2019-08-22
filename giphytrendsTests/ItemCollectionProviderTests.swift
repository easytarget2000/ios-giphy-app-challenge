import XCTest
@testable import giphytrends

class ItemCollectionProviderTests: XCTestCase {
    
    func testThat_RetrievedPagesAreAppendedInOrder() {
        let provider = ItemCollectionProvider()
        let page1 = ItemCollectionPage(index: 0, items: [])
        let page2 = ItemCollectionPage(index: 1, items: [])
        let page3 = ItemCollectionPage(index: 2, items: [])
        
        provider.handlePageRetrieved(page: <#T##ItemCollectionPage#>)
    }
}
