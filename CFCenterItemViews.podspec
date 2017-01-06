Pod::Spec.new do |s|
s.name = 'CFCenterItemViews'
s.version = '0.0.1'
s.license= { :type => "MIT", :file => "LICENSE" }
s.summary = 'CFCenterItemViews is a Swift module for subViews to uiview.'
s.homepage = 'https://github.com/swift365/CFCenterItemViews'
s.authors = { 'chengfei.heng' => 'hengchengfei@sina.com' }
s.source = { :git => 'https://github.com/swift365/CFCenterItemViews.git', :tag => "0.0.1"  }
s.ios.deployment_target = '8.0' #支持的版本号
s.source_files = "CFCenterItemViews/Classes/*.swift", "CFCenterItemViews/Classes/**/*.swift"  #包含的source文件
end
