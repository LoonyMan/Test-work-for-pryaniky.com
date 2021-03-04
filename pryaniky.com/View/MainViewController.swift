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

class MainViewController: UIViewController {
    
    private var mainViewModel: MainViewType!
    
    @IBOutlet weak var mainTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.prefersLargeTitles = true
        
        mainViewModel = MainViewModel(delegate: self)
        mainTableView.delegate = self
        mainTableView.dataSource = self
        mainTableView.contentInset = UIEdgeInsets(top: 25, left: 0, bottom: 25, right: 0)
        
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
    
    private func generateAlert(indexPath: IndexPath) {
        
        let aboutCell = mainViewModel.getInfoAboutCell(indexPath: indexPath.row)
        
        let data = mainViewModel.getDataForRow(indexPath: indexPath.row)
        
        let infoAlert = UIAlertController(title: "This is \(data.name)", message: "\(aboutCell)", preferredStyle: .alert)
        
        let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
             //pass
          })
        infoAlert.addAction(ok)
        showAlert(alertController: infoAlert)
    }
    
    private func configureCell(data: MainData, tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        
        if data.name == "hz" {
            let cell = tableView.dequeueReusableCell(withIdentifier: "TextCell") as! TextCell
            
            cell.label.text = data.data.text!
            
            return cell
        }
        
        if data.name == "picture" {
            let cell = tableView.dequeueReusableCell(withIdentifier: "PictureCell") as! PictureCell
            
            let url = URL(string: data.data.url!)
            
            let resource = ImageResource(downloadURL: url!, cacheKey: url!.absoluteString)
            cell.pictureImageView.kf.setImage(with: resource) { _ in
                tableView.reloadRows(at: [indexPath], with: .none)
            }

            cell.label.text = data.data.text!
            
            return cell
        }
        
        if data.name == "selector" {
            let cell = tableView.dequeueReusableCell(withIdentifier: "SelectorCell") as! SelectorCell
            
            cell.setDelegate(delegate: self)
            cell.countAnswer = data.data.variants?.count
            cell.variants = data.data.variants!
            
            return cell
        }
        
        fatalError()
    }
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        generateAlert(indexPath: indexPath)
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mainViewModel.numberOfRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let data = mainViewModel.getDataForRow(indexPath: indexPath.row)
        
        return configureCell(data: data,
                             tableView: tableView,
                             indexPath: indexPath)
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let data = mainViewModel.getDataForRow(indexPath: indexPath.row)
        
        if data.name == "selector" {
            return 60*3
        }
        return UITableView.automaticDimension
    }

}

extension MainViewController: MainViewModelDelegate, AlertShowDelegate {
    
    func showAlert(alertController: UIAlertController) {
        self.present(alertController, animated: true, completion: nil)
    }
    
    
    func didDecodeJSON() {
        mainTableView.reloadData()
    }
    
}
