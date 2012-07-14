$:.unshift("/Library/RubyMotion/lib")
require 'motion/project'
require 'bubble-wrap'
require 'motion-cocoapods'

Motion::Project::App.setup do |app|
  # Use `rake config' to see complete project settings.
  app.name = 'simpleapp'
  app.frameworks += ['libicucore.dylib', 'CFNetwork', 'Security']
  
  app.pods do
    dependency 'SocketRocket'
    dependency 'SBJson'
  end

  app.vendor_project( "vendor/socketio", :static,
                      :products => ['libsocketio.a'])
end
