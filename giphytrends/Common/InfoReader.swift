import Foundation

class InfoReader: NSObject {
    
    var infoDictionary = Bundle.main.infoDictionary!
    
    func getInt(key: String) -> Int {
        return infoDictionary[key] as! Int
    }
    
}
