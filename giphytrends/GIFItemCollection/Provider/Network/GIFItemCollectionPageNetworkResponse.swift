struct GIFItemCollectionPageNetworkResponse: Codable {
    
    let data: [GIFItemNetworkResponse]
    
    struct GIFItemNetworkResponse: Codable {
        
        let url: String
        let images: GIFItemImagesNetworkResponse
        
        struct GIFItemImagesNetworkResponse: Codable {
            
            let fixed_height_small: GIFItemImageNetworkResponse
            
            struct GIFItemImageNetworkResponse: Codable {
                
                let url: String
                
            }
        }
    }

}
