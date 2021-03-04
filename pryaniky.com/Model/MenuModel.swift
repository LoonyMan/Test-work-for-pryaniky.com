//
//  MenuModel.swift
//  pryaniky.com
//
//  Created by Mihail on 04.03.2021.
//

import Foundation

struct MenuModel: Codable {
    struct MainData: Codable {
        struct SubData: Codable {
            struct Variants: Codable {
                let id: Int
                let text: String
            }
            let text: String?
            let url: String?
            let selectedId: Int?
            let variants: [Variants]?
        }
        let name: String
        let data: SubData
    }
    let data: [MainData]
    let view: [String]
    
//    func moveme() {
//        AF.request("https://pryaniky.com/static/json/sample.json").response { response in
//            switch response.result {
//            case .success(let value):
//                let decoder = JSONDecoder()
//                let stat = try! decoder.decode(MenuModel.self, from: value!)
//                print(stat.data[0])
//            case .failure(let err):
//                print(err)
//            }
//        }
//    }
}


