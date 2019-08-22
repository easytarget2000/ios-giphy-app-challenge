import XCTest
@testable import giphytrends

class ItemCollectionNetworkResponseParserTests {
    
    let sampleJSONFileName = "ItemCollectionSampleJSON"
    
    func testThat_PageDataIsParsedCorrectly() {
        let data = readSampleJSON()
        let parser = ItemCollectionNetworkResponseParser()
        
        guard let page = parser.parsePageData(data, pageIndex: 5) else {
            XCTFail()
            return
        }
        
        XCTAssert(page.index == 5)
    }
    
    private func readSampleJSON() -> Data {
        return Data()
    }
}
