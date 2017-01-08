//
//  Response.swift
//  Toolkit
//
//  Created by Avario on 6/01/17.
//  Copyright © 2017 Avario. All rights reserved.
//

import Foundation

typealias Response<T> = (_ success: Bool, _ response: Result<T?, ResponseError>) -> Void

struct ResponseError: Error {
    var code: String
    var message: String
}
