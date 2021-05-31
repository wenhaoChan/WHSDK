Pod::Spec.new do |s|
  s.name = "WHSDK"
  s.version = "1.0.0"
  s.summary = "WHSDK."
  s.license = {"type"=>"MIT", "file"=>"LICENSE"}
  s.authors = {"wenhaoChan"=>"695373135@qq.com"}
  s.homepage = "https://github.com/wenhaoChan/WHSDK"
  s.description = "WHSDK."
  s.requires_arc = true
  s.source = { :path => '.' }

  s.ios.deployment_target    = '10.0'
  s.ios.vendored_framework   = 'ios/WHSDK.embeddedframework/WHSDK.framework'
end
