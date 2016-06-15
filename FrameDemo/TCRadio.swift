//
//  TCRadio.swift
//  FrameDemo
//
//  Created by LingKangli on 16/6/15.
//  Copyright © 2016年 凌康丽. All rights reserved.
//

import UIKit

enum TCRadiosDir {
    case TCRadiosDirH
    case TCRadiosDirV
}

class TCRadio: UIControl {

    var radios:Array<TCRadioItem> = []
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setRadios(values:Array<String>,direction:TCRadiosDir,selectItem:Int){
        if direction == .TCRadiosDirH {
            for i in 0...values.count-1 {
                
                let view = TCRadioItem(frame: CGRect(x:CGFloat(i) * self.frame.size.width/CGFloat(values.count), y: 0, width: CGFloat(self.frame.size.width)/CGFloat(values.count), height: self.frame.size.height))
                view.tag = i
                view.addTarget(self, action:#selector(TCRadio.clickItem(_:)), forControlEvents: .TouchUpInside)
                view.setRadio(values[i], imageStr: "wxz", imageStrSelect: "xz")
                if i == selectItem {
                    view.setState(.TCRadioSelected)

                }else{
                    view.setState(.TCRadioNoSelected)
                }
                
                self.addSubview(view)
                radios.append(view)
            }
        }else{
            for i in 0...values.count-1 {
                let view = TCRadioItem(frame: CGRect(x:0, y:CGFloat(i) * self.frame.size.height/CGFloat(values.count), width: CGFloat(self.frame.size.width)/CGFloat(values.count), height: self.frame.size.height))
                view.tag = i
                view.addTarget(self, action:#selector(TCRadio.clickItem(_:)), forControlEvents: .TouchUpInside)
                if i == selectItem {
                    view.setState(.TCRadioSelected)
                    
                }else{
                    view.setState(.TCRadioNoSelected)
                }
                self.addSubview(view)
                radios.append(view)
            }
        }
    }
    
    func clickItem(sender:TCRadioItem) {
        print("tag is 、\(sender.tag)")
        
        for i  in 0...radios.count-1 {
            if sender.stateTCRadio == .TCRadioSelected {
                radios[i].setState(.TCRadioSelected)
            }else{
               radios[i].setState(.TCRadioNoSelected)
            }
        }
        
    }
}
