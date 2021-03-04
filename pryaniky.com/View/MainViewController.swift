//
//  ViewController.swift
//  pryaniky.com
//
//  Created by Mihail on 04.03.2021.
//

//https://pryaniky.com/static/json/sample.json

import UIKit
import Alamofire
import Kingfisher

class ViewController: UIViewController {
    
    @IBOutlet weak var mainTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainTableView.delegate = self
        mainTableView.dataSource = self
        
        registerNib()
    }
    
    private func registerNib() {
        let pictureCell = UINib(nibName: "PictureCell", bundle: nil)
        let textCell = UINib(nibName: "TextCell", bundle: nil)
        let selectorCell = UINib(nibName: "SelectorCell", bundle: nil)
        
        mainTableView.register(pictureCell, forCellReuseIdentifier: "PictureCell")
        mainTableView.register(textCell, forCellReuseIdentifier: "TextCell")
        mainTableView.register(selectorCell, forCellReuseIdentifier: "SelectorCell")
    }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "PictureCell") as! PictureCell
            
            let url = URL(string: "https://pryaniky.com/static/img/logo-a-512.png")
            
            let resource = ImageResource(downloadURL: url!, cacheKey: url!.absoluteString)
            cell.pictureImageView.kf.setImage(with: resource) { _ in
                tableView.reloadRows(at: [indexPath], with: .none)
            }

            cell.label.text = "HelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHello"
            
            return cell
        }
        
        if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "TextCell") as! TextCell
            
            cell.label.text = "HelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHello"
            
            return cell
        }
        
        if indexPath.row == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "SelectorCell") as! SelectorCell
            
            cell.countAnswer = 3
            
            
            return cell
        }
        
        let cell = UITableViewCell()
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 2 {
            return 60*3
        }
        return UITableView.automaticDimension
    }

}

