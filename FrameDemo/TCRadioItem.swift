//
//  TCRadioItem.swift
//  FrameDemo
//
//  Created by LingKangli on 16/6/15.
//  Copyright © 2016年 凌康丽. All rights reserved.
//

import UIKit

enum TCRadioItemSelect {
    case TCRadioSelected
    case TCRadioNoSelected
}

class TCRadioItem: UIControl {

    var imageStr = ""
    var imageStrSelect = ""
    var image : UIImageView?
    var titleStr = ""
    var stateTCRadio : TCRadioItemSelect?
    var delegate : TCRadioItemDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setRadio(str:String,imageStr:String,imageStrSelect:String) {
        
        self.imageStr = imageStr
        self.imageStrSelect = imageStrSelect
        self.titleStr = str
        
        image = UIImageView(image: UIImage(named: imageStr))
        image!.frame = CGRect(x: 0, y: 0, width: self.frame.size.width*0.2, height: self.frame.size.width*0.2)
        image!.center = CGPoint(x: image!.frame.size.width/2, y: self.frame.size.height/2)
        self.addSubview(image!)
        
        let lab = UILabel(frame: CGRect(x: CGRectGetMaxX(image!.frame), y: 0, width: self.getLabWidth("100", font: UIFont.systemFontOfSize(14), height: 40), height: 50))
        lab.font = UIFont.systemFontOfSize(14)
        lab.text = str
        lab.numberOfLines = 0
        lab.lineBreakMode = .ByCharWrapping
        self.addTarget(self, action: #selector(click), forControlEvents: .TouchUpInside)
        self.addSubview(lab)
    }
    
    func setState(state:TCRadioItemSelect) {
        if state == .TCRadioNoSelected {
            image?.image = UIImage(named: self.imageStr)
            stateTCRadio = state
        }else{
            image?.image = UIImage(named: self.imageStrSelect)
            stateTCRadio = state
        }
    }
    
    func click()  {
        stateTCRadio = .TCRadioSelected
        image?.image = UIImage(named: self.imageStrSelect)
    }
    
    func getLabWidth(labelStr:String,font:UIFont,height:CGFloat) -> CGFloat {
        let statusLabelText: NSString = labelStr
        let size = CGSizeMake(900, height)
        let dic = NSDictionary(object: font, forKey: NSFontAttributeName)
        let strSize = statusLabelText.boundingRectWithSize(size, options: .UsesLineFragmentOrigin, attributes: dic as? [String : AnyObject], context: nil).size
        return strSize.width
    }
}
