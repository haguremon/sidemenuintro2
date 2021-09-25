//
//  SideMenuViewController.swift
//  sidemenuintro2
//
//  Created by IwasakIYuta on 2021/09/23.
//

import UIKit
protocol SideMenuViewControllerDelegate: AnyObject {
    func didSelectMeunItem(name: SideMenuItem)
    func closeSideMenu()
}
enum SideMenuItem: String,CaseIterable{
    case useGuide = "使い方ガイド"
    case signOut = "最初の画面に戻る"
    case contact = "問い合わせ"
}
class SideMenuViewController: UIViewController {
    
    private let sideMenuItems: [SideMenuItem] = SideMenuItem.allCases
    
    weak var delegate: SideMenuViewControllerDelegate?
    
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
        tableView.isScrollEnabled = false
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

//MRAK: -TableView　Configur
extension SideMenuViewController: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sideMenuItems.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = sideMenuItems[indexPath.row].rawValue
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //デリゲートを使ってやり取りする
        tableView.deselectRow(at: indexPath, animated: true)
        let selectItem = sideMenuItems[indexPath.row]
        //ここでの通知をViewControllernに伝えてその内容をViewControllerでやる
        delegate?.didSelectMeunItem(name: selectItem)
        print("tap")
    }
    
    
}

