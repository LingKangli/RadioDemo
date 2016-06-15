
//
//  ViewController.swift
//  FrameDemo
//
//  Created by LingKangli on 16/6/15.
//  Copyright © 2016年 凌康丽. All rights reserved.
//

import UIKit

class ViewController: UIViewController{

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let radio = TCRadio(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
        radio.setRadios(["男","女"], direction:.TCRadiosDirH , selectItem: 0)
        radio.delegate = self
        self.view.addSubview(radio)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController:TCRadioItemDelegate{

    func clickRadio(str:String) {
        print("radio...\(str)")
    }
}

