//
//  SideMenuViewController.swift
//  sidemenuintro2
//
//  Created by IwasakIYuta on 2021/09/23.
//

import UIKit

class SideMenuViewController: UIViewController {
    
    private var menu = ["test1","test2","test3"]
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var accountLabel: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
         let vc = storyboard?.instantiateViewController(withIdentifier: "ViewController") as? ViewController
        vc?.view.backgroundColor =  UIColor(displayP3Red: 33/255,
                                            green: 33/255,
                                            blue: 33/255,
                                            alpha: 2 )
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self
      
        tableView.scrollsToTop = false
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
extension SideMenuViewController: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menu.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = menu[indexPath.row]
        
        return cell
    }
    
    
}

