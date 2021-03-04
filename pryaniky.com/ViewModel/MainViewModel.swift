//
//  MainViewModel.swift
//  pryaniky.com
//
//  Created by Mihail on 04.03.2021.
//

import Foundation
import Alamofire

class MainViewModel: MainViewType {
    
    func getDataForRow(indexPath: Int) -> MainData {
        let item = viewArray[indexPath]
        
        for data in dataArray {
            if item == data.name {
                return data
            }
        }
        fatalError()
    }
    
    func getInfoAboutCell(indexPath: Int) -> String {
        let data = getDataForRow(indexPath: indexPath).data
        var result = ""
        
        if data.selectedId != nil {
            result += "SelectedID: \(String(describing: data.selectedId!))\n"
        }
        
        if data.text != nil {
            result += "Text: \(String(describing: data.text!))\n"
        }
        
        if data.url != nil {
            result += "URL: \(String(describing: data.url!))\n"
        }
        
        if data.variants != nil {
            result += "Variants: \(String(describing: data.variants!))\n"
        }
        
        return result
    }
    
    func numberOfRows() -> Int {
        return viewArray.count
    }
    
    private weak var delegate: MainViewModelDelegate?
    
    private var viewArray: [String] = []
    private var dataArray: [MainData] = []
    
    init(delegate: MainViewModelDelegate) {
        self.delegate = delegate
        makeRequest()
    }
    
    private func makeRequest() {
        AF.request("https://pryaniky.com/static/json/sample.json").response { response in
            switch response.result {
            case .success(let value):
                if let jsonModel = self.decodeJSON(value: value) {
                    self.setupViewArray(jsonModel: jsonModel)
                    self.setupDataArray(jsonModel: jsonModel)
                    self.delegate?.didDecodeJSON()
                }
                else {
                    print("Error!!! Can't decode JSON")
                }
            case .failure(let err):
                print(err)
            }
        }
    }
    
    private func decodeJSON(value: Data?) -> MenuModel? {
        let decoder = JSONDecoder()
        let menuModel = try? decoder.decode(MenuModel.self, from: value!)
        
        return menuModel
        
    }
    
    private func setupViewArray(jsonModel: MenuModel) {
        for view in jsonModel.view {
            viewArray.append(view)
        }
    }
    
    private func setupDataArray(jsonModel: MenuModel) {
        for data in jsonModel.data {
            dataArray.append(data)
        }
    }
}
