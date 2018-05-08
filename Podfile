platform :ios, '10.0'

target 'challenge-ios' do

  use_frameworks!
  inhibit_all_warnings!

  pod 'RxSwift'
  pod 'RxCocoa' 
  pod 'NSObject+Rx'
  pod 'RxOptional'
  pod 'Moya'
  pod 'Moya/RxSwift'
  pod 'Moya-ObjectMapper/RxSwift'
  pod 'SwiftGen'
  pod 'Kingfisher'
  pod 'SwifterSwift’
  pod 'Hero'
  pod 'Cosmos', '~> 15.0'

end

post_install do |installer|
 installer.pods_project.targets.each do |target|
   target.build_configurations.each do |config|
     config.build_settings['SWIFT_VERSION'] = '4.1'
   end
 end

 Dir.glob(installer.sandbox.target_support_files_root + "Pods-*/*.sh").each do |script|
    flag_name = File.basename(script, ".sh") + "-Installation-Flag"
    folder = "${TARGET_BUILD_DIR}/${UNLOCALIZED_RESOURCES_FOLDER_PATH}"
    file = File.join(folder, flag_name)
    content = File.read(script)
    content.gsub!(/set -e/, "set -e\nKG_FILE=\"#{file}\"\nif [ -f \"$KG_FILE\" ]; then exit 0; fi\nmkdir -p \"#{folder}\"\ntouch \"$KG_FILE\"")
    File.write(script, content)
  end
end
