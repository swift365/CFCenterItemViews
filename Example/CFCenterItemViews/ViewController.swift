//
//  ViewController.swift
//  CFCenterItemViews
//
//  Created by chengfei.heng on 01/06/2017.
//  Copyright (c) 2017 chengfei.heng. All rights reserved.
//

import UIKit
import CFCenterItemViews

class ViewController: UIViewController {

    @IBOutlet weak var containerView:UIView!
    
    
    let topItems = ["home_top_0":"你的优选",
                    "home_top_1":"专属推荐",
                    "home_top_2":"下午茶",
                    "home_top_3":"商家活动"].sorted(by: {return $0.0 < $1.0})
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "平均分布"
        
        var items:[CFCenterItemView] = []
        let itemViews = CFCenterItemViews(frame: CGRect(x: 0, y: 0, width: containerView.frame.size.width, height: containerView.frame.size.height))
        itemViews.touchHandler = { index in
            print(index)
        }
        
        for (key,value) in topItems {
            let itemView = CFCenterItemView(frame: CGRect(x: 0, y: 0, width: 0, height: itemViews.frame.size.height))
            itemView.backgroundColor = UIColor.white
            
            let imageView = UIImageView(image: UIImage(named: key))
            let label = UILabel()
            label.text = value
            label.font = UIFont.systemFont(ofSize: 15)
            label.textColor = UIColor.black
            
            itemView.setup(topView: imageView, label: label, gap:10.0)
            
            items.append(itemView)
        }
        
        itemViews.setup(items: items)
        containerView.addSubview(itemViews)
        
    }

}

