//
//  ViewController.swift
//  counter
//
//  Created by CHAW SU MON on 2020/06/05.
//  Copyright © 2020 CSM.ajl. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var countLabel: UILabel!
    // 合計値を管理する「変数」
    var count = Int()
    // ラベル用の文字列を管理する「インスタンス」
    var countLabelText = String()
    override func viewDidLoad() {
        super.viewDidLoad()

        //画面起動時に呼ばれる処理
        // 画面起動時にcountを0に初期化
            count = 0
        }

    

    @IBAction func plusPushed(_ sender: Any) {
        count=count+1
        // ラベル用に文字列を用意
        countLabelText = "\(count)"
        // countLabelの値を更新
        countLabel.text = countLabelText
        // countの大小に応じて、ラベルの色を変更
        if count >= 0 && count < 10 {
            countLabel.textColor = UIColor.black
        } else if count >= 10 && count < 20 {
            countLabel.textColor = UIColor.green
        } else if count >= 20 && count < 30 {
            countLabel.textColor = UIColor.yellow
        } else {
            countLabel.textColor = UIColor.red
        }
    }
    
    @IBAction func minusPushed(_ sender: Any) {

          if count > 0 {
              // countから1を減算
              count = count - 1
          }
          // ラベル用に文字列を用意
          countLabelText = "\(count)"
          // countLabelの値を更新
          countLabel.text = countLabelText
        if count >= 0 && count < 10 {
            countLabel.textColor = UIColor.black
        } else if count >= 10 && count < 20 {
            countLabel.textColor = UIColor.green
        } else if count >= 20 && count < 30 {
            countLabel.textColor = UIColor.yellow
        } else {
            countLabel.textColor = UIColor.red
        }
    
    }
    
    @IBAction func resetPushed(_ sender: Any) {
        // countを0に初期化
           count = 0
           // ラベル用に文字列を用意し、ラベルを更新
           countLabelText = "\(count)"
           countLabel.text = countLabelText
        countLabel.textColor = UIColor.white
    }
    
    override func didReceiveMemoryWarning() {
           super.didReceiveMemoryWarning()
           // Dispose of any resources that can be recreated.
       }
    
}

