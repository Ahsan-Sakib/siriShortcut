//
//  Api.swift
//  Base Application
//
//  Created by Ahsanul Kabir on 18/2/21.
//  Copyright © 2021 sakibwrold. All rights reserved.
//

import Moya
import Alamofire

//MARK: Api request
//Add your api method with parameter you want to send
enum API  {

}

//func getBearer()->String{
//    if let accessToekn = UserDefaults.standard.object(forKey: accessToken){
//        return "bearer \(accessToekn)"
//    }
//    return ""
//}

extension API : TargetType {

    //MARK: Environment Setting
    //It is set depending on Project deployment target
    public var environmentBaseUrl:String{
//        switch NetworkManager.envManagement {
//        case .development: return "https://dev-lightcafe.bjitgroup.com/api/v1/"
//        case .staging: return "https://stg-lightcafe.bjitgroup.com/api/v1/"
//        case .production: return "https://api.qoffee.me/api/v1/"
//        }
        return "https://dev-lightcafe.bjitgroup.com/api/v1/"
    }

    //TODO: will remove after Global configure API integration
//    var imagePath:String{
//        let path = environmentBaseUrl.replacingOccurrences(of: "/api/v1/", with: "/")
//        return path
//    }

    var baseURL: URL {
        return URL(string:environmentBaseUrl)!
    }

    //MARK: Path for APi end
    //Set your path execpt base url accordingly
    var path: String {
        switch self {
            default : "mobile/user/profile/update"
        }
    }

    //MARK:Set your api method
    //@post,@get,@delete,@put
    var method: Moya.Method {
        switch self {
        default: return .get
        }
    }

    var sampleData: Data {
        return Data()
    }

    //MARK:Execute task of APi calling here
    var task: Task {
        switch self {
        default: return .requestPlain
        }
    }

    var parameters: [String: Any] {
        switch self {
        default:
            return ["":""]
        }
    }

    //MARK:Set header
    var headers: [String : String]? {
        switch self {
          //  return ["Authorization":getBearer(),"Content-type": "application/json" , "lang":selectedLanguage.localized]
        default:
            return ["Content-type": "application/json" , "Accept-Language":"en"]
        }
    }
}

