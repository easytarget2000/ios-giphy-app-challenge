import Alamofire

class ItemCollectionNetworkSource: NSObject, ItemCollectionSource {
    
    private static let apiKeyParameterKey = "api_key"
    private static let itemCountOffsetParameterKey = "offset"
    private static let itemCountLimitParameterKey = "limit"
    @IBOutlet weak var apiKeyStorage:
        ItemCollectionNetworkSourceAPIKeyStorage!
    @IBOutlet weak var parser: ItemCollectionNetworkResponseParser!
    @IBOutlet weak var configuration: ItemCollectionNetworkSourceConfiguration!
    private lazy var endpointURL: URL = {
        return URL(string: configuration.endpointURL)!
    }()
    private lazy var apiKey: String = {
        return apiKeyStorage.apiKey
    }()
    private weak var delegate: ItemCollectionSourceDelegate?
    
    func getCollectionPaginated(
        numberOfItemsPerPage: Int,
        numberOfPages: Int,
        delegate: ItemCollectionSourceDelegate?
    ) {
        self.delegate = delegate
        
        for pageIndex in 0 ..< numberOfPages {
            getPage(
                pageIndex: pageIndex,
                numberOfItemsPerPage: numberOfItemsPerPage
            )
        }
    }
    
}

// MARK: - Implementations

extension ItemCollectionNetworkSource {
    
    private func getPage(pageIndex: Int, numberOfItemsPerPage: Int) {
        let itemCountOffset = pageIndex * numberOfItemsPerPage
        let pageParameters: Parameters = [
            ItemCollectionNetworkSource.apiKeyParameterKey : apiKey,
            ItemCollectionNetworkSource
                .itemCountOffsetParameterKey : itemCountOffset,
            ItemCollectionNetworkSource
                .itemCountLimitParameterKey : numberOfItemsPerPage
        ]
        
        Alamofire
            .request(endpointURL, parameters: pageParameters)
            .validate()
            .responseJSON {
                (response) in
                guard let data = response.data else {
                    return
                }
                
                guard let items = self.parser.parsePageData(data) else {
                    return
                }
                
                self.handleItems(items, ofPage: pageIndex)
        }
    }
    
    private func handleItems(_ items: [Item], ofPage pageIndex: Int) {
//        delegate?.collectionSource(
//            self,
//            didGetItems: items,
//            forPage: pageIndex
//        )
    }
}
