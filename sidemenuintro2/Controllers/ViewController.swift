//
//  ViewController.swift
//  sidemenuintro2
//
//  Created by IwasakIYuta on 2021/09/23.
//

import UIKit
import SideMenu

class ViewController: UIViewController, SideMenuViewControllerDelegate {
    
    private let coverView: UIView = {
        let mainBoundSize: CGSize = UIScreen.main.bounds.size
        let mainFrame = CGRect(x: 0, y: 0, width: mainBoundSize.width, height: mainBoundSize.height)
        
        let view = UIView()
        view.frame = mainFrame
        view.backgroundColor = UIColor(white: 0, alpha: 0.3)
        return view
    }()
    func closeSideMenu() {
        
    }
    
    func didSelectMeunItem(name: SideMenuItem) {
        menu?.dismiss(animated: true, completion:nil)
        //閉じた時に移動する
        
        switch name {
            
        case .useGuide:
            view.backgroundColor = .red
        case .signOut:
            view.backgroundColor = .blue
        case .contact:
            view.backgroundColor = .green
        }
    }
    
    
    private var menu: SideMenuNavigationController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        menusetup()
        
    }
    @IBAction func didtapmenu() {
        //view.backgroundColor = .darkGray
        present(menu!, animated: true)
        
    }
    private func menusetup() {
        weak var sideMenuViewController = storyboard?.instantiateViewController(withIdentifier: "SideMenu") as? SideMenuViewController
        
        sideMenuViewController?.delegate = self
        menu = SideMenuNavigationController(rootViewController: sideMenuViewController!)
        menu?.leftSide = true
        menu?.setNavigationBarHidden(true, animated: false)
        menu?.settings = makeSettings()
        SideMenuManager.default.leftMenuNavigationController = menu
        SideMenuManager.default.addPanGestureToPresent(toView: self.view)
        
    }
    private func makeSettings() -> SideMenuSettings {
        var settings = SideMenuSettings()
        //動作を指定
        settings.presentationStyle = .menuSlideIn
        //メニューの陰影度
        settings.presentationStyle.onTopShadowOpacity = 3
        //ステータスバーの透明度
        settings.statusBarEndAlpha = 0
        settings.dismissWhenBackgrounded = true
        settings.dismissOnPresent = true
        
        return settings
    }
    
    
}
extension ViewController: SideMenuNavigationControllerDelegate {
    
    func sideMenuWillAppear(menu: SideMenuNavigationController, animated: Bool) {
        navigationController?.view.addSubview(coverView)
    }
    
    func sideMenuWillDisappear(menu: SideMenuNavigationController, animated: Bool) {
        coverView.removeFromSuperview()
    }
}

