struct ItemCollectionPageNetworkResponse: Codable {
    
    let data: [ItemNetworkResponse]
    
    struct ItemNetworkResponse: Codable {
        
        let images: ItemImagesNetworkResponse
        
        struct ItemImagesNetworkResponse: Codable {
            
            let fixed_height: ItemImageNetworkResponse
            let fixed_height_small_still: ItemImageNetworkResponse
            
            struct ItemImageNetworkResponse: Codable {
                
                let url: String
                
            }
        }
    }

}
