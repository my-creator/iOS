//
//  NetworkResult.swift
//  crecreProject
//
//  Created by 황채연 on 11/07/2019.
//  Copyright © 2019 하준혁. All rights reserved.
//
// 통신의 상태에 대한 분기 코드입니다.

enum NetworkResult<T> {
    case success(T)
    case requestErr(T)
    case pathErr
    case serverErr
    case networkFail
}
