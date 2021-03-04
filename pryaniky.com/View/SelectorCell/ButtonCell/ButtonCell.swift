//
//  ButtonCell.swift
//  pryaniky.com
//
//  Created by Mihail on 04.03.2021.
//

import UIKit

class ButtonCell: UITableViewCell {

    @IBOutlet weak var button: UIButton!
    
    
    override func awakeFromNib() {
        button.addTarget(self, action: #selector(tapButton), for: .touchUpInside)
        
        button.layer.borderWidth = 1
        button.layer.borderColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
        button.layer.cornerRadius = 25
    }
    
    private func showAlert() {
        
        let infoAlert = UIAlertController(title: "This is Button", message: "\(String(describing: button.titleLabel!.text!))", preferredStyle: .alert)
        
        let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
             //pass
          })
        infoAlert.addAction(ok)
        let rootViewController = UIApplication.shared.windows[0].rootViewController
        rootViewController?.present(infoAlert, animated: true, completion: nil)
    }
    
    @objc func tapButton(sender: UIButton!) {
        showAlert()
    }
    
}
