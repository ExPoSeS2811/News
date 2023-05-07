//
//  NetworkingError.swift
//  News
//
//  Created by MacBook Pro 13 2019 on 5/5/23.
//

import Foundation

enum NetworkingError: Error {
    case networkingError(_ error: Error)
    case unknown
}
