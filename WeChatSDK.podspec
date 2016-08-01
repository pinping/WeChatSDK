Pod::Spec.new do |s|
  s.name         = 'WeChatSDK'
  s.version      = '1.7.2'
  s.summary      = 'WeChatSDK Pod for Cocoapods convenience'
  s.description  = <<-DESC
                   This pod is used who want to use WeChatSDK with podfile.
                   DESC
  s.author       = 'https://open.weixin.qq.com'
  s.homepage     = 'https://open.weixin.qq.com'
  s.license      = {
      :type => 'LGPL',
      :file => "LICENSE"
  }
  s.platform     = :ios, '6.0'
  s.requires_arc = false

  s.source       = { :git => 'https://github.com/pinping/WeChatSDK.git', :tag => 'v#{spec.version}' }

  s.source_files   = "OpenSDK/**/*.h"
  s.preserve_paths = "OpenSDK/libWeChatSDK.a", "OpenSDK/README.txt"
  
  s.vendored_libraries = 'OpenSDK/libWeChatSDK.a'
  s.public_header_files = "OpenSDK/**/*.h"
  
  the_frameworks =  [
                      '"SystemConfiguration"',
                      '"CoreTelephony"'
                    ]
  the_ldflags    = '$(inherited) -lz -lsqlite3 -lc++ -framework ' + the_frameworks.join(' -framework ') + ''

  s.xcconfig = { 'OTHER_LDFLAGS' => the_ldflags }
end
