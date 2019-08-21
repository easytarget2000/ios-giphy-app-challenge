import Alamofire

class GIFItemCollectionNetworkSource: NSObject, GIFItemCollectionSource {
    
    private static let apiKeyParameterKey = "api_key"
    private static let itemCountOffsetParameterKey = "offset"
    private static let itemCountLimitParameterKey = "limit"
    @IBOutlet weak var apiKeyStorage:
        GIFItemCollectionNetworkSourceAPIKeyStorage!
    @IBOutlet weak var configuration:
        GIFItemCollectionNetworkSourceConfiguration!
    @IBOutlet weak var parser: GIFItemCollectionNetworkResponseParser!
    
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
    private weak var delegate: GIFItemCollectionSourceDelegate?
    private var collection: GIFItemCollection!
    
    func getCollection(
        delegate: GIFItemCollectionSourceDelegate?
    ) {
        self.delegate = delegate
        collection = GIFItemCollection()
        
        for pageIndex in 0 ..< numberOfPages {
            getPage(pageIndex: pageIndex)
        }
    }
    
}

// MARK: - Implementations

extension GIFItemCollectionNetworkSource {
    
    private func getPage(pageIndex: Int) {
        let itemCountOffset = pageIndex * numberOfItemsPerPage
        let itemCountLimit = itemCountOffset + numberOfItemsPerPage
        let pageParameters: Parameters = [
            GIFItemCollectionNetworkSource.apiKeyParameterKey : apiKey,
            GIFItemCollectionNetworkSource
                .itemCountOffsetParameterKey : itemCountOffset,
            GIFItemCollectionNetworkSource
                .itemCountLimitParameterKey : itemCountLimit
        ]
        
        Alamofire
            .request(endpointURL, parameters: pageParameters)
            .validate()
            .responseJSON {
                (response) in
                guard let data = response.data else {
                    return
                }
                
                self.parser.parsePageData(data)
        }
    }
}
