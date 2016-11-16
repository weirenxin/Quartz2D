//
//  DownloadVC.swift
//  Quartz2D
//
//  Created by weirenxin on 2016/11/15.
//  Copyright © 2016年 广西家饰宝科技有限公司. All rights reserved.
//

import UIKit

class DownloadVC: UIViewController {

    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var progressView: ProgressView!
    @IBOutlet weak var titleLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func valueChange(_ sender: UISlider) {
        
        titleLabel.text = String(format: "%.2f", sender.value * 100)
        progressView.progress = Double(sender.value)
    }
}
