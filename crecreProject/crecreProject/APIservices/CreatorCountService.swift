//
//  CreatorCountService.swift
//  crecreProject
//
//  Created by 황채연 on 12/07/2019.
//  Copyright © 2019 하준혁. All rights reserved.
//

import Foundation
import Alamofire

struct CreatorCountService{
    
    static let shared = CreatorCountService()
    func getCreatorCnt( completion: @escaping (NetworkResult<Any>) -> Void) {
        
        let URL = APIConstants.CreatorCntURL
        //"/\(creator_name)"
        
        let header: HTTPHeaders = [
            "Content-Type" : "application/json"
        ]
        
        Alamofire.request(URL, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: header)
            .responseData { response in
                
                switch response.result {
                    
                case .success:
                    if let value = response.result.value {
                        
                      
                        if let status = response.response?.statusCode {
                                    print("count",status)
                            switch status {
                                
                            case 200:
                                do {
                                    let decoder = JSONDecoder()
                                    decoder.keyDecodingStrategy = .convertFromSnakeCase
                                    let result = try decoder.decode(ResponseArray<Result>.self, from: value)
                                    
                                    
                                    switch result.success {
                                        
                                    case true:
                                        completion(.success(result.data!))
                                        
                                    case false:
                                        completion(.requestErr(result.message))
                                    }
                                } catch {
                                    
                                    completion(.pathErr)
                                }
                                
                            case 400:
                                completion(.pathErr)
                            case 500:
                                completion(.serverErr)
                                
                            default:
                                break
                            }
                        }
                    }
                    break
                    
                case .failure(let err):
                    
                    print(err.localizedDescription)
                    completion(.networkFail)
                    break
                }
        }
        
        
    }
}
