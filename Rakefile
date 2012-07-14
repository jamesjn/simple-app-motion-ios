$:.unshift("/Library/RubyMotion/lib")
require 'motion/project'
require 'bubble-wrap'
require 'motion-cocoapods'

Motion::Project::App.setup do |app|
  # Use `rake config' to see complete project settings.
  app.name = 'simpleapp'
  app.frameworks += ['libicucore.dylib', 'CFNetwork', 'Security']
  
  app.pods do
    pod 'socket.IO'
  end

end
