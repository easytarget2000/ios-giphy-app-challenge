import Alamofire

class ItemCollectionNetworkSource: NSObject, ItemCollectionSource {
    
    private static let apiKeyParameterKey = "api_key"
    private static let itemCountOffsetParameterKey = "offset"
    private static let itemCountLimitParameterKey = "limit"
    @IBOutlet weak var apiKeyStorage:
        ItemCollectionNetworkSourceAPIKeyStorage!
    @IBOutlet weak var configuration:
        ItemCollectionNetworkSourceConfiguration!
    @IBOutlet weak var parser: ItemCollectionNetworkResponseParser!
    
    private lazy var endpointURL: URL = {
        return URL(string: configuration.endpointURL)!
    }()
    private lazy var apiKey: String = {
        return apiKeyStorage.apiKey
    }()
    private lazy var numberOfItemsPerPage: Int = {
        return configuration.numberOfItemsPerPage
    }()
    private lazy var numberOfPages: Int = {
        return configuration.numberOfPages
    }()
    private weak var delegate: ItemCollectionSourceDelegate?
    
    func getCollection(
        delegate: ItemCollectionSourceDelegate?
    ) {
        self.delegate = delegate
        
        for pageIndex in 0 ..< numberOfPages {
            getPage(pageIndex: pageIndex)
        }
    }
    
}

// MARK: - Implementations

extension ItemCollectionNetworkSource {
    
    private func getPage(pageIndex: Int) {
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
                
                guard let page = self.parser.parsePageData(data) else {
                    return
                }
                
                self.handlePage(page, atIndex: pageIndex)
        }
    }
    
    private func handlePage(
        _ page: ItemCollectionPage,
        atIndex pageIndex: Int
    ) {
        delegate?.collectionSource(
            self,
            didGetPage: page,
            atIndex: pageIndex
        )
    }
}
