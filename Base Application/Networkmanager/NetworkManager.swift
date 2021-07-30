//
//  NetworkManager.swift
//  Base Application
//
//  Created by Ahsanul Kabir on 18/2/21.
//  Copyright © 2021 sakibwrold. All rights reserved.
//

import Foundation
import Moya
import Alamofire

protocol Networkable {
    var provider : MoyaProvider<API> { get}
}

struct NetworkManager: Networkable{

    static let sharedProvider = NetworkManager()

    init(){}

    //MARK: Initiaze provider
    var provider: MoyaProvider<API> = MoyaProvider()

//    static var envManagement:APIEnvironment {
//
//        if let targetName:APIEnvironment = APIEnvironment(rawValue: Bundle.main.infoDictionary?["TargetName"] as! String) {
//            return targetName
//        }else{
//            return .development
//        }
//    }

    //MARK: - debugPrint server Response
    func printServerResponse(data:Data, apiName:String) {
        let str = String(decoding: data, as: UTF8.self)
        DebugLog(message: "\n\n\n")
        DebugLog(message: "##################### Response From Server #####################")
        DebugLog(message:         "######                      \(apiName)                      #######")
        DebugLog(message:  "########################################################################\n\n")
        DebugLog(message: str)
        DebugLog(message: "\n\n##################### Response End Here #####################\n\n\n")
    }
}

//class NetworkConnectionManager {
//
//    //shared instance
//    static let shared = NetworkConnectionManager()
//
//    let reachabilityManager = NetworkReachabilityManager()
//
//
//    func startNetworkReachabilityObserver() {
//    let connectionStatusView = InternetConnectionStatusView.init()
//
//    reachabilityManager?.startListening(onUpdatePerforming: {networkStatusListener in
//            debugPrint("Network Status Changed:", networkStatusListener)
//               switch networkStatusListener {
//               case .notReachable:
//                    connectionStatusView.noConnectionViewShow()
//                    debugPrint("The network is not reachable")
//                    connectionStatusView.noConnectionViewShow()
//                   case .unknown :
//                        debugPrint("It is unknown whether the network is reachable")
//                   connectionStatusView.noConnectionViewRemove()
//                   NotificationCenter.default.post(name: .networkModifier,
//                                                   object: nil,
//                                                   userInfo: nil )
//
//                    case .reachable(.ethernetOrWiFi):
//                       connectionStatusView.noConnectionViewRemove()
//                       NotificationCenter.default.post(name: .networkModifier,
//                                                       object: nil,
//                                                       userInfo: nil )
//
//                        debugPrint("The network is reachable over the WiFi connection")
//                    case .reachable(.cellular):
//                       connectionStatusView.noConnectionViewRemove()
//                       NotificationCenter.default.post(name: .networkModifier,
//                                                       object: nil,
//                                                       userInfo: nil )
//
//                        debugPrint("The network is reachable over the WWAN connection")
//                    }
//        })
//    }
//}
