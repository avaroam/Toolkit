//
//  Response.swift
//  Toolkit
//
//  Created by Avario on 6/01/17.
//  Copyright © 2017 Avario. All rights reserved.
//

import Foundation

typealias Response<T> = (_ success: Bool, _ response: Result<T?, ResponseError>) -> Void

public struct ResponseError: Error {
    var code: Int
    var message: String
}
