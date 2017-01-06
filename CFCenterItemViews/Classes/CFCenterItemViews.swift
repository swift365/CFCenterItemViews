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
 
      - parameter imageView: UIImageView
      - parameter label: UILabel
      - Parameter gap: 文字与图片之间的间距
    */
    public func setup(imageView:UIImageView,label:UILabel,gap:CGFloat){
        self.addSubview(imageView)
        self.addSubview(label)
        
        imageView.isUserInteractionEnabled = false
        label.isUserInteractionEnabled = false
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false
        
        let views: [String:Any] = ["view":self , "img":imageView,"lbl":label]
        
        let imgH = NSLayoutConstraint(item: imageView,
                                      attribute: .centerX,
                                      relatedBy: .equal,
                                      toItem: self,
                                      attribute: .centerX,
                                      multiplier: 1.0,
                                      constant: 0)
        
        label.sizeToFit() //原始label的大小(一定要有)
        
        let top = (self.frame.size.height - imageView.frame.size.height - gap - label.frame.size.height) / 2.0
        
        let imgVV = "V:|-" + "\(top)" +  "-[img]"
        let imgV = NSLayoutConstraint.constraints(withVisualFormat: imgVV , options:NSLayoutFormatOptions.init(rawValue: 0), metrics: nil, views: views)
        
        let lblV = NSLayoutConstraint(item: label, attribute: .top, relatedBy: .equal, toItem: imageView, attribute: .bottom, multiplier: 1.0, constant: gap)
        
        let lblH = NSLayoutConstraint(item: label, attribute: .centerX, relatedBy: .equal, toItem: imageView, attribute: .centerX, multiplier: 1.0, constant: 0)
        
        self.addConstraints(imgV)
        self.addConstraint(imgH)
        self.addConstraint(lblV)
        self.addConstraint(lblH)
    }
}
