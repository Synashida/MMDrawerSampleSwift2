//
//  LeftSideMenuViewController.swift
//  MMDrawerSampleSwift2
//
//  Created by ashida on 2016/06/26.
//  Copyright © 2016年 v-force.co.jp. All rights reserved.
//

import UIKit
import MMDrawerController

class LeftDrawerViewController: UIViewController {
    /// 画面1へ遷移するためのボタン
    @IBOutlet weak var btnToView1: UIButton!
    /// 画面2へ遷移するためのボタン
    @IBOutlet weak var btnToView2: UIButton!
    
    /**
     画面1へボタンをタップした時に呼び出され、画面1への遷移を実行する
     
     - parameter sender: タップされたボタンオブジェクト
     */
    @IBAction func toView1(sender: UIButton) {
        toView("toView1")
    }
    
    /**
     画面2へボタンをタップした時に呼び出され、画面2への遷移を実行する
     
     - parameter sender: タップされたボタンオブジェクト
     */
    @IBAction func toView2(sender: UIButton) {
        toView("toView2")
    }
    
    /**
     画面1 / 画面2への遷移が実行する関数
     MMDrawerControllerのcenterViewControllerからMainViewControllerを取得し、
     performSegueWithIdentifierでMainViewControllerのIdを利用して画面遷移する。
     MainViewのControllerのSegueを使うことで、サイドバーの画面内で切り替わらず、MainViewの画面が切り替わるようになる。
     
     - parameter segueId: StoryBardのMainViewControllerのSegueの各ID
     */
    func toView(segueId: String) {
        // CenterViewを取得し、CenterViewのSegueを使って画面遷移
        let mainView = (self.mm_drawerController.centerViewController as! UINavigationController).childViewControllers[0] as! MainViewController
        mainView.performSegueWithIdentifier(segueId,sender: nil)
        
        // サイドメニューを閉じる
        let appDelegate:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        appDelegate.centerContainer!.toggleDrawerSide(MMDrawerSide.Left,animated: true, completion:nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

