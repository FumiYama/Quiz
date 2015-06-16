//
//  QuizViewController.swift
//  Quiz
//
//  Created by ohtatomotaka on 2015/02/10.
//  Copyright (c) 2015年 LifeisTech. All rights reserved.
//

import UIKit

class QuizViewController: UIViewController {
    //出題数
    var questionNumber:Int = 5
    
    //現在の問題数
    var sum:Int = 0
    
    //正解数
    var correctAnswer:Int = 0
    
    //乱数
    var random:Int = 0
    
    //クイズを格納する配列
    var quizArray = [NSMutableArray]()
    
    // それぞれ一度見たものをonceShowとしてBool型をfalseで定義
    var onceShow0: Bool = false
    var onceShow1: Bool = false
    var onceShow2: Bool = false
    var onceShow3: Bool = false
    var onceShow4: Bool = false
    var onceShow5: Bool = false
    
    //クイズを表示するTextView
    @IBOutlet var quizTextView: UITextView!
    
    //選択肢のボタン
    @IBOutlet var choiceButtons: Array<UIButton>!


    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //------------------------ここから下にクイズを書く------------------------//
        
        quizArray.append(["アメリカの首都は？","ワシントンD.C.","二ューヨーク","ロサンゼルス",1,0])
        quizArray.append(["トルコの首都は？","カッパドキア","イスタンブール","アンカラ",3,1])
        quizArray.append(["スイスの首都は？","ジュネーブ","ベルン","チューリヒ",2,2])
        quizArray.append(["カナダの首都は？","オタワ","トロント","バンクーバー",1,3])
        quizArray.append(["ブラジルの首都は？","ブラジリア","リオデジャネイロ","サンパウロ",2,4])
        quizArray.append(["オーストラリアの首都は？","キャンベラ","シドニー","メルボルン",1,5])
        
        //------------------------ここから下にクイズを書く------------------------//
        choiceQuiz()
        
    }
    
    func choiceQuiz() {
        println(quizArray.count)
        //クイズの問題文をシャッフルしてTextViewにセット
        random = Int(arc4random_uniform(UInt32(quizArray.count)))
        quizTextView.text = quizArray[random][0] as! String
        
        if quizArray[random] == quizArray[0]{
            onceShow0 = true
        } else if quizArray[random] == quizArray[1]{
            onceShow1 = true
        } else if quizArray[random] == quizArray[2]{
            onceShow2 = true
        } else if quizArray[random] == quizArray[3]{
            onceShow3 = true
        } else if quizArray[random] == quizArray[4]{
            onceShow4 = true
        } else if quizArray[random] == quizArray[5]{
            onceShow5 = true
        }
        
        //選択肢のボタンにそれぞれ選択肢のテキストをセット
        for var i = 0; i < choiceButtons.count; i++ {
            choiceButtons[i].setTitle(quizArray[random][i+1] as? String, forState: .Normal)
            
            //どのボタンが押されたか判別するためのtagをセット
            choiceButtons[i].tag = i + 1;
        }
        
        //ヒントの表示
        
    }
    
    @IBAction func choiceAnswer(sender: UIButton) {
        sum++
        println("random \(random)")
        if quizArray[random][4] as! Int == sender.tag {
            //正解数を増やす
            correctAnswer++
        }
        
        //解いた問題数の合計が予め設定していた問題数に達したら結果画面へ
        if sum == questionNumber {
            performSegueToResult()
        }
        self.hintImageView.hidden = true
        quizArray.removeAtIndex(random)
        choiceQuiz()
    }
    
    
    @IBOutlet weak var hintImageView: UIImageView!
    // ImageView の連結

    @IBAction func hintbutton() {
        self.hintImageView.hidden = false
        
        if quizArray[random][5] as! Int == 0 {
            hintImageView.image = UIImage(named: "wa.jpg" )
            self.view.addSubview(hintImageView)
        } else if quizArray[random][5] as! Int == 1 {
            hintImageView.image = UIImage(named: "ankara.png" )
            self.view.addSubview(hintImageView)
        } else if quizArray[random][5] as! Int == 2 {
            hintImageView.image = UIImage(named: "bern.jpg" )
            self.view.addSubview(hintImageView)
        } else if quizArray[random][5] as! Int == 3 {
            hintImageView.image = UIImage(named: "ottawa.jpg" )
            self.view.addSubview(hintImageView)
        } else if quizArray[random][5] as! Int == 4 {
            hintImageView.image = UIImage(named: "rio.jpg" )
            self.view.addSubview(hintImageView)
        } else if quizArray[random][5] as! Int == 5 {
            hintImageView.image = UIImage(named: "can.jpg" )
            self.view.addSubview(hintImageView)
        } else {
            hintImageView.image = UIImage(named: "tokyo.jpg" )
            self.view.addSubview(hintImageView)
        }
    }
    
    func performSegueToResult() {
        performSegueWithIdentifier("toResultView", sender: nil)
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if (segue.identifier == "toResultView") {
            
            var ResultView : ResultViewController = segue.destinationViewController as! ResultViewController

            ResultView.correctAnswer = self.correctAnswer
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}


