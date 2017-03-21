//
//  Router.swift
//  Peeqr
//
//  Created by East Agile on 12/12/16.
//  Copyright © 2016 node8. All rights reserved.
//

import Foundation

enum ApiEndpoint {
  case user
  case room

  var path: String {
    switch self {
    case .user:
      return "rooms/"
    case .room:
      return "questions/"
    }
  }
}

class Router {
  class func urlFor(_ endpoint: ApiEndpoint) -> String {
    return Secrets.Api.baseUrl + endpoint.path
  }
}
