//
//  ResponseArray.swift
//  crecreProject
//
//  Created by 황채연 on 11/07/2019.
//  Copyright © 2019 하준혁. All rights reserved.
//

struct ResponseArray<T: Codable>: Codable {
    let status: Int
    let success: Bool
    let message: String
    let data: [T]?
}
