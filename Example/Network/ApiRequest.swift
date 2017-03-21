//
//  ApiRequest.swift
//  Peeqr
//
//  Created by East Agile on 12/12/16.
//  Copyright © 2016 node8. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
import ReactiveAlamofire
import ReactiveKit

class ApiRequest {
  
  class func loadUser(user: String) -> Signal<Void, NSError> {
    let parameters = [
      "name": user
    ]
    return requestTo(endpoint: .user, method: .post, parameters: parameters).flatMapLatest { RoomJSONParser($0).toSignal() }
  }
  
  class func loadUser() -> Signal<User, NSError> {
    return requestTo(endpoint: .user, method: .get, parameters: nil).flatMapLatest { UserJSONParser($0).toSignal() }
  }
}

extension ApiRequest {
  
  class func requestTo(endpoint: ApiEndpoint, method: HTTPMethod, parameters: [String: Any]?, prefixUrl: String = "") -> Signal<JSON, NSError> {
    UIApplication.shared.isNetworkActivityIndicatorVisible = true
    var headers: HTTPHeaders?
    if let token =  Persistence.shared.accessToken {
      headers = ["Authorization": "Token \(token)"]
    }
    return Alamofire.request(Router.urlFor(endpoint) + prefixUrl, method: method, parameters: parameters, headers: nil)
      .toJSONSignal()
      .map {
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
        return JSON($0)
      }
      .mapError { (error) -> NSError in
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
        return error
      }
      .flatMapLatest { ErrorParser($0).toSignal() }
  }
}
