//
//  ViewController.swift
//  MMDrawerSampleSwift2
//
//  Created by ashida on 2016/06/26.
//  Copyright © 2016年 v-force.co.jp. All rights reserved.
//

import UIKit
import MMDrawerController

class MainViewController: UIViewController {
    /// 画面1へ遷移するためのボタン
    @IBOutlet weak var btnToView1: UIButton!
    /// 画面2へ遷移するためのボタン
    @IBOutlet weak var btnToView2: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // サイドメニューを表示するためのボタンをナビゲーションバーに追加する
        let btnNavLeft = UIBarButtonItem(title: "", style: .Plain, target: self, action: #selector(MainViewController.toggleSideMenu(_:)))
        btnNavLeft.title = "menu"
        btnNavLeft.tag = 1
        self.navigationController?.navigationBar.topItem?.leftBarButtonItem = btnNavLeft
    }
    
    /**
     ナビゲーションバーのmenuボタンをクリックしたときにサイドバーを開く
     
     - parameter sender: menuボタン
     */
    func toggleSideMenu(sender: UIButton) {
        let appDelegate:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        appDelegate.centerContainer!.toggleDrawerSide(MMDrawerSide.Left,animated: true, completion:nil)
    }
    
    /**
     自身のSegueを使って画面1へ移動する
     
     - parameter sender: btnToView1
     */
    @IBAction func toView1(sender: UIButton) {
        performSegueWithIdentifier("toView1", sender: nil)
    }

    /**
     自身のSegueを使って画面2へ移動する
     
     - parameter sender: btnToView2
     */
    @IBAction func toView2(sender: UIButton) {
        performSegueWithIdentifier("toView2", sender: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

