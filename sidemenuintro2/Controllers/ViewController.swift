//
//  ViewController.swift
//  sidemenuintro2
//
//  Created by IwasakIYuta on 2021/09/23.
//

import UIKit
import SideMenu

class ViewController: UIViewController {
    
    var menu: SideMenuNavigationController? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        menusetup()
        
    }
    @IBAction func didtapmenu() {
        view.backgroundColor = UIColor(displayP3Red: 33/255,
                                       green: 33/255,
                                       blue: 33/255,
                                       alpha: 2 )
        present(menu!, animated: true, completion: nil)
        
    }
    private func menusetup() {
        weak var sideMenuViewController = storyboard?.instantiateViewController(withIdentifier: "SideMenu") as? SideMenuViewController
        menu = SideMenuNavigationController(rootViewController: sideMenuViewController!)
        menu?.leftSide = true
        menu?.settings = makeSettings()
        SideMenuManager.default.leftMenuNavigationController = menu
        SideMenuManager.default.addPanGestureToPresent(toView: self.view)
        
        
    }
    private func makeSettings() -> SideMenuSettings {
        var settings = SideMenuSettings()
        //動作を指定
        settings.presentationStyle = .menuSlideIn
        //メニューの陰影度
        settings.presentationStyle.onTopShadowOpacity = 1.0
        //ステータスバーの透明度
        settings.statusBarEndAlpha = 0
        return settings
    }
    
    
}

