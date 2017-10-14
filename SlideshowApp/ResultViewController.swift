//
//  ResultViewController.swift
//  SlideshowApp
//
//  Created by 中島慎太郎 on 2017/10/10.
//  Copyright © 2017年 kuro-git. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet weak var viewExpansion: UIImageView!
    
    // 受け取るためのプロパティ（変数）を宣言しておく
    var x:UIImage?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        viewExpansion.image = x
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
