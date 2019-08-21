struct ItemCollectionPageNetworkResponse: Codable {
    
    let data: [ItemNetworkResponse]
    
    struct ItemNetworkResponse: Codable {
        
        let url: String
        let images: ItemImagesNetworkResponse
        
        struct ItemImagesNetworkResponse: Codable {
            
            let fixed_height_small: ItemImageNetworkResponse
            
            struct ItemImageNetworkResponse: Codable {
                
                let url: String
                
            }
        }
    }

}
