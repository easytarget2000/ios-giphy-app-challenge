import Foundation

class InfoReader: NSObject {
    
    var infoDictionary = Bundle.main.infoDictionary!
    
    func get<T>(key: String) -> T {
        return infoDictionary[key] as! T
    }
    
}
