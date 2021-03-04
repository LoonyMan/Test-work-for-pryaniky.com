//
//  MenuModel.swift
//  pryaniky.com
//
//  Created by Mihail on 04.03.2021.
//

import Foundation

struct MenuModel: Codable {
    let data: [MainData]
    let view: [String]
}

struct MainData: Codable {
    let name: String
    let data: SubData
}

struct SubData: Codable {
    let text: String?
    let url: String?
    let selectedId: Int?
    let variants: [Variants]?
}

struct Variants: Codable {
    let id: Int
    let text: String
}
