//
//  ViewController.swift
//  DollarYen
//
//  Created by CHAW SU MON on 2020/06/08.
//  Copyright © 2020 CSM.ajl. All rights reserved.
//
import UIKit

class ViewController: UIViewController ,UITextFieldDelegate{
    
    // 入力金額を扱う変数
    var input = Double()
    // 換算後の金額を扱う変数
    var result = Double()
    // 変換レートを扱う変数
    var rate = Double()
    
    // 「円→ドル」or「ドル→円」の計算方法を記録するためのbool変数
    // 「円→ドル」ならば「true」、「ドル→円」ならば「false」
    var isYenToDollar = Bool()
    
    // 入力値の通貨の単位を表示するラベル（円 or ドル）
    @IBOutlet weak var inputCurrency: UILabel!
    // 金額を入力するテキストフィールドのインスタンス
    @IBOutlet weak var inputField: UITextField!
    // 「ドル→円」or「円→ドル」を選ぶためのSegmented Controlのインスタンス
    @IBOutlet weak var selector: UISegmentedControl!
    // 通貨レートを表示するラベル
    @IBOutlet weak var rateLabel: UILabel!
    // 換算後の通貨の単位を表示するラベル（円 or ドル）
    @IBOutlet weak var resultCurrency: UILabel!
    // 換算後の金額を表示するラベル
    @IBOutlet weak var resultLabel: UILabel!

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // 変換レートを設定（例：1ドルあたり80.5円）
        rate = 120.0
        // inputとresultを0に初期化
        input = 0
        result = 0
    
        // rateLabelの値をrateの値に応じて更新（小数点以下1桁まで）
        rateLabel.text = String(format: "%.1f", rate)
        // 初期状態の計算方法は「円→ドル」に設定
        isYenToDollar = true
        
        // inputFieldのDelegate通知をViewControllerで受け取る
        inputField.delegate = self
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // 通貨換算における計算処理
    func convert() {
        // 円→ドル変換の場合
        if isYenToDollar == true {
            // ドルの金額　＝　円の入力値を変換レートで割った値
            result = input / rate;
            // 小数点以下2桁までのみをresultLabelに表示
            resultLabel.text = String(format: "%.2f", result)
            // ドル→円変換の場合
        } else if isYenToDollar == false {
            // 円の金額　＝　ドルの入力値を変換レートで掛けた値
            result = input * rate;
            // 小数点以下を切り捨て、整数部分のみをresultLabelに表示
            resultLabel.text = String(format: "%.0f", result)
        }
    }
    
    @IBAction func changeCalcMethod(sender: AnyObject) {
        // 左側（円→ドル）が選択された場合（selectorの値が「0」のとき）
        if sender.selectedSegmentIndex == 0 {
            isYenToDollar = true
            inputCurrency.text = "円"
            resultCurrency.text = "ドル"
            // 右側（ドル→円）が選択された場合（selectorの値が「1」のとき）
        } else if sender.selectedSegmentIndex == 1 {
            isYenToDollar = false
            inputCurrency.text = "ドル"
            resultCurrency.text = "円"
        }
        // 通貨を変換
        self.convert()
    }
    
    // UITextFieldのキーボード上の「Return」ボタンが押された時に呼ばれる処理
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // 受け取った入力値（String型の文字列）をDoubleに変換し、inputに代入
        input = atof(textField.text!)
        // キーボードを閉じる
        textField.resignFirstResponder()
        //通貨を変換
        self.convert()
        return true
    }


}

