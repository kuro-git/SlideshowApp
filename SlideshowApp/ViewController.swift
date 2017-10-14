//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 中島慎太郎 on 2017/10/08.
//  Copyright © 2017年 kuro-git. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var slideImgBtn: UIButton!
    
    var img = ["SlideshowApp_sampleImg_01", "SlideshowApp_sampleImg_02", "SlideshowApp_sampleImg_03",]
    
    @IBOutlet weak var slideImg: UIImageView!
    
    var timer: Timer!
    // 写真の配列のための変数
    var image_sec = -1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // selector: #selector(updatetimer) で指定された関数
    // timeInterval: 2, repeats: true で指定された通り、2秒毎に呼び出され続ける
    
    func updateTimer(timer: Timer) {
        self.image_sec += 1
        
        if image_sec < 3 {
            let name = img[image_sec]
            
            let image = UIImage(named: name)!
            slideImg.image = image
        }else {
            self.image_sec = -1      // 写真を１枚目に戻す
        }
    }
    
    //まず再生ボタンと停止ボタンを切り分けて考える
    /*@IBAction func playButton(_ sender: Any) {
        if timer == nil {
            // タイマーの作成、始動
            self.timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        }
    }

    @IBAction func pauseTimer(_ sender: Any) {
        if self.timer != nil {
            self.timer.invalidate()   // 現在のタイマーを破棄する
            self.timer = nil          // startTimer() の timer == nil で判断するために、 timer = nil としておく
            self.image_sec = -1       // 写真を１枚目に戻す
        }
    }*/
    
    //再生ボタン停止ボタン切り替え
    @IBOutlet weak var button: UIButton!
    
    // true : 再生中,  false : 停止中
    var isPlaying = false
    
    @IBAction func onButton(_ sender: Any) {
        
        if isPlaying {
            button.setTitle("停止", for: UIControlState.normal)
            isPlaying = false
            
            if self.timer != nil {
                self.timer.invalidate()   // 現在のタイマーを破棄する
                self.timer = nil          // startTimer() の timer == nil で判断するために、 timer = nil としておく
                self.image_sec = -1       // 写真を１枚目に戻す
            }

        } else {
            button.setTitle("再生", for: UIControlState.normal)
            isPlaying = true
            
            if timer == nil {
                // タイマーの作成、始動
                self.timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
            }
        }
    }
    
    
    var FFimage_sec = -1
    @IBAction func FFbtn(_ sender: Any) {
        //現在のimage_secよりも一つ進める
        self.FFimage_sec += 1
        var image:UIImage?
        
        if timer == nil {
            if FFimage_sec < 3 {
                let name = img[FFimage_sec]
                image = UIImage(named: name)!
            }else {
                FFimage_sec = -1
            }
            
            slideImg.image = image
        }
        
    }
    
    /*var Rewimage_sec = 3
    @IBAction func Rewbtn(_ sender: Any) {
        //現在のimage_secよりも一つ進める
        self.Rewimage_sec -= 1
        var image:UIImage?
        
        if timer == nil {
            if 0 <= Rewimage_sec, Rewimage_sec < 3 {
                let name = img[Rewimage_sec]
                image = UIImage(named: name)!
            }else {
                Rewimage_sec = 3
            }
            
            slideImg.image = image
        }
    }*/
    
    @IBAction func Rewbtn(_ sender: Any) {
        //現在のimage_secよりも一つ進める
        self.FFimage_sec -= 1
        var image:UIImage?
        
        if timer == nil {
            if 0 <= FFimage_sec, FFimage_sec < 3 {
                let name = img[FFimage_sec]
                image = UIImage(named: name)!
            }else {
                FFimage_sec = 3
            }
            
            slideImg.image = image
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // segueから遷移先のResultViewControllerを取得する
        let resultViewController:ResultViewController = segue.destination as! ResultViewController
        // 遷移先のResultViewControllerで宣言しているx, yに値を代入して渡す（写真の値）
        if timer != nil {
            if 0 <= image_sec, image_sec < 3 {
                let name = img[image_sec]
                let image = UIImage(named: name)!
                
                resultViewController.x = image
            }else if image_sec < 0 {
                self.image_sec += 1
                
                let name = img[image_sec]
                let image = UIImage(named: name)!
                
                resultViewController.x = image
            }else {
                self.image_sec -= 1
                
                let name = img[image_sec]
                let image = UIImage(named: name)!
                
                resultViewController.x = image
            }
        }else {
            let name = img[FFimage_sec]
            let image = UIImage(named: name)!
            
            resultViewController.x = image
        }
        
    }
    
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
        // 他の画面から segue を使って戻ってきた時に呼ばれる
    }

}

