//
//  SelectorCell.swift
//  pryaniky.com
//
//  Created by Mihail on 04.03.2021.
//

import UIKit

class SelectorCell: UITableViewCell {

    @IBOutlet weak var tableView: UITableView!
    
    var countAnswer: Int!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        tableView.isScrollEnabled = false
        
        tableView.delegate = self
        tableView.dataSource = self
        
        registerCell()
    }
    
    
    private func registerCell() {
        let buttonCell = UINib(nibName: "ButtonCell", bundle: nil)
        
        tableView.register(buttonCell, forCellReuseIdentifier: "ButtonCell")
    }
}

extension SelectorCell: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countAnswer
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ButtonCell") as! ButtonCell
        
        
        
        return cell
    }

}
