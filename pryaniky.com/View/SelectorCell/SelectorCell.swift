//
//  SelectorCell.swift
//  pryaniky.com
//
//  Created by Mihail on 04.03.2021.
//

import UIKit

class SelectorCell: UITableViewCell {

    @IBOutlet weak var tableView: UITableView!
    
    private var delegate: AlertShowDelegate?
    
    var variants: [Variants]!
    var countAnswer: Int!
    
    func setDelegate(delegate: AlertShowDelegate) {
        self.delegate = delegate
    }
    
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
    
    func showAlert(alertController: UIAlertController) {
        delegate?.showAlert(alertController: alertController)
    }
    
}

extension SelectorCell: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countAnswer
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ButtonCell") as! ButtonCell
        
        let variant = variants[indexPath.row]
        
        cell.button.setTitle("\(variant.id). \(variant.text)", for: .normal)
        
        return cell
    }

}
