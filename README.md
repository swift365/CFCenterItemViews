# CFCenterItemViews

[![CI Status](http://img.shields.io/travis/chengfei.heng/CFCenterItemViews.svg?style=flat)](https://travis-ci.org/chengfei.heng/CFCenterItemViews)
[![Version](https://img.shields.io/cocoapods/v/CFCenterItemViews.svg?style=flat)](http://cocoapods.org/pods/CFCenterItemViews)
[![License](https://img.shields.io/cocoapods/l/CFCenterItemViews.svg?style=flat)](http://cocoapods.org/pods/CFCenterItemViews)
[![Platform](https://img.shields.io/cocoapods/p/CFCenterItemViews.svg?style=flat)](http://cocoapods.org/pods/CFCenterItemViews)

## Example
<img src="https://github.com/swift365/CFCenterItemViews/blob/master/Example/CFCenterItemViews/shot.png"  alt="效果展示" height="568" width="320" />

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

- iOS 8.0+
- Xcode8+
- Swift 3

## Use
```swift
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
            
            itemView.setup(imageView: imageView, label: label, gap:10.0)
            
            items.append(itemView)
        }
        
        itemViews.setup(items: items)
        containerView.addSubview(itemViews)
        
    }
```

## Installation

CFCenterItemViews is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "CFCenterItemViews"
```

## Author

chengfei.heng, hengchengfei@sina.com

## License

CFCenterItemViews is available under the MIT license. See the LICENSE file for more info.
