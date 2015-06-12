//
//  ResultViewController.swift
//  Quiz
//
//  Created by ohtatomotaka on 2015/02/10.
//  Copyright (c) 2015年 LifeisTech. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
     var correctAnswer:Int = 0
    
    @IBOutlet weak var score: UILabel!
    @IBOutlet weak var result: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        score.text = String(format: "%d/5正解", correctAnswer)
        
        if(correctAnswer == 5){
            result.text = "えくせれんと！"
        } else if(correctAnswer == 4){
            result.text = "惜しい人間だ！笑"
        } else if(correctAnswer == 3){
            result.text = "ふつー"
        } else if(correctAnswer == 2){
            result.text = "本気でやった？"
        } else {
            result.text = "今すぐ勉強しろ！"
        }
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
