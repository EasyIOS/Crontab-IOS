Pod::Spec.new do |spec|
  spec.name             = 'Crontab-IOS'
  spec.version          = '1.0'
  spec.license          = { :type => 'MIT', :file => 'LICENSE' }
  spec.homepage         = 'https://github.com/EasyIOS/Crontab-IOS'
  spec.authors          = { 'zhuchao' => 'zhuchao@iosx.me' }
  spec.summary          = 'A light-weight library to execute Objective-C codes only once in app life with a crontab like way.'
  spec.source           = { :git => 'https://github.com/EasyIOS/Crontab-IOS.git', :tag => 1.0}
  spec.source_files     = 'class/*.{h,m}'
  spec.requires_arc     = true
  spec.ios.deployment_target = '5.0'
end