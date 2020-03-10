#
# Be sure to run `pod lib lint SHCommonElement.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#


Pod::Spec.new do |s|
  #库名
  s.name             = 'SHCommonElement'
  #库版本

  s.version          = '0.1.7'

  #库简短描述
  s.summary          = 'SHCommonElement pod Use'
  #库详细描述
  s.description      = <<-DESC
TODO: SHCommonElement pod Use.
                       DESC

  #库介绍主页地址
  s.homepage         = 'https://github.com/wangshaohuiGH'
  #库开源许可
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  #作者信息
  s.author           = { 'wangsh' => 'wangshaohui_get@163.com' }
  #源码git地址
  s.source           = { :git => 'https://github.com/wangshaohuiGH/SHCommonElement.git', :tag => s.version.to_s }

  #库依赖系统版本
  s.ios.deployment_target = '8.0'
  #源码文件配置
  s.source_files = 'SHCommonElement/Classes/**/*'

  #源码头文件配置
  s.public_header_files = 'SHCommonElement/Classes/*.h'
  #系统框架依赖
  s.frameworks = 'UIKit'
  

end
