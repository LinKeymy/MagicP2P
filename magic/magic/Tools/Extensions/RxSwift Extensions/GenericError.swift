import Foundation
import SwiftyJSON
import Moya


//final class GenericError: NSObject,JSONAbleType {
//    let detail: [String:AnyObject]
//    let message: String
//    let type: String
//    
//    init(type: String, message: String, detail: [String:AnyObject]) {
//        self.detail = detail
//        self.message = message
//        self.type = type
//    }
//    
//    static func fromJSON(_ json:[String: Any]) -> GenericError {
//        let json = JSON(json)
//        
//        let type = json["type"].stringValue
//        let message = json["message"].stringValue
//        var detailDictionary = json["detail"].object as? [String: AnyObject]
//        
//        detailDictionary = detailDictionary ?? [:]
//        return GenericError(type: type, message: message, detail: detailDictionary!)
//    }
//}
//
//protocol JSONAbleType {
//    static func fromJSON(_: [String: Any]) -> Self
//}
//
//
//extension NSError {
//
//    func serverError() -> NSString {
//        if let errorJSON = userInfo["data"] as? [String: AnyObject] {
//            let error =  GenericError.fromJSON(errorJSON)
//            return "\(error.message) - \(error.detail) + \(error.detail)" as NSString
//        } else if let response = userInfo["data"] as? Response {
//            let stringData = NSString(data: response.data, encoding: String.Encoding.utf8.rawValue)
//            return "Status Code: \(response.statusCode), Data Length: \(response.data.count), String Data: \(String(describing: stringData))" as NSString
//        }
//
//        return "\(userInfo)" as NSString
//    }
//}
