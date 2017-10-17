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
    var image_sec = 0
    
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
        
        if image_sec < 3 {
            let name = img[image_sec]
            
            let image = UIImage(named: name)!
            slideImg.image = image
            print("image_sec: \(image_sec)")
            self.image_sec += 1
        }else {
            self.image_sec = 0      // 写真を１枚目に戻す
            let name = img[image_sec]
            
            
            let image = UIImage(named: name)!
            slideImg.image = image
            print("image_sec: \(image_sec)")
            self.image_sec += 1
        }
    }
    
    //再生ボタン停止ボタン切り替え
    @IBOutlet weak var button: UIButton!
    
    // true : 再生中,  false : 停止中
    // !=nil : 再生中, ==nil : 停止中
    var isPlaying = false
    
    @IBAction func onButton(_ sender: Any) {
        
        if isPlaying {
            button.setTitle("Play", for: UIControlState.normal)
            
            // 現在のタイマーを破棄する
            self.timer.invalidate()
            isPlaying = false          // startTimer() の timer == nil で判断するために、 timer = nil としておく
            self.image_sec = 0       // 写真を１枚目に戻す ?

        } else {
            button.setTitle("Stop", for: UIControlState.normal)
            
            // タイマーの作成、始動
            self.timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
            isPlaying = true

        }
    }
    
    
    var FFimage_sec = 0
    @IBAction func FFbtn(_ sender: Any) {
        //現在のimage_secよりも一つ進める
        
        var image:UIImage?
        
        if isPlaying == false {
            if FFimage_sec < 3 {
                let name = img[FFimage_sec]
                image = UIImage(named: name)!
                slideImg.image = image
                print("FFimage_sec: \(FFimage_sec)")
                self.FFimage_sec += 1
            }else {
                FFimage_sec = 0
                
                let name = img[FFimage_sec]
                image = UIImage(named: name)!
                slideImg.image = image
                print("FFimage_sec: \(FFimage_sec)")
                self.FFimage_sec += 1
            }
        }
        
    }
    
    
    @IBAction func Rewbtn(_ sender: Any) {
        //現在のimage_secよりも一つ進める
        var image:UIImage?
        
        if isPlaying == false  {
            if 0 <= FFimage_sec, FFimage_sec < 3 {
                let name = img[FFimage_sec]
                image = UIImage(named: name)!
                slideImg.image = image
                print("FFimage_sec: \(FFimage_sec)")
                self.FFimage_sec -= 1
            }else {
                FFimage_sec = 2
                
                let name = img[FFimage_sec]
                image = UIImage(named: name)!
                slideImg.image = image
                print("FFimage_sec: \(FFimage_sec)")
                self.FFimage_sec -= 1
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // segueから遷移先のResultViewControllerを取得する
        let resultViewController:ResultViewController = segue.destination as! ResultViewController
        // 遷移先のResultViewControllerで宣言しているx, yに値を代入して渡す（写真の値）
        if isPlaying {
            self.image_sec -= 1
            let name = img[image_sec]
            print("image_sec: \(image_sec)")
            let image = UIImage(named: name)!
            
            resultViewController.x = image
            
            /*if 0 <= image_sec, image_sec < 3 {
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
            }*/
        }else {
            if 0<FFimage_sec {
                self.FFimage_sec -= 1
            }else {
                self.FFimage_sec = 0
            }
            
            let name = img[FFimage_sec]
            print("FFimage_sec: \(FFimage_sec)")
            let image = UIImage(named: name)!
            
            resultViewController.x = image
        }
        
    }
    
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
        // 他の画面から segue を使って戻ってきた時に呼ばれる
    }

}

