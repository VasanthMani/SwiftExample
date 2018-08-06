//
//  ViewController.swift
//  ExampleSwift
//
//  Created by Manikandan Vasanth on 03/08/18.
//  Copyright © 2018 Manikandan. All rights reserved.
//

import UIKit
import Alamofire
import SVProgressHUD

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var displayTableView: UITableView!
    
    var totalDataArr : NSMutableArray = NSMutableArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.getdisDetails()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //TableviewCell Register
    func initalSetup()
    {
        self.displayTableView.delegate = self
        self.displayTableView.dataSource = self
        
        //self.moviesCollectionView.register(MoviesCell.self, forCellWithReuseIdentifier: "MoviesCell")
        // self.moviesCollectionView.register(UINib(nibName: "MoviesCell", bundle: nil), forCellWithReuseIdentifier: "MoviesCell")
        
        self.displayTableView.register(TableDetailCell.self, forCellReuseIdentifier: "TableDetailCell")
        
        self.displayTableView.register(UINib(nibName: "TableDetailCell", bundle: nil), forCellReuseIdentifier: "TableDetailCell")
    }
    //Get Data From API Calling
    func getdisDetails()
    {
        
        SVProgressHUD.show(withStatus: NSLocalizedString("Loading", comment: ""))
        
        
        
        
        let urlString = String(format: "https://dl.dropboxusercontent.com/s/2iodh4vg0eortkl/facts.json")
        
        print(urlString)
        
    
        Alamofire.request(urlString.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseString {
            response in
            switch response.result {
            case .success:
                
                print(response)
                if let result = response.result.value{
                    
                    let JSON = result as NSString
                   
//                    let newStr = String(data: JSON as Data, encoding: .utf8)

//                    totalDataArr = (newStr as Array)
                    
                    
//                    print(newStr as Any)
                    
                    DispatchQueue.main.async(execute: {
                        
//                        self.displayTableView.reloadData()
                        SVProgressHUD.dismiss()
                        
                        
                    })
                    
                }
                
                break
            case .failure(let error):
                
                SVProgressHUD.dismiss()
                print(response.data ?? "")
                
                print(response)
                print(error)
                
                
                self.showAlertMessage(NSLocalizedString("Server_Alert", comment: ""), title: "", ok: NSLocalizedString("OK_Title", comment: ""), cancel: nil)
            }
        }
        
    }
    
    //TableView Implementation
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        //        if(self.decideAPI == 1){
        //            return self.leisureArray.count
        //        }else{
        return 10
        //        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let reuseIdentifier = "TableDetailCell"
        let cell:TableDetailCell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath as IndexPath) as! TableDetailCell
        
        
        cell.selectionStyle = .none
        
        //        if self.decideAPI == 1 {
        //             cell.cinfigureCell(withEventDetails: self.leisureArray.object(at: indexPath.row) as! NSDictionary)
        //        }else{
//        cell.cinfigureCell(withEventDetails: self.eventsArray.object(at: indexPath.row) as! NSDictionary)
        //        }
        
        return cell
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
       
    }
    
    //Show Alert Message
    func showAlertMessage(_ msg: String?, title: String?, ok okTitle: String?, cancel cancelTitle: String?) {
        let controller = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        
        controller.view.tintColor = UIColor(red: 127.0 / 255.0, green: 96.0 / 255.0, blue: 235.0 / 255.0, alpha: 1.0)
        if okTitle != nil {
            let ok = UIAlertAction(title: okTitle, style: .default, handler: {(_ action: UIAlertAction?) -> Void in
                self.okButtonClicked()
            })
            controller.addAction(ok)
        } else {
            //  NSLog(@"nil");
        }
        
        if cancelTitle != nil {
            let cancel = UIAlertAction(title: cancelTitle, style: .default, handler: {(_ action: UIAlertAction?) -> Void in
                self.cancelButtonClicked()
            })
            controller.addAction(cancel)
        } else {
            // NSLog(@"nil");
        }
        
        DispatchQueue.main.async(execute: {() -> Void in
            self.present(controller, animated: true) {() -> Void in }
        })
    }
    
    func okButtonClicked()  {
        
    }
    
    func cancelButtonClicked()  {
        
    }
    
}

