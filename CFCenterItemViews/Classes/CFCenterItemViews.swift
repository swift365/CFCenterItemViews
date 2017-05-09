//
//  CFCenterItemViews.swift
//  ChengfeiSoft
//
//  QQ:58551038
//  Created by chengfei.heng on 1/6/17.
//  Copyright © 2017 chengfei.heng. All rights reserved.
//

import UIKit

public class CFCenterItemViews: UIView {
    
    public var touchHandler:((_ index:Int) -> Void)?
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    public func setup(items:[CFCenterItemView]){
        let itemWidth = self.frame.size.width / CGFloat(items.count)
        
        for (i,v) in items.enumerated() {
            v.tag = i
            let gesture = UITapGestureRecognizer(target: self, action: #selector(handler(tap:)))
            v.addGestureRecognizer(gesture)
            
            let x = itemWidth * CGFloat(i)
            
            let frame =  CGRect(x: x, y: 0, width: itemWidth, height: self.frame.size.height)
            v.frame = frame
            self.addSubview(v)
        }
    }
    
    func handler(tap:UITapGestureRecognizer){
        if touchHandler != nil {
            touchHandler!(tap.view!.tag)
        }
    }
}

public class CFCenterItemView: UIView {
    public override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /**
     组装显示的图片和标签
     
     - parameter topView: UIImageView....
     - parameter label: UILabel
     - Parameter gap: 文字与图片之间的间距
     */
    public func setup(topView:UIView,label:UILabel,subLabel:UILabel? = nil,gap:CGFloat,subGap:CGFloat? = 0.0){
        self.addSubview(topView)
        self.addSubview(label)
        if subLabel != nil {
            self.addSubview(subLabel!)
            subLabel?.isUserInteractionEnabled = false
            subLabel?.translatesAutoresizingMaskIntoConstraints = false
        }
        
        topView.isUserInteractionEnabled = false
        label.isUserInteractionEnabled = false
        
        topView.translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false
        
        var views: [String:Any] = ["view":self , "top":topView,"lbl":label]
        
        if subLabel != nil {
            views["subLbl"] = subLabel!
            subLabel?.sizeToFit()
        }
        
        let imgH = NSLayoutConstraint(item: topView,
                                      attribute: .centerX,
                                      relatedBy: .equal,
                                      toItem: self,
                                      attribute: .centerX,
                                      multiplier: 1.0,
                                      constant: 0)
        
        label.sizeToFit() //原始label的大小(一定要有)
        
        var top = (self.frame.size.height - topView.frame.size.height - gap - label.frame.size.height) / 2.0
        if subLabel != nil {
            top = (self.frame.size.height - topView.frame.size.height - gap - label.frame.size.height - subLabel!.frame.size.height - subGap!) / 2.0
        }
        
        let imgVV = "V:|-" + "\(top)" +  "-[top]"
        let imgV = NSLayoutConstraint.constraints(withVisualFormat: imgVV , options:NSLayoutFormatOptions.init(rawValue: 0), metrics: nil, views: views)
        
        let lblV = NSLayoutConstraint(item: label, attribute: .top, relatedBy: .equal, toItem: topView, attribute: .bottom, multiplier: 1.0, constant: gap)
        
        let lblH = NSLayoutConstraint(item: label, attribute: .centerX, relatedBy: .equal, toItem: topView, attribute: .centerX, multiplier: 1.0, constant: 0)
        
        if subLabel != nil {
            let subLblV = NSLayoutConstraint(item: subLabel!, attribute: .top, relatedBy: .equal, toItem: label, attribute: .bottom, multiplier: 1.0, constant: subGap!)
            
            let subLblH = NSLayoutConstraint(item: subLabel!, attribute: .centerX, relatedBy: .equal, toItem: topView, attribute: .centerX, multiplier: 1.0, constant: 0)
            self.addConstraint(subLblV)
            self.addConstraint(subLblH)
        }
        
        self.addConstraints(imgV)
        self.addConstraint(imgH)
        self.addConstraint(lblV)
        self.addConstraint(lblH)
    }
}
