//
//  MainViewType.swift
//  pryaniky.com
//
//  Created by Mihail on 04.03.2021.
//

import Foundation

protocol MainViewType {
    func numberOfRows() -> Int
    func takeDataForRow(indexPath: Int) -> MainData
}
